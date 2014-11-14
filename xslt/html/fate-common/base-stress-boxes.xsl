<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="base-stress-boxes">
    <xsl:param name="current"/>
    <xsl:param name="max"/>
    <td>
      <xsl:value-of select="$current"/>
    </td>
    <xsl:if test="$current &lt; $max">
      <xsl:call-template name="base-stress-boxes">
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
