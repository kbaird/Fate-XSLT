<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="asset.xsl"/>
  <xsl:include href="assets-header.xsl"/>
  <xsl:template match="assets">
    <table>
      <xsl:call-template name="assets-header">
        <xsl:with-param name="label">Assets</xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="asset"/>
    </table>
  </xsl:template>
</xsl:stylesheet>
