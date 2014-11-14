<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="add-skill-focusing">
    <xsl:param name="skillName"/>
    <xsl:param name="modeRating"/>
    <xsl:param name="skillRating"/>
    <xsl:choose>
      <xsl:when test="$skillRating = $modeRating + 2">
        <xsl:attribute name="class">
          <xsl:text>specialized</xsl:text>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="$skillRating = $modeRating + 1">
        <xsl:attribute name="class">
          <xsl:text>focused</xsl:text>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="class">
          <xsl:text>trained</xsl:text>
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
