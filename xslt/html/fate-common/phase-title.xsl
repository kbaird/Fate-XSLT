<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="phase-title">
    <xsl:param name="phase"/>Phase <xsl:value-of select="$phase"/>: <xsl:choose>
      <xsl:when test="/character/phase-trio/phase[@num=$phase]/@title">
        <xsl:value-of select="/character/phase-trio/phase[@num=$phase]/@title"/>
      </xsl:when>
      <xsl:when test="$phase=1">
        <xsl:text>Your Adventure</xsl:text>
      </xsl:when>
      <xsl:when test="$phase=2">
        <xsl:text>Crossing Paths</xsl:text>
      </xsl:when>
      <xsl:when test="$phase=3">
        <xsl:text>Crossing Paths Again</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Unknown Title</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
