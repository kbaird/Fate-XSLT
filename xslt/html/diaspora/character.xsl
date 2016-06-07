<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="character">
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="moreCSS">diaspora</xsl:with-param>
      </xsl:call-template>
      <body>
        <h1><xsl:value-of select="id/charname"/></h1>
        <section id="id">
          <xsl:apply-templates select="id"/>
        </section>
        <section id="fate-logo">
          <span id="diaspora-logo">Diaspora</span>
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
          <xsl:apply-templates select="skills">
            <xsl:with-param name="rootElement">diaspora</xsl:with-param>
            <xsl:with-param name="useSkillModes">
              <xsl:value-of select="false"/>
            </xsl:with-param>
          </xsl:apply-templates>
        </section>
        <wbr/>
        <section id="stunts">
          <xsl:apply-templates select="stunts"/>
        </section>
        <wbr/>
        <section id="stress">
          <xsl:call-template name="diaspora-stress"/>
        </section>
        <section id="consequences">
          <xsl:call-template name="consequences"/>
        </section>
        <xsl:apply-templates select="gear"/>
        <xsl:apply-templates select="notes"/>
        <xsl:call-template name="diaspora-copyright"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
