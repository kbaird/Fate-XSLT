<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skill-role-td">
    <xsl:param name="skillRating"/>
    <xsl:param name="skillName"/>
    <xsl:variable name="actualRating">
      <xsl:call-template name="skill-rating-by-name">
        <xsl:with-param name="skillName" select="$skillName"/>
        <xsl:with-param name="modeRating" select="1"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="($actualRating = $skillRating)">
      <xsl:element name="li">
        <xsl:value-of select="$skillName"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
