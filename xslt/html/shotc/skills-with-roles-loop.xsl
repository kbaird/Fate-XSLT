<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skills-with-roles-row.xsl"/>
  <xsl:template name="skills-with-roles-loop">
    <xsl:param name="skillRating"/>
    <xsl:call-template name="skills-with-roles-row">
      <xsl:with-param name="skillRating" select="$skillRating"/>
    </xsl:call-template>
    <xsl:if test="$skillRating &gt; 0">
      <xsl:call-template name="skills-with-roles-loop">
        <xsl:with-param name="skillRating" select="$skillRating - 1"/>
    </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
