<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="more-stress-boxes">
    <xsl:param name="baseCount"/>
    <xsl:param name="maxCount"/>
    <xsl:param name="skillRating"/>
    <xsl:variable name="numericSkillRating" select="translate($skillRating, translate($skillRating,'0123456789',''), '')"/>
    <xsl:if test="$baseCount &lt; $maxCount">
      <xsl:if test="$numericSkillRating &gt; 0">
        <td><xsl:value-of select="$baseCount + 1"/></td>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$baseCount + 1 &lt; $maxCount">
      <xsl:if test="$numericSkillRating &gt; 2">
        <td><xsl:value-of select="$baseCount + 2"/></td>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$baseCount + 2 &lt; $maxCount">
      <xsl:if test="$numericSkillRating &gt; 4">
        <td><xsl:value-of select="$baseCount + 3"/></td>
      </xsl:if>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
