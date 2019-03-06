<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skills-with-roles-header-row.xsl"/>
  <xsl:include href="skills-with-roles-loop.xsl"/>

  <!--
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
  -->

  <xsl:template name="skills-with-roles">
    <xsl:call-template name="skills-with-roles-header-row"/>
    <xsl:call-template name="skills-with-roles-loop">
      <xsl:with-param name="skillRating" select="5"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
