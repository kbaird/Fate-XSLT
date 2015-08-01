<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:template name="refresh">
    <xsl:text>
**Refresh**
: </xsl:text>
    <xsl:choose>
      <xsl:when test="/ship/@size = 'Shuttle'">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:when test="/ship/@size = 'Working'">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:when test="/ship/@size = 'Major'">
        <xsl:value-of select="3"/>
      </xsl:when>
      <xsl:when test="/ship/@size = 'Ultramassive'">
        <xsl:value-of select="3"/>
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose><xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
