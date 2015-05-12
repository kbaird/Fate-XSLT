<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="feature">
    <dt class="feature"><xsl:value-of select="@type"/>:</dt>
    <dd><xsl:choose>
      <xsl:when test="@effect">
        <xsl:value-of select="@effect"/>
      </xsl:when>
      <xsl:when test="@type='Focus'">
        <xsl:value-of select="@profession"/>
        <xsl:text> +</xsl:text>
        <xsl:value-of select="@bonus"/>
      </xsl:when>
      <xsl:when test="@type='Harmful'">
        <xsl:value-of select="@bonus"/>
      </xsl:when>
      <xsl:when test="@type='Independent'">
        <xsl:text>Can act independently w/o the expenditure of a Fate Point</xsl:text>
      </xsl:when>
      <xsl:when test="@type='Professional'">
        <xsl:value-of select="@profession"/>
        <xsl:text> +</xsl:text>
        <xsl:value-of select="@bonus"/>
      </xsl:when>
      <xsl:when test="@type='Resilient'">
        <xsl:text>Mild Consequence: ☐ __________</xsl:text>
      </xsl:when>
      <xsl:when test="@type='Sturdy' and ../../@type='Ally'">
        <xsl:value-of select="@bonus"/>
        <xsl:text> Stress Box(es)</xsl:text>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose></dd>
  </xsl:template>
</xsl:stylesheet>
