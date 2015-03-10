#!/bin/bash

pandoc --toc --toc-depth=2 --epub-chapter-level=2 -S \
  --epub-cover-image=/usr/local/share/icons/shadowrun_returns.png \
  -o fate_shadowrun.epub fate_shadowrun.md

