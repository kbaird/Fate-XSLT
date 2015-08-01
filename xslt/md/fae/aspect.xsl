<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>

  <xsl:template match="aspect" mode="high-concept">
    <xsl:text>**High Concept**
: </xsl:text>
    <xsl:text>_</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>_

</xsl:text>
  </xsl:template>

  <xsl:template match="aspect" mode="free">
    <xsl:text>- _</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>_
</xsl:text>
  </xsl:template>

</xsl:stylesheet>
