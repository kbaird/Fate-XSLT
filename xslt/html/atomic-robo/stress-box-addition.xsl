<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="stressBoxAddition">
    <xsl:param name="modeRating"/>
    <xsl:param name="modeType"/>
    <xsl:param name="stressType"/>
    <xsl:choose>
      <xsl:when test="$modeRating &gt; 2 and $modeType != 'split'">
        <xsl:value-of select="2"/>
      </xsl:when>
      <xsl:when test="$modeRating &gt; 2 and $modeType = 'split'">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:when test="$modeRating = 2 and $modeType != 'split'">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:when test="$modeRating = 2 and $modeType = 'split' and $stressType='physical'">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
