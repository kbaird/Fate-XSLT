#!/bin/bash

if [ $# -eq 0 ] ; then
  echo
  echo "Usage: $(basename $0) some_file(s).xml" >&2
  echo
  exit 1
fi

for file in $@; do
  bname=$(basename $file)
  base=${bname%.*}
  xsltproc -o ../out/$base.html ../xslt/fae_html.xsl $file
done
