<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="md/fae/npc.xsl"/>
  <xsl:template match="/">
    <xsl:apply-templates select="npc"/>
  </xsl:template>
</xsl:stylesheet>
