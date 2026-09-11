<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="stress">
    <xsl:text>
**Stress**
: </xsl:text>
    <xsl:if test=". &gt; 0">
      <xsl:text>[ 1 ]</xsl:text>
    </xsl:if>
    <xsl:if test=". &gt; 1">
      <xsl:text> [ 2 ]</xsl:text>
    </xsl:if>
    <xsl:if test=". &gt; 2">
      <xsl:text> [ 3 ]</xsl:text>
    </xsl:if>
    <xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
