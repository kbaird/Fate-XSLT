<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skills-with-modes-header-row.xsl"/>
  <xsl:include href="skills-with-modes-loop.xsl"/>

  <xsl:variable name="maxModeRating">
    <xsl:for-each select="/character/skills/mode/@rating">
      <xsl:sort data-type="number" order="descending"/>
      <xsl:if test="position()=1"><xsl:value-of select="."/></xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="medModeRating">
    <xsl:for-each select="/character/skills/mode/@rating">
      <xsl:sort data-type="number" order="descending"/>
      <xsl:if test="position()=2"><xsl:value-of select="."/></xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="minModeRating">
    <xsl:for-each select="/character/skills/mode/@rating">
      <xsl:sort data-type="number" order="descending"/>
      <xsl:if test="position()=3"><xsl:value-of select="."/></xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="maxSkillRating">
    <xsl:value-of select="$maxModeRating + 2"/>
  </xsl:variable>

  <xsl:template name="skills-with-modes">
    <xsl:call-template name="skills-with-modes-header-row"/>
    <xsl:call-template name="skills-with-modes-loop">
      <xsl:with-param name="skillRating" select="$maxSkillRating"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
