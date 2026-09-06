<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:variable name="useConditions">false</xsl:variable>
  <xsl:include href="html/fcs/skills.xsl"/>
  <xsl:include href="html/fcs/consequences.xsl"/>
  <xsl:include href="html/fate-common/aspects.xsl"/>
  <xsl:include href="html/fate-common/head.xsl"/>
  <xsl:include href="html/fate-common/name.xsl"/>
  <xsl:include href="html/fate-common/name-of-rating.xsl"/>
  <xsl:include href="html/fate-common/notes.xsl"/>
  <xsl:include href="html/fate-common/refresh.xsl"/>
  <xsl:include href="html/fate-common/stunts.xsl"/>
  <xsl:include href="html/diaspora/character.xsl"/>
  <xsl:include href="html/diaspora/copyright.xsl"/>
  <xsl:include href="html/diaspora/gear.xsl"/>
  <xsl:include href="html/diaspora/id.xsl"/>
  <xsl:include href="html/diaspora/stress.xsl"/>
  <xsl:template match="/">
    <xsl:apply-templates select="character"/>
  </xsl:template>
</xsl:stylesheet>
