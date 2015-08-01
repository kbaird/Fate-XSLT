<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="./aspects.xsl"/>
  <xsl:include href="./bad-at.xsl"/>
  <xsl:include href="./metadata_header.xsl"/>
  <xsl:include href="./skilled-at.xsl"/>
  <xsl:include href="./stress.xsl"/>

  <xsl:template match="npc">
    <xsl:call-template name="metadata_header"/>
    <xsl:value-of select="id/description"/>
    <xsl:apply-templates select="aspects"/>
    <xsl:apply-templates select="skilled-at"/>
    <xsl:apply-templates select="bad-at"/>
    <xsl:apply-templates select="stress"/>
  </xsl:template>

</xsl:stylesheet>
