<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="benefit">
    <dt><xsl:value-of select="@name"/>
      <xsl:if test="@cost">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="@cost"/>
        <xsl:text>]</xsl:text>
      </xsl:if>
      <xsl:text>: </xsl:text></dt>
    <dd><xsl:value-of select="."/></dd>
  </xsl:template>
</xsl:stylesheet>
