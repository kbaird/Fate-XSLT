<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./phase-with-num.xsl"/>
  <xsl:template match="phase-trio">
    <table>
      <tr>
        <th colspan="2" class="sectionheader">Phases</th>
      </tr>
      <xsl:apply-templates select="phase"/>
    </table>
  </xsl:template>
  <xsl:template match="phase">
    <tr>
      <td>
        <fieldset class="phase">
          <xsl:call-template name="phase-with-num">
            <xsl:with-param name="num">1</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="phase-with-num">
            <xsl:with-param name="num">2</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="phase-with-num">
            <xsl:with-param name="num">3</xsl:with-param>
          </xsl:call-template>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
