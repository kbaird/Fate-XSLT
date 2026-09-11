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
  printf '%s' "$out" | grep -Eq '<html' || fail "$char missing <html>"
  printf '%s' "$out" | grep -Eq '<body' || fail "$char missing <body>"
  order=$(printf '%s' "$out" | grep -Eo '<section id="[^"]+"' | cut -d'"' -f2 | paste -sd, -)
  [ "$order" = "$expected_order" ] \
    || fail "$char section order got '$order' want '$expected_order'"
  printf '%s' "$out" | grep -Eq "$css" || fail "$char missing css hook: $css"
  printf '%s' "$out" | grep -Eq "$name_text" || fail "$char missing name text: $name_text"
}

# Markdown fixtures preserve the front-matter opener, title, and main header.
assert_md_fixture() {
  local char=$1 name_text=$2
  local out
  out=$(xsltproc "$char" 2>/dev/null) || { fail "fixture render failed: $char"; return; }
  printf '%s' "$out" | grep -Eq '^---' || fail "$char missing front-matter opener"
  printf '%s' "$out" | grep -Eq "text: $name_text" || fail "$char missing title text: $name_text"
  printf '%s' "$out" | grep -Eq "^## $name_text" || fail "$char missing header: $name_text"
}

assert_fixture characters/FateCore/zird_the_arcane.xml \
  'id,fate-logo,aspects,skills,extras,stunts,stress,consequences' \
  './css/fcs.css' 'Zird the Arcane'
assert_fixture characters/FateAccelerated/bethesda_flushing_phd.xml \
  'id,fate-logo,aspects,skills,stunts,stress,consequences' \
  './css/fae.css' 'Bethesda Flushing, Ph.D.'
assert_fixture characters/AtomicRobo/barry_allen-police_scientist.xml \
  'id,fate-logo,aspects,skills,stunts,stress,consequences,notes' \
  './css/atomic-robo.css' 'Barry Allen'
assert_fixture characters/AetherSea/lararion.xml \
  'id,fate-logo,aspects,skills,stunts,stress,consequences' \
  './css/aether-sea.css' 'Lararion of Verdanteye'
assert_fixture characters/DresdenFilesAccelerated/gabriel_beaumont.xml \
  'id,fate-logo,aspects,skills,stunts,stress,consequences' \
  './css/fae.css' 'Gabriel Beaumont'
assert_fixture characters/Diaspora/benny.xml \
  'id,fate-logo,aspects,skills,stunts,stress,consequences' \
  './css/diaspora.css' 'Benny'
assert_fixture characters/Do_FotFT/blithe_buffalo.xml \
  'id,fate-logo,aspects,skills,stunts,stress,consequences,notes' \
  './css/do_fotft.css' 'Blithe Buffalo'
assert_fixture characters/FateFreeport/kaerlen_freeport.xml \
  'id,fate-logo,aspects,skills,extras,stunts,stress,consequences,notes' \
  './css/freeport.css' 'Kaerlen Santor d'"'"'Sivis'
assert_fixture characters/Jadepunk/gerard_cutting.xml \
  'id,fate-logo,aspects,skills,assets,stress,consequences' \
  './css/jadepunk.css' 'Gerard Cutting'
assert_fixture characters/SotC/jet_black.xml \
  'id,fate-logo,aspects,skills,stress,consequences' \
  './css/sotc.css' 'Jet Black'

assert_md_fixture characters/AetherSea/klehnaki_vessel.xml 'Klehnaki Vessel'
assert_md_fixture characters/FateAccelerated/sky_shark.xml 'Sky Shark'

if [ "$failures" -ne 0 ]; then
  exit 1
fi
exit 0
