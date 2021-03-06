<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="flaw">
    <dt class="flaw"><xsl:value-of select="@type"/>:</dt>
    <dd><xsl:choose>
        <xsl:when test="@type='Consuming'">
          <xsl:text>Costs 1 Fate Point to use</xsl:text>
        </xsl:when>
        <xsl:when test="@type='Limited'">
          <xsl:choose>
            <xsl:when test="@bonus='1'">
              <xsl:text>☐ Once per Scene</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>☐ Once per Session</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="@effect='Success-With-Style'">
          <xsl:text>Succeeded w/Style (pg57)</xsl:text>
        </xsl:when>
        <xsl:when test="@effect">
          <xsl:value-of select="@effect"/>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose></dd>
  </xsl:template>
</xsl:stylesheet>
