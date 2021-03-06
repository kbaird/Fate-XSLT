#!/bin/bash

if [ $# -eq 0 ] ; then
  echo
  echo -e "\e[01;34mUsage\e[0m: \e[01;33m$(basename $0)\e[0m some_file(s).md" >&2
  echo
  exit 1
fi

for file in $@; do
  bname=$(basename $file)
  dname=$(dirname $file)
  base=${bname%.*}
  pandoc -f markdown -t epub3 -o ../out/$dname/$base.epub $file
done
