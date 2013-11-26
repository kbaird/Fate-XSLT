#!/bin/bash

if [ $# -lt 2 ] ; then
  echo
  echo -e "\e[01;34mUsage\e[0m: \e[01;33m$(basename $0)\e[0m some_file.dtd some_file(s).xml" >&2
  echo
  exit 1
fi

xmllint --noout --dtdvalid $@
