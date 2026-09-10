#!/bin/bash
# Cross-processor (libxslt) publishing checks used by full_check.sh and CI.
# Run from the repository root.

failures=0
fail() {
  echo "FAIL: $*"
  failures=$((failures + 1))
}

# Render every character through xsltproc (the publishing processor).
for character in $(find characters -name '*.xml'); do
  xsltproc -o /dev/null "$character" >/dev/null 2>&1 \
    || fail "xsltproc rendering failed: $character"
done

# Full-page fixtures preserve section order, wrappers, CSS hooks, and text.
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

if [ "$failures" -ne 0 ]; then
  exit 1
fi
exit 0
