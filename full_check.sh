#!/bin/bash

set -e

trap 'echo "failed"' ERR

XSPEC_TARBALL=https://github.com/xspec/xspec/archive/refs/tags/v4.0.3.tar.gz
SAXON_JAR=https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/12.5/Saxon-HE-12.5.jar
XMLRESOLVER_JAR=https://repo1.maven.org/maven2/org/xmlresolver/xmlresolver/6.1.0/xmlresolver-6.1.0.jar

# Install XSpec and Saxon, as in .github/workflows/xspec.yml
mkdir -p tools
[ -x tools/xspec/bin/xspec.sh ] || {
  curl -fsSLo tools/xspec.tgz $XSPEC_TARBALL
  tar -xzf tools/xspec.tgz -C tools
  mv tools/xspec-4.0.3 tools/xspec
  chmod +x tools/xspec/bin/xspec.sh
}
[ -f tools/Saxon-HE.jar ] || curl -fsSLo tools/Saxon-HE.jar $SAXON_JAR
[ -f tools/xmlresolver.jar ] || curl -fsSLo tools/xmlresolver.jar $XMLRESOLVER_JAR

# Check character XML validity, as in .github/workflows/xmllint.yml
find characters -name '*.xml' -print0 | xargs -0 -r xmllint --noout --valid

# Run the XSpec suite, as in .github/workflows/xspec.yml
export SAXON_CP="$PWD/tools/Saxon-HE.jar:$PWD/tools/xmlresolver.jar"
for f in tests/xspec/*.xspec; do
  tools/xspec/bin/xspec.sh -j -e "$f"
done

echo "passed"
