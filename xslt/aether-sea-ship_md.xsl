<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="md/fae/aspects.xsl"/>
  <xsl:include href="md/fae/bad-at.xsl"/>
  <xsl:include href="md/fae/metadata_header.xsl"/>
  <xsl:include href="md/fae/skilled-at.xsl"/>
  <xsl:include href="md/aether_sea/addenda.xsl"/>
  <xsl:include href="md/aether_sea/approaches.xsl"/>
  <xsl:include href="md/aether_sea/components.xsl"/>
  <xsl:include href="md/aether_sea/consequences.xsl"/>
  <xsl:include href="md/aether_sea/refresh.xsl"/>
  <xsl:include href="md/aether_sea/size.xsl"/>
  <xsl:include href="md/aether_sea/stress.xsl"/>
  <xsl:include href="md/aether_sea/stunts.xsl"/>
  <xsl:include href="md/aether_sea/ship.xsl"/>
  <xsl:template match="/">
    <xsl:apply-templates select="ship"/>
  </xsl:template>
</xsl:stylesheet>
