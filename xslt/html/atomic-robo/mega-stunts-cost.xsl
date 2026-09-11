<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="mega-stunts-cost">
    <xsl:param name="gadgetsCount"/>
    <xsl:param name="gadgetsBenefitsCost"/>
    <xsl:param name="signatureAspectCount"/>
    <xsl:param name="stuntsCount"/>
    <xsl:param name="stuntsMegaCount"/>
    <xsl:variable name="gadgetsCost" select="$gadgetsCount + $gadgetsBenefitsCost"/>
    <xsl:variable name="stuntsCost" select="$stuntsCount + $stuntsMegaCount + $gadgetsCost + $signatureAspectCount"/>
    <xsl:variable name="fatePointsToGm" select="$stuntsCost - 5"/>
    <xsl:choose>
      <xsl:when test="$stuntsCost &lt; 6"/> <!-- no op -->
      <xsl:when test="$stuntsCost = 6">
        <xsl:text> (Total Benefits: 6 - 5 = +1 Fate Point to the GM's reserve)</xsl:text>
      </xsl:when>
      <xsl:when test="$stuntsCost &gt; 6">
        <xsl:text> (Total Benefits: </xsl:text>
        <xsl:value-of select="$stuntsCost"/>
        <xsl:text> - 5 = +</xsl:text>
        <xsl:value-of select="$fatePointsToGm"/>
        <xsl:text> Fate Points to the GM's reserve)</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
