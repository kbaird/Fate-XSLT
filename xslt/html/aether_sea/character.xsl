<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./approaches.xsl"/>
  <xsl:include href="./stunts.xsl"/>
  <xsl:template match="character">
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fae</xsl:with-param>
        <xsl:with-param name="moreCSS">aether-sea</xsl:with-param>
      </xsl:call-template>
      <body>
        <h1><xsl:value-of select="id/charname"/></h1>
        <section id="id"><xsl:apply-templates select="id"/></section>
        <section id="fate-logo">
          <span id="aether-sea">Aether Sea</span>
          <table>
            <tr>
              <xsl:call-template name="refresh"/>
            </tr>
          </table>
        </section>
        <wbr/>
        <section id="aspects">
          <xsl:apply-templates select="aspects"/>
        </section>
        <section id="skills">
          <xsl:apply-templates select="approaches" mode="aether-sea"/>
          <p>The <span class="favored">Favored</span> Approach treats all final results &lt; 0 as 0.</p>
        </section>
        <wbr/>
        <section id="stunts">
          <xsl:apply-templates select="stunts" mode="aether-sea"/>
        </section>
        <wbr/>
        <section id="stress">
          <xsl:call-template name="stress"/>
        </section>
        <section id="consequences">
          <xsl:call-template name="consequences"/>
        </section>
        <xsl:apply-templates select="notes"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
