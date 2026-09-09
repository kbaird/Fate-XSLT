<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skills-with-modes-header-row.xsl"/>
  <xsl:include href="skills-with-modes-loop.xsl"/>

  <xsl:template name="skills-with-modes">
    <xsl:param name="maxModeRating">
      <xsl:for-each select="/character/skills/mode/@rating">
        <xsl:sort data-type="number" order="descending"/>
        <xsl:if test="position()=1"><xsl:value-of select="."/></xsl:if>
      </xsl:for-each>
    </xsl:param>
    <xsl:param name="medModeRating">
      <xsl:for-each select="/character/skills/mode/@rating">
        <xsl:sort data-type="number" order="descending"/>
        <xsl:if test="position()=2"><xsl:value-of select="."/></xsl:if>
      </xsl:for-each>
    </xsl:param>
    <xsl:param name="minModeRating">
      <xsl:for-each select="/character/skills/mode/@rating">
        <xsl:sort data-type="number" order="descending"/>
        <xsl:if test="position()=3"><xsl:value-of select="."/></xsl:if>
      </xsl:for-each>
    </xsl:param>
    <xsl:variable name="maxSkillRating" select="$maxModeRating + 2"/>
    <xsl:call-template name="skills-with-modes-header-row">
      <xsl:with-param name="maxModeRating" select="$maxModeRating"/>
      <xsl:with-param name="medModeRating" select="$medModeRating"/>
      <xsl:with-param name="minModeRating" select="$minModeRating"/>
    </xsl:call-template>
    <xsl:call-template name="skills-with-modes-loop">
      <xsl:with-param name="skillRating" select="$maxSkillRating"/>
      <xsl:with-param name="maxModeRating" select="$maxModeRating"/>
      <xsl:with-param name="medModeRating" select="$medModeRating"/>
      <xsl:with-param name="minModeRating" select="$minModeRating"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>