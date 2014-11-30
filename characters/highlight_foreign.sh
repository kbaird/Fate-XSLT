#!/bin/bash

if [ $# -eq 0 ] ; then
  echo
  echo -e "\e[01;34mUsage\e[0m: \e[01;33m$(basename $0)\e[0m some_file(s).html" >&2
  echo
  exit 1
fi

for file in $@; do
  bname=$(basename $file)
  base=${bname%.*}
  perl -pi -e 's#普通话#<span class="中文">普通话</span>#g' $file
  perl -pi -e 's#巫人#<span class="中文">巫人</span>#g' $file
  perl -pi -e 's#五行#<span class="中文">五行</span>#g' $file
  perl -pi -e 's#bar mitzvah#<em>bar mitzvah</em>#g' $file
  perl -pi -e "s#Cara'Sir#<em>Cara'Sir</em>#g" $file
  perl -pi -e 's#Deireadh an Tuartheil#<em>Deireadh an Tuartheil</em>#g' $file
  perl -pi -e "s#Imiritish ke'Tolosa#<em>Imiritish ke'Tolosa</em>#g" $file
  perl -pi -e 's#Resperentish#<em>Resperentish</em>#g' $file
  perl -pi -e "s#Rinelle ke'Tesrae#<em>Rinelle ke'Tesrae</em>#g" $file
  perl -pi -e "s#the Rinelle#the <em>Rinelle</em>#g" $file
  perl -pi -e 's#Serentaneyo#<em>Serentaneyo</em>#g' $file
  perl -pi -e 's#Sperethiel#<em>Sperethiel</em>#g' $file
  perl -pi -e 's#Tarislar#<em>Tarislar</em>#g' $file
  perl -pi -e 's#Tír Tairngirenes#<em>Tír Tairngirenes</em>#g' $file
  perl -pi -e 's#Tír Tairngire#<em>Tír Tairngire</em>#g' $file
  perl -pi -e "s#<title>Martin <em>Imiritish ke'Tolosa</em> Liú</title>#<title>Martin Imiritish ke'Tolosa Liú</title>#g" $file
done
