#!/bin/bash
# aspects.sh

clear

grep '<aspect ' \
  XiaoJiahuo/chen_daiyu.xml XiaoJiahuo/dilar.xml XiaoJiahuo/griff.xml \
  XiaoJiahuo/mike_pc.xml XiaoJiahuo/steffan_gilios.xml \
  | sed 's#</aspect>##g' \
  | sed 's#<aspect type=".*">##g' \
  | sed 's#XiaoJiahuo/##g' \
  | sed 's#.xml##g' \
  | grep -v 160
