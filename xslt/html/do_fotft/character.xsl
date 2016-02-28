<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="character">
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fae</xsl:with-param>
        <xsl:with-param name="moreCSS">do_fotft</xsl:with-param>
      </xsl:call-template>
      <body>
        <h1><xsl:value-of select="id/charname"/></h1>
        <div id="id"><xsl:apply-templates select="id"/></div>
        <div id="fate-logo">
          <span id="do_fotft">Do: Fate of the Flying Temple</span>
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
          <xsl:apply-templates select="approaches"/>
        </div>
        <hr/>
        <div id="stunts">
          <xsl:apply-templates select="stunts"/>
        </div>
        <hr/>
        <div id="stress">
          <xsl:call-template name="stress"/>
        </div>
        <div id="consequences">
          <xsl:call-template name="consequences"/>
        </div>
        <xsl:apply-templates select="notes"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>