#!/bin/bash
# Negative tests: verify check-stylesheets.py fails on each static-check error
# path. Each case is built in a scratch root under ${TMPDIR:-/tmp} and removed
# on exit. Run from the repository root.

failures=0
fail() {
  echo "FAIL: $*"
  failures=$((failures + 1))
}

scratch="${TMPDIR:-/tmp}/fate-check-stylesheets-negative"
rm -rf "$scratch"
trap 'rm -rf "$scratch"' EXIT

expect_failure() {
  local case=$1 root=$2
  if python3 check-stylesheets.py "$root" >/dev/null 2>&1; then
    fail "$case: check-stylesheets.py unexpectedly passed"
  else
    echo "PASS: $case"
  fi
}

# 1. Character PI pointing at a missing stylesheet.
root="$scratch/missing-target"
mkdir -p "$root/xslt" "$root/characters/X"
printf '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>' \
  > "$root/xslt/entry.xsl"
cat > "$root/characters/X/broken.xml" <<'EOF'
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="../../xslt/missing.xsl"?>
<character/>
EOF
expect_failure "character PI missing stylesheet target" "$root"

# 2. Module included twice from an entry point.
root="$scratch/duplicate-include"
mkdir -p "$root/xslt"
cat > "$root/xslt/a.xsl" <<'EOF'
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="b.xsl"/>
  <xsl:include href="b.xsl"/>
</xsl:stylesheet>
EOF
printf '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>' \
  > "$root/xslt/b.xsl"
expect_failure "module included twice" "$root"

# 3. Unreachable stylesheet (entry points are only xslt/*.xsl, so a module in
#    a subdirectory that no entry point includes is unreachable).
root="$scratch/unreachable"
mkdir -p "$root/xslt/html"
printf '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>' \
  > "$root/xslt/entry.xsl"
printf '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>' \
  > "$root/xslt/html/orphan.xsl"
expect_failure "unreachable stylesheet" "$root"

if [ "$failures" -ne 0 ]; then
  echo "failed: $failures negative check(s) failed"
  exit 1
fi
exit 0