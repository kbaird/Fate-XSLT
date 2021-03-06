<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="../fae/aspects.xsl"/>
  <xsl:include href="../fae/bad-at.xsl"/>
  <xsl:include href="../fae/metadata_header.xsl"/>
  <xsl:include href="../fae/skilled-at.xsl"/>

  <xsl:include href="./addenda.xsl"/>
  <xsl:include href="./approaches.xsl"/>
  <xsl:include href="./components.xsl"/>
  <xsl:include href="./consequences.xsl"/>
  <xsl:include href="./refresh.xsl"/>
  <xsl:include href="./size.xsl"/>
  <xsl:include href="./stress.xsl"/>
  <xsl:include href="./stunts.xsl"/>

  <xsl:template match="ship">
    <xsl:call-template name="metadata_header"/>
    <xsl:value-of select="id/description"/>
    <xsl:call-template name="size"/>
    <xsl:apply-templates select="aspects"/>
    <xsl:apply-templates select="approaches"/>
    <xsl:apply-templates select="skilled-at"/>
    <xsl:apply-templates select="bad-at"/>
    <xsl:apply-templates select="components"/>
    <xsl:call-template name="refresh"/>
    <xsl:call-template name="stress"/>
    <xsl:apply-templates select="stunts"/>
    <xsl:call-template name="addenda"/>
    <xsl:apply-templates select="consequences"/>
  </xsl:template>

</xsl:stylesheet>
