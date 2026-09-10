<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template name="skills-with-roles">
    <xsl:call-template name="skills-with-roles-header-row"/>
    <xsl:call-template name="skills-with-roles-loop">
      <xsl:with-param name="skillRating" select="5"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
