<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skill-rating-by-name">
    <xsl:param name="skillName"/>
    <xsl:param name="modeRating"/>
    <xsl:variable name="skillCount">
      <xsl:value-of select="count(/character/skills/mode/skill[@name=$skillName])"/>
    </xsl:variable>
    <xsl:variable name="skillImprovements">
      <xsl:choose>
        <xsl:when test="/character/skills/mode[@rating=$modeRating]/skill[@name=$skillName]/@add">
          <xsl:value-of select="/character/skills/mode[@rating=$modeRating]/skill[@name=$skillName]/@add"/>
        </xsl:when>
        <xsl:otherwise>
     0
    </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$modeRating + $skillCount + $skillImprovements - 1"/>
  </xsl:template>
</xsl:stylesheet>
