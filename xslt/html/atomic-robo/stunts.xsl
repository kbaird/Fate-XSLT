<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/gadgets.xsl"/>
  <xsl:include href="./mega-stunts-cost.xsl"/>
  <xsl:template match="stunts">
    <table>
      <xsl:call-template name="stunts-header">
        <xsl:with-param name="label">Stunts</xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="stunt"/>
    </table>
  </xsl:template>
  <xsl:template match="stunts" mode="atomic-robo">
    <table>
      <xsl:call-template name="stunts-header">
        <xsl:with-param name="label">Stunts &amp; Mega-Stunts</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="signature-aspect"/>
      <xsl:apply-templates select="stunt"/>
      <xsl:apply-templates select="gadget"/>
    </table>
  </xsl:template>
  <xsl:template name="signature-aspect">
    <xsl:for-each select="/character/aspects/aspect">
      <xsl:if test="@signature='true'">
        <tr>
          <td>
            <fieldset class="stunt"><legend><span>Signature Aspect: <xsl:value-of select="."/> ☐</span></legend>
       Invoke once for free, compel at two fate points instead of one
      </fieldset>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="stunt">
    <tr>
      <td>
        <fieldset class="stunt">
          <legend>
            <span>
              <xsl:value-of select="@name"/>
            </span>
          </legend>
          <xsl:value-of select="."/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="stunts-header">
    <xsl:param name="label"/>
    <tr>
      <th colspan="2" class="sectionheader">
        <xsl:value-of select="$label"/>
        <xsl:call-template name="mega-stunts-cost"/>
      </th>
    </tr>
  </xsl:template>
</xsl:stylesheet>
