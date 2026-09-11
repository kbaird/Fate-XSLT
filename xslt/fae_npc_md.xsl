<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="md/fae/aspects.xsl"/>
  <xsl:include href="md/fae/bad-at.xsl"/>
  <xsl:include href="md/fae/metadata_header.xsl"/>
  <xsl:include href="md/fae/skilled-at.xsl"/>
  <xsl:include href="md/fae/stress.xsl"/>
  <xsl:include href="md/fae/npc.xsl"/>
  <xsl:template match="/">
    <xsl:apply-templates select="npc"/>
  </xsl:template>
</xsl:stylesheet>
