<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="render-consequence">
    <xsl:param name="label"/>
    <xsl:param name="severity"/>
    <xsl:param name="spaced" select="'false'"/>
    <xsl:param name="placeholder" select="'false'"/>
    <fieldset class="consequence">
      <legend class="severity">
        <span><xsl:value-of select="$label"/></span>
        <xsl:if test="$spaced = 'true'">F ☐</xsl:if>
        <xsl:if test="$spaced != 'true'">F☐</xsl:if>
        <xsl:if test="$severity != 'Mild'">
          <xsl:if test="$spaced = 'true'"> / R? ☐</xsl:if>
          <xsl:if test="$spaced != 'true'"> / R?☐</xsl:if>
        </xsl:if>
      </legend>
      <xsl:for-each select="/character/consequences/consequence[@severity=$severity]">
        <xsl:choose>
          <xsl:when test="$placeholder = 'true' and not(text())">
            <span class="placeholder"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </fieldset>
  </xsl:template>
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
          <xsl:if test="/character/stunts/stunt[@consequence='Mild']">
            <xsl:call-template name="consequence">
              <xsl:with-param name="label">Mild (2)</xsl:with-param>
              <xsl:with-param name="severity">Mild</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Moderate (4)</xsl:with-param>
            <xsl:with-param name="severity">Moderate</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Severe (6)</xsl:with-param>
            <xsl:with-param name="severity">Severe</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="consequences-extra"/>
        </td>
      </tr>
      <tfoot><tr><th colspan="2">F = Free, R? = Recovering?</th></tr></tfoot>
    </table>
  </xsl:template>
  <xsl:template name="consequences-extra"/>
</xsl:stylesheet>
