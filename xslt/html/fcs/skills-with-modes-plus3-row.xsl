<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-modes-row">
    <xsl:param name="maxModeRating"/>
    <xsl:param name="skillRating"/>
    <tr>
      <th class="mode-rating">+<xsl:value-of select="$maxModeRating"/></th>
      <td>
        <xsl:call-template name="skill-mode-tds">
          <xsl:with-param name="modeRating" select="$maxModeRating"/>
          <xsl:with-param name="skillRating" select="$skillRating"/>
        </xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="skill-mode-tds">
          <xsl:with-param name="modeRating" select="$maxModeRating - 1"/>
          <xsl:with-param name="skillRating" select="$skillRating"/>
        </xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="skill-mode-tds">
          <xsl:with-param name="modeRating" select="$maxModeRating - 2"/>
          <xsl:with-param name="skillRating" select="$skillRating"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="skills-with-modes-plus3-row">
    <xsl:call-template name="skills-with-modes-row">
      <xsl:with-param name="maxModeRating" select="3"/>
      <xsl:with-param name="skillRating" select="3"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
