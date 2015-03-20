<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skills-with-modes-header-row.xsl"/>
  <xsl:include href="skills-with-modes-row.xsl"/>
  <xsl:include href="skills-with-modes-plus5-row.xsl"/>
  <xsl:include href="skills-with-modes-plus4-row.xsl"/>
  <xsl:include href="skills-with-modes-plus3-row.xsl"/>
  <xsl:include href="skills-with-modes-plus2-row.xsl"/>
  <xsl:include href="skills-with-modes-plus1-row.xsl"/>
  <xsl:template name="skills-with-modes">
    <xsl:call-template name="skills-with-modes-header-row"/>
    <xsl:call-template name="skills-with-modes-plus5-row"/>
    <xsl:call-template name="skills-with-modes-plus4-row"/>
    <xsl:call-template name="skills-with-modes-plus3-row"/>
    <xsl:call-template name="skills-with-modes-plus2-row"/>
    <xsl:call-template name="skills-with-modes-plus1-row"/>
  </xsl:template>
</xsl:stylesheet>
