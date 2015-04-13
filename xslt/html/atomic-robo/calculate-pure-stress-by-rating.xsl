<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="calculate-pure-stress-by-rating">
    <xsl:param name="rating"/>
    <xsl:param name="stressType"/>
    <xsl:call-template name="stress-box-addition">
      <xsl:with-param name="modeRating">
        <xsl:value-of select="/character/skills/mode[@stress-type=$stressType][@rating = $rating]/@rating"/>
      </xsl:with-param>
      <xsl:with-param name="stressType">
        <xsl:value-of select="$stressType"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
