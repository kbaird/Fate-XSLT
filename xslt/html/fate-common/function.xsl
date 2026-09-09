<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="function">
    <xsl:variable name="label">
      <xsl:choose>
        <xsl:when test="@name">
          <xsl:value-of select="@name"/>
        </xsl:when>
        <xsl:when test="../@override-name">
          <xsl:value-of select="../@override-name"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>Function Aspect:</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="dl-entry">
      <xsl:with-param name="label" select="$label"/>
      <xsl:with-param name="value" select="."/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
