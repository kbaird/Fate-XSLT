<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-modes-plus4-row">
    <xsl:call-template name="skills-with-modes-row">
      <xsl:with-param name="maxModeRating" select="3"/>
      <xsl:with-param name="medModeRating" select="2"/>
      <xsl:with-param name="minModeRating" select="1"/>
      <xsl:with-param name="skillRating" select="4"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
