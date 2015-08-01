<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:template name="stress">
    <xsl:text>
**Resources Stress**
: </xsl:text>
    <xsl:choose>
      <xsl:when test="/ship/@size = 'Shuttle'">
        <xsl:text>none</xsl:text>
      </xsl:when>
      <xsl:when test="/ship/@size = 'Working'">
        <xsl:text>[1] [2] [3x]</xsl:text>
      </xsl:when>
      <xsl:when test="/ship/@size = 'Major'">
        <xsl:text>[1] [2] [3] [4]</xsl:text>
      </xsl:when>
      <xsl:when test="/ship/@size = 'Ultramassive'">
        <xsl:text>[1] [2] [3] [4] [5]</xsl:text>
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose><xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
