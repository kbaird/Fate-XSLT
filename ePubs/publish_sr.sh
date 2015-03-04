#!/bin/bash

pandoc --toc --toc-depth=2 --epub-chapter-level=2 -S \
  -o fate_shadowrun.epub fate_shadowrun.md
