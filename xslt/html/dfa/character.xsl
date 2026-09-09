<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/character-fragments.xsl"/>
  <xsl:template match="character">
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fae</xsl:with-param>
      </xsl:call-template>
      <body>
        <xsl:call-template name="character-title"/>
        <section id="id">
          <xsl:apply-templates select="id" mode="fae"/>
        </section>
        <section id="fate-logo">
          <span id="fate-subtitle">Dresden Files Accelerated</span>
        </section>
        <wbr/>
        <xsl:call-template name="aspects-section"/>
        <section id="skills">
          <xsl:apply-templates select="approaches"/>
        </section>
        <wbr/>
        <section id="stunts">
          <xsl:apply-templates select="stunts"/>
        </section>
        <wbr/>
        <section id="stress">
          <xsl:call-template name="dfa-stress"/>
        </section>
        <section id="consequences">
          <xsl:apply-templates select="conditions"/>
        </section>
        <xsl:call-template name="notes-section"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
