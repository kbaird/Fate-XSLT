<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="npc">
    <xsl:call-template name="metadata_header"/>
    <xsl:value-of select="id/description"/>
    <xsl:apply-templates select="aspects"/>
    <xsl:apply-templates select="skilled-at"/>
    <xsl:apply-templates select="bad-at"/>
    <xsl:apply-templates select="stress"/>
  </xsl:template>

</xsl:stylesheet>
