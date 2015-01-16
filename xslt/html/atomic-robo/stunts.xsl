<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/gadgets.xsl"/>
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
  <xsl:template name="mega-stunts-cost">
    <xsl:variable name="gadgetsCost">
      <xsl:value-of select="count(/character/stunts/gadget) + count(/character/stunts/gadget/benefits/benefit)"/>
    </xsl:variable>
    <xsl:variable name="stuntsCost">
      <xsl:value-of select="count(/character/stunts/stunt) + count(/character/stunts/stunt[@mega='true']) + $gadgetsCost"/>
    </xsl:variable>
    <xsl:variable name="fatePointsToGm">
      <xsl:value-of select="$stuntsCost - 5"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$stuntsCost &lt; 6"/> <!-- no op -->
      <xsl:when test="$stuntsCost = 6">
        <xsl:text> (Total Benefits: 6 - 5 = 1 Fate Point added to the GM's reserve)</xsl:text>
      </xsl:when>
      <xsl:when test="$stuntsCost &gt; 6">
        <xsl:text> (Total Benefits: </xsl:text>
        <xsl:value-of select="$stuntsCost"/>
        <xsl:text> - 5 = </xsl:text>
        <xsl:value-of select="$fatePointsToGm"/>
        <xsl:text> Fate Points added to the GM's reserve)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> (Total Benefits: </xsl:text>
        <xsl:value-of select="$fatePointsToGm"/>
        <xsl:text>)</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
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
