<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-modes-header-row">
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
