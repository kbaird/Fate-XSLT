<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="character-title">
    <h1><xsl:value-of select="id/charname"/></h1>
  </xsl:template>

  <xsl:template name="aspects-section">
    <section id="aspects">
      <xsl:apply-templates select="aspects"/>
    </section>
  </xsl:template>

  <xsl:template name="notes-section">
    <xsl:apply-templates select="notes"/>
  </xsl:template>

</xsl:stylesheet>