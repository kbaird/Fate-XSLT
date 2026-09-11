<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-modes-loop">
    <xsl:param name="skillRating"/>
    <xsl:param name="maxModeRating"/>
    <xsl:param name="medModeRating"/>
    <xsl:param name="minModeRating"/>
    <xsl:call-template name="skills-with-modes-row">
      <xsl:with-param name="skillRating" select="$skillRating"/>
      <xsl:with-param name="maxModeRating" select="$maxModeRating"/>
      <xsl:with-param name="medModeRating" select="$medModeRating"/>
      <xsl:with-param name="minModeRating" select="$minModeRating"/>
    </xsl:call-template>
    <xsl:if test="$skillRating &gt; $minModeRating">
      <xsl:call-template name="skills-with-modes-loop">
        <xsl:with-param name="skillRating" select="$skillRating - 1"/>
        <xsl:with-param name="maxModeRating" select="$maxModeRating"/>
        <xsl:with-param name="medModeRating" select="$medModeRating"/>
        <xsl:with-param name="minModeRating" select="$minModeRating"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
