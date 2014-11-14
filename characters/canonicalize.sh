#!/bin/bash

if [ $# -eq 0 ] ; then
  echo
  echo -e "\e[01;34mUsage\e[0m: \e[01;33m$(basename $0)\e[0m some_file(s).xml" >&2
  echo
  exit 1
fi

for file in $@; do
  xmllint --c14n11 --format --encode utf8 --noenc $file > /tmp/xml_output
  perl -pi -e 's/ /&#160;/g' /tmp/xml_output
  cp /tmp/xml_output $file
done
