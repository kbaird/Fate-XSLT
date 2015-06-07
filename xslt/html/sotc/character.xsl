<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="character">
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="moreCSS">sotc</xsl:with-param>
      </xsl:call-template>
      <body>
        <h1><xsl:value-of select="id/charname"/></h1>
        <div id="id">
          <xsl:apply-templates select="id"/>
        </div>
        <div id="fate-logo">
          <span id="sotc-logo">Spirit of the Century</span>
          <table>
            <tr>
              <xsl:call-template name="refresh"/>
            </tr>
          </table>
        </div>
        <hr/>
        <div id="aspects">
          <xsl:apply-templates select="aspects"/>
        </div>
        <div id="skills">
          <xsl:apply-templates select="skills">
            <xsl:with-param name="rootElement">diaspora</xsl:with-param>
            <xsl:with-param name="useSkillModes">
              <xsl:value-of select="false"/>
            </xsl:with-param>
          </xsl:apply-templates>
          <xsl:apply-templates select="stunts"/>
          <xsl:apply-templates select="gadgets"/>
        </div>
        <hr/>
        <div id="stress">
          <xsl:call-template name="sotc-stress"/>
        </div>
        <div id="consequences">
          <xsl:call-template name="consequences"/>
        </div>
        <xsl:apply-templates select="gear"/>
        <hr/>
        <xsl:apply-templates select="phases"/>
        <xsl:apply-templates select="notes"/>
        <xsl:call-template name="sotc-copyright"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
