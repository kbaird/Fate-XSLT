#!/bin/bash
# aspects.sh

clear

grep '<aspect ' \
  chen_daiyu.xml dilar.xml griff.xml \
  mike_pc.xml steffan_gilios.xml \
  | sed 's#</aspect>##g' \
  | sed 's#<aspect type=".*">##g' \
  | sed 's#XiaoJiahuo/##g' \
  | sed 's#.xml##g' \
  | grep -v 160
