<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="character">
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">jadepunk</xsl:with-param>
        <xsl:with-param name="customCSS">
          <xsl:if test="@custom-css">
            <xsl:value-of select="@custom-css"/>
          </xsl:if>
        </xsl:with-param>
        <xsl:with-param name="moreCSS">professions</xsl:with-param>
      </xsl:call-template>
      <body>
        <h1><xsl:value-of select="id/charname"/></h1>
        <section id="id">
          <xsl:apply-templates select="id"/>
        </section>
        <section id="fate-logo">
          <span id="fate">
            <img id="jadepunk-logo" src="./jadepunk306w120h.png"/>
          </span>
          <table>
            <tr>
              <xsl:apply-templates select="refresh"/>
            </tr>
          </table>
        </section>
        <wbr/>
        <section id="aspects">
          <xsl:apply-templates select="aspects"/>
        </section>
        <section id="skills">
          <xsl:apply-templates select="professions"/>
        </section>
        <wbr/>
        <section id="assets">
          <xsl:apply-templates select="assets"/>
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
