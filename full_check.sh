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
STATIC=$(python3 - "$PWD" <<'PY'
import os, re, sys

root = sys.argv[1]
errors = []

def rel(p):
    return os.path.relpath(p, root)

stylesheets = []
for dirpath, _dirs, names in os.walk(os.path.join(root, "xslt")):
    for name in names:
        if name.endswith(".xsl"):
            stylesheets.append(os.path.join(dirpath, name))
stylesheets = sorted(stylesheets)
stylesheet_set = set(stylesheets)

def targets_for(pattern, text, f):
    found = []
    for m in pattern.finditer(text):
        tgt = os.path.normpath(os.path.join(os.path.dirname(f), m.group(1)))
        if tgt not in stylesheet_set:
            errors.append("missing include/import target: %s -> %s"
                          % (rel(f), m.group(1)))
        else:
            found.append(tgt)
    return found

include_re = re.compile(r'<xsl:include\b[^>]*href="([^"]+)"')
import_re = re.compile(r'<xsl:import\b[^>]*href="([^"]+)"')
includes = {}
imports = {}
for f in stylesheets:
    text = open(f, encoding="utf-8", errors="replace").read()
    includes[f] = targets_for(include_re, text, f)
    imports[f] = targets_for(import_re, text, f)

entries = sorted(os.path.join(root, "xslt", name)
                 for name in os.listdir(os.path.join(root, "xslt"))
                 if name.endswith(".xsl"))

# 3. No module is reachable twice through xsl:include from any entry point.
for entry in entries:
    seen = set()
    stack = [entry]
    while stack:
        node = stack.pop()
        if node in seen:
            continue
        seen.add(node)
        stack.extend(includes[node])

for entry in entries:
    visits = {}
    stack = [entry]
    while stack:
        node = stack.pop()
        visits[node] = visits.get(node, 0) + 1
        if visits[node] > 1:
            errors.append("module included more than once from %s: %s"
                          % (rel(entry), rel(node)))
            continue
        stack.extend(includes[node])

# 4. Unreachable modules are reported (include and import edges).
reachable = set()
stack = list(entries)
while stack:
    node = stack.pop()
    if node in reachable:
        continue
    reachable.add(node)
    stack.extend(includes[node])
    stack.extend(imports[node])
for f in stylesheets:
    if f not in reachable:
        errors.append("unreachable stylesheet: %s" % rel(f))

# 5. Every character xml-stylesheet target exists.
pi_re = re.compile(r'<\?xml-stylesheet\b[^>]*href="([^"]+)"')
for dirpath, _dirs, names in os.walk(os.path.join(root, "characters")):
    for name in sorted(names):
        if not name.endswith(".xml"):
            continue
        f = os.path.join(dirpath, name)
        text = open(f, encoding="utf-8", errors="replace").read()
        m = pi_re.search(text)
        if m is None:
            errors.append("character without xml-stylesheet PI: %s" % rel(f))
            continue
        tgt = os.path.normpath(os.path.join(dirpath, m.group(1)))
        if not os.path.exists(tgt):
            errors.append("character points at missing stylesheet: %s -> %s"
                          % (rel(f), m.group(1)))

for e in errors:
    print(e)
if errors:
    sys.exit(1)
PY
)
if [ -n "$STATIC" ]; then
  echo "$STATIC"
  fail "static graph and processing-instruction checks"
else
  report "stylesheet graph and character processing-instruction checks"
fi

# 6. Cross-processor check: publish every character through xsltproc.
for f in $(find characters -name '*.xml'); do
  xsltproc -o /dev/null "$f" >/dev/null 2>&1 \
    && true \
    || fail "xsltproc rendering failed: $f"
done
[ "$failures" -ne 0 ] || report "xsltproc rendering of all characters"

# 7. Full-page fixtures preserve section order, wrappers, CSS hooks, and text.
assert_fixture() {
  local char=$1 expected_order=$2 css=$3 name_text=$4
  local out order
  out=$(xsltproc "$char" 2>/dev/null) || { fail "fixture render failed: $char"; return; }
  printf '%s' "$out" | rg -q '<html' || fail "$char missing <html>"
  printf '%s' "$out" | rg -q '<body' || fail "$char missing <body>"
  order=$(printf '%s' "$out" | rg -o '<section id="[^"]+"' | cut -d'"' -f2 | paste -sd, -)
  [ "$order" = "$expected_order" ] \
    || fail "$char section order got '$order' want '$expected_order'"
  printf '%s' "$out" | rg -q "$css" || fail "$char missing css hook: $css"
  printf '%s' "$out" | rg -q "$name_text" || fail "$char missing name text: $name_text"
}

assert_fixture characters/FateCore/zird_the_arcane.xml \
  'id,fate-logo,aspects,skills,extras,stunts,stress,consequences' \
  './css/fcs.css' 'Zird the Arcane'
assert_fixture characters/FateAccelerated/bethesda_flushing_phd.xml \
  'id,fate-logo,aspects,skills,stunts,stress,consequences' \
  './css/fae.css' 'Bethesda Flushing, Ph.D.'
[ "$failures" -ne 0 ] || report "full-page fixture assertions"

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
