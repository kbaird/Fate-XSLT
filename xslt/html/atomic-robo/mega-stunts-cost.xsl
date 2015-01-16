<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/gadgets.xsl"/>
  <xsl:template name="mega-stunts-cost">
    <xsl:variable name="gadgetsCount">
      <xsl:value-of select="count(/character/stunts/gadget)"/>
    </xsl:variable>
    <xsl:variable name="gadgetsBenefitsCount">
      <xsl:value-of select="count(/character/stunts/gadget/benefits/benefit)"/>
    </xsl:variable>
    <xsl:variable name="gadgetsBenefitsAddCost">
      <xsl:value-of select="count(/character/stunts/gadget/benefits/benefit[@cost='2'])"/>
    </xsl:variable>
    <xsl:variable name="gadgetsBenefitsCost">
      <!-- FIXME sum the numeric costs to allow costs > 2 -->
      <xsl:value-of select="$gadgetsBenefitsCount + $gadgetsBenefitsAddCost"/>
    </xsl:variable>
    <xsl:variable name="gadgetsCost">
      <xsl:value-of select="$gadgetsCount + $gadgetsBenefitsCost"/>
    </xsl:variable>
    <xsl:variable name="stuntsCount">
      <xsl:value-of select="count(/character/stunts/stunt)"/>
    </xsl:variable>
    <xsl:variable name="stuntsMegaCount">
      <xsl:value-of select="count(/character/stunts/stunt[@mega='true'])"/>
    </xsl:variable>
    <xsl:variable name="stuntsCost">
      <xsl:value-of select="$stuntsCount + $stuntsMegaCount + $gadgetsCost"/>
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
</xsl:stylesheet>
