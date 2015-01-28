<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="consequences">
    <table>
      <tr>
        <th colspan="2" class="sectionheader">Consequences</th>
      </tr>
      <tr>
        <td>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Mild (2)</xsl:with-param>
            <xsl:with-param name="severity">Mild</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Moderate (4)</xsl:with-param>
            <xsl:with-param name="severity">Moderate</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Severe (6)</xsl:with-param>
            <xsl:with-param name="severity">Severe</xsl:with-param>
          </xsl:call-template>
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template name="consequence">
    <xsl:param name="label"/>
    <xsl:param name="severity"/>
    <fieldset class="consequence">
      <legend class="severity">
        <span><xsl:value-of select="$label"/></span>
        <xsl:text>Free ☐ / Recovering? ☐</xsl:text>
      </legend>
      <xsl:for-each select="/character/consequences/consequence[@severity=$severity]">
        <xsl:value-of select="."/>
      </xsl:for-each>
    </fieldset>
  </xsl:template>
</xsl:stylesheet>
