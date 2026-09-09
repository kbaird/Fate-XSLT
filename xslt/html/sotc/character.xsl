<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/character-fragments.xsl"/>
  <xsl:template match="character">
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="moreCSS">sotc</xsl:with-param>
      </xsl:call-template>
      <body>
        <xsl:call-template name="character-title"/>
        <section id="id">
          <xsl:apply-templates select="id"/>
        </section>
        <section id="fate-logo">
          <span id="sotc-logo">Spirit of the Century</span>
          <table>
            <tr>
              <xsl:call-template name="refresh"/>
            </tr>
          </table>
        </section>
        <wbr/>
        <xsl:call-template name="aspects-section"/>
        <section id="skills">
          <xsl:apply-templates select="skills">
            <xsl:with-param name="useSkillModes" select="false()"/>
          </xsl:apply-templates>
          <xsl:apply-templates select="stunts"/>
          <xsl:apply-templates select="gadgets"/>
        </section>
        <wbr/>
        <section id="stress">
          <xsl:call-template name="sotc-stress"/>
        </section>
        <section id="consequences">
          <xsl:call-template name="consequences"/>
        </section>
        <xsl:apply-templates select="gear"/>
        <wbr/>
        <xsl:apply-templates select="phases"/>
        <xsl:call-template name="notes-section"/>
        <xsl:call-template name="sotc-copyright"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
