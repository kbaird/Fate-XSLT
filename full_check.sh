#!/bin/bash

XSPEC_TARBALL=https://github.com/xspec/xspec/archive/refs/tags/v4.0.3.tar.gz
SAXON_JAR=https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/12.5/Saxon-HE-12.5.jar
XMLRESOLVER_JAR=https://repo1.maven.org/maven2/org/xmlresolver/xmlresolver/6.1.0/xmlresolver-6.1.0.jar

failures=0
fail() {
  echo "FAIL: $*"
  failures=$((failures + 1))
}

report() { echo "PASS: $*"; }

# Install XSpec and Saxon, as in .github/workflows/xspec.yml
mkdir -p tools
[ -x tools/xspec/bin/xspec.sh ] || {
  curl -fsSLo tools/xspec.tgz $XSPEC_TARBALL || { echo "cannot fetch xspec"; exit 1; }
  tar -xzf tools/xspec.tgz -C tools || { echo "cannot unpack xspec"; exit 1; }
  mv tools/xspec-4.0.3 tools/xspec
  chmod +x tools/xspec/bin/xspec.sh
}
[ -f tools/Saxon-HE.jar ] || curl -fsSLo tools/Saxon-HE.jar $SAXON_JAR || { echo "cannot fetch Saxon"; exit 1; }
[ -f tools/xmlresolver.jar ] || curl -fsSLo tools/xmlresolver.jar $XMLRESOLVER_JAR || { echo "cannot fetch xmlresolver"; exit 1; }

export SAXON_CP="$PWD/tools/Saxon-HE.jar:$PWD/tools/xmlresolver.jar"

# Check character XML validity, as in .github/workflows/xmllint.yml
find characters -name '*.xml' -print0 | xargs -0 -r xmllint --noout --valid \
  && report "character XML validity" \
  || fail "character XML validity"

# 1. Every .xsl is well-formed and every supported entry point compiles.
find xslt -name '*.xsl' -print0 | xargs -0 -r xmllint --noout \
  && report "stylesheet well-formedness" \
  || fail "stylesheet well-formedness"
printf '<root/>' > "${TMPDIR:-/tmp}/fate-xsl-empty.xml"
for f in xslt/*.xsl; do
  java -cp "$SAXON_CP" net.sf.saxon.Transform \
    -xsl:"$f" -s:"${TMPDIR:-/tmp}/fate-xsl-empty.xml" -o:/dev/null \
    >/dev/null 2>&1 \
    && true \
    || fail "entry point does not compile: $f"
done
[ "$failures" -ne 0 ] || report "entry point compilation"

# 2-5. Static stylesheet graph and character processing-instruction checks.
if STATIC=$(python3 check-stylesheets.py "$PWD"); then
  report "stylesheet graph and character processing-instruction checks"
else
  echo "$STATIC"
  fail "stylesheet graph and character processing-instruction checks"
fi

# Negative tests for the static checks: each error path must be caught.
if ./check-stylesheets-negative.sh; then
  report "stylesheet negative tests"
else
  fail "stylesheet negative tests"
fi

# 6-7. Cross-processor publishing and full-page fixture checks.
if ./render-check.sh; then
  report "xsltproc rendering and full-page fixture assertions"
else
  fail "xsltproc rendering and full-page fixture assertions"
fi

# Run the XSpec suite, as in .github/workflows/xspec.yml
for f in tests/xspec/*.xspec; do
  tools/xspec/bin/xspec.sh -c -e "$f" >/dev/null 2>&1 \
    && true \
    || fail "xspec: $f"
done
[ "$failures" -ne 0 ] || report "xspec suite"

# Generate JUnit reports from the results; xspec.sh omits them when -c is used
for f in tests/xspec/xspec/*-result.xml; do
  name=$(basename "$f" -result.xml)
  java -cp "$SAXON_CP" net.sf.saxon.Transform \
    -s:"$f" -xsl:"$PWD/tools/xspec/src/reporter/junit-report.xsl" \
    -o:"$PWD/tests/xspec/xspec/${name}-junit.xml" \
    >/dev/null 2>&1 \
    && true \
    || fail "junit report: $f"
done

if [ "$failures" -ne 0 ]; then
  echo "failed: $failures check(s) failed"
  exit 1
fi
echo "passed"
