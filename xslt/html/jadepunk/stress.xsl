<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/base-stress-boxes.xsl"/>
  <xsl:include href="../fate-common/stress-header.xsl"/>
  <xsl:include href="./asset-stress-boxes.xsl"/>
  <xsl:include href="./generic-stress.xsl"/>
  <xsl:template name="stress">
    <table id="stress">
      <xsl:call-template name="generic-stress" mode="jadepunk">
        <xsl:with-param name="baseCount">3</xsl:with-param>
        <xsl:with-param name="maxCount">3</xsl:with-param>
        <xsl:with-param name="headerName">Stress</xsl:with-param>
      </xsl:call-template>
    </table>
  </xsl:template>
</xsl:stylesheet>
