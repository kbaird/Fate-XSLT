#!/bin/bash
# regen_css_from_sass.sh

for file in *.sass; do
  bn=$(basename $file .sass)
  sass -t compact $bn.sass $bn.css
done
rm _*.css
