<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-modes-header-row">
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
    <tr>
      <th colspan="4" class="sectionheader">Modes and Skills</th>
    </tr>
    <tr>
      <th/>
      <th>
        <xsl:call-template name="skill-mode-th">
          <xsl:with-param name="rating" select="$maxModeRating"/>
        </xsl:call-template>
      </th>
      <th>
        <xsl:call-template name="skill-mode-th">
          <xsl:with-param name="rating" select="$medModeRating"/>
        </xsl:call-template>
      </th>
      <th>
        <xsl:call-template name="skill-mode-th">
          <xsl:with-param name="rating" select="$minModeRating"/>
        </xsl:call-template>
      </th>
    </tr>
  </xsl:template>
</xsl:stylesheet>
