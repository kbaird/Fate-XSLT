<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="phase-aspects">
    <xsl:param name="phase"/>
    <span class="aspects">
      <xsl:choose>
        <xsl:when test="count(/character/aspects/aspect[@phase-num=$phase]) = 1">
          <xsl:text>Aspect:</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>Aspects:</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:for-each select="/character/aspects/aspect[@phase-num=$phase]">
        <xsl:if test="position() &gt; 1">, </xsl:if>
        <em class="phase-aspect"><xsl:value-of select="."/></em>
      </xsl:for-each>
    </span>
  </xsl:template>
</xsl:stylesheet>
