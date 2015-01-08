<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="flaw">
    <dt class="flaw"><xsl:value-of select="@type"/>:</dt>
    <dd>
      <xsl:choose>
        <xsl:when test="@type='Limited'">
          <xsl:choose>
            <xsl:when test="@effect='1'">
              <xsl:text>☐ Once per Scene</xsl:text>
            </xsl:when>
            <xsl:when test="@effect='2'">
              <xsl:text>☐ Once per Session</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@effect"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="@effect">
          <xsl:value-of select="@effect"/>
        </xsl:when>
        <xsl:when test="@type='Consuming'">
          <xsl:text>Costs 1 Fate Point to use</xsl:text>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </dd>
  </xsl:template>
</xsl:stylesheet>
