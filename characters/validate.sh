#!/bin/bash

if [ $# -lt 2 ] ; then
  echo
  echo "Usage: $(basename $0) some_file.dtd some_file(s).xml" >&2
  echo
  exit 1
fi

xmllint --noout --dtdvalid $@
