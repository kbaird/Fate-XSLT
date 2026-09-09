<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="html/fcs/skills.xsl"/>
  <xsl:include href="html/fcs/consequences.xsl"/>
  <xsl:include href="html/fate-common/fate-common.xsl"/>
  <xsl:include href="html/sotc/character.xsl"/>
  <xsl:include href="html/sotc/copyright.xsl"/>
  <xsl:include href="html/sotc/gadgets.xsl"/>
  <xsl:include href="html/sotc/id.xsl"/>
  <xsl:include href="html/sotc/phases.xsl"/>
  <xsl:include href="html/sotc/stress.xsl"/>
  <xsl:template match="/">
    <xsl:apply-templates select="character"/>
  </xsl:template>
</xsl:stylesheet>
