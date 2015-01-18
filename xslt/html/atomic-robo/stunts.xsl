<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/gadgets.xsl"/>
  <xsl:include href="./signature-aspect.xsl"/>
  <xsl:include href="./stunts-header.xsl"/>
  <xsl:include href="./stunt.xsl"/>
  <xsl:template match="stunts" mode="atomic-robo">
    <table>
      <xsl:call-template name="stunts-header">
        <xsl:with-param name="label">Stunts &amp; Mega-Stunts</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="signature-aspect"/>
      <xsl:apply-templates select="stunt"/>
      <xsl:apply-templates select="gadget"/>
    </table>
  </xsl:template>
</xsl:stylesheet>
