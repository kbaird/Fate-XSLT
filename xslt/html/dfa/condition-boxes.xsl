<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="condition-boxes">
    <xsl:param name="current"/>
    <xsl:param name="max"/>
    <dd><xsl:value-of select="@box-value"/></dd>
    <xsl:if test="$current &lt; $max">
      <xsl:call-template name="condition-boxes">
        <xsl:with-param name="current">
          <xsl:value-of select="$current + 1"/>
        </xsl:with-param>
        <xsl:with-param name="max">
          <xsl:value-of select="$max"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
