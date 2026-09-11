<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="consequence">
    <xsl:param name="label"/>
    <xsl:param name="severity"/>
    <xsl:call-template name="render-consequence">
      <xsl:with-param name="label" select="$label"/>
      <xsl:with-param name="severity" select="$severity"/>
      <xsl:with-param name="spaced" select="'false'"/>
      <xsl:with-param name="placeholder" select="'false'"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
