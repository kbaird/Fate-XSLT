<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="html/fcs/fcs_common.xsl"/>
  <xsl:include href="html/fate-common/stunts.xsl"/>
  <xsl:include href="html/fcs/phase-trio.xsl"/>
  <xsl:include href="html/fcs/stress.xsl"/>
  <xsl:template match="/">
    <xsl:apply-templates select="character">
      <xsl:with-param name="moreCSS">
        <xsl:if test="/character/professions">jadepunk</xsl:if>
      </xsl:with-param>
    </xsl:apply-templates>
  </xsl:template>
</xsl:stylesheet>
