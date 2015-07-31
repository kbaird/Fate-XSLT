<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:template name="metadata_header">
    <xsl:text>---
title:
- type: main
  text: </xsl:text>
<xsl:value-of select="id/name"/><xsl:text>
creator:
- role: author
  text: Kevin C. Baird
...

## </xsl:text><xsl:value-of select="id/name"/><xsl:text>

</xsl:text>
  </xsl:template>
</xsl:stylesheet>
