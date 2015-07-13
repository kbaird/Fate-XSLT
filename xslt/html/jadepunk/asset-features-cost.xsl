<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="asset-one-free-for-ally.xsl"/>

  <xsl:template match="asset" mode="features-cost">
    <xsl:variable name="baseFeaturesCost">
      <xsl:value-of select="count(features/feature[@type!='Focus'][@type!='Harmful'][@type!='Numerous'][@type!='Protective'][@type!='Resilient'][@type!='Sturdy'])"/>
    </xsl:variable>

    <xsl:variable name="specialFeaturesCost">
      <xsl:variable name="exceptionalCost">
        <xsl:value-of select="count(features/feature[@type='Exceptional'])"/>
      </xsl:variable>

      <xsl:variable name="flexibleCost">
        <xsl:value-of select="count(features/feature[@type='Flexible'])"/>
      </xsl:variable>

      <xsl:variable name="focusCost">
        <xsl:value-of select="sum(features/feature[@type='Focus']/@bonus)"/>
      </xsl:variable>

      <xsl:variable name="harmfulCost">
        <xsl:value-of select="sum(features/feature[@type='Harmful']/@bonus)"/>
      </xsl:variable>

      <xsl:variable name="numerousCost">
        <xsl:value-of select="sum(features/feature[@type='Numerous']/@bonus)"/>
      </xsl:variable>

      <xsl:variable name="professionalCost">
        <xsl:variable name="oneFreeForAlly">
          <xsl:apply-templates select="." mode="one-free-for-ally"/>
        </xsl:variable>
        <xsl:value-of select="sum(features/feature[@type='Professional']/@bonus) - $oneFreeForAlly"/>
      </xsl:variable>

      <xsl:variable name="protectiveCost">
        <xsl:choose>
          <xsl:when test="features/feature[@type='Protective'][@bonus]">
            <xsl:value-of select="2 * sum(features/feature[@type='Protective']/@bonus)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="2 * count(features/feature[@type='Protective'])"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="resilientCost">
        <xsl:variable name="oneFreeForAlly">
          <xsl:apply-templates select="." mode="one-free-for-ally"/>
        </xsl:variable>
        <xsl:value-of select="count(features/feature[@type='Resilient']) - $oneFreeForAlly"/>
      </xsl:variable>

      <xsl:variable name="sturdyCost">
        <xsl:variable name="oneFreeForAlly">
          <xsl:apply-templates select="." mode="one-free-for-ally"/>
        </xsl:variable>
        <xsl:variable name="sturdyValue">
          <xsl:choose>
            <xsl:when test="features/feature[@type='Sturdy'][@bonus]">
              <xsl:value-of select="sum(features/feature[@type='Sturdy']/@bonus)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="count(features/feature[@type='Sturdy'])"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$sturdyValue - $oneFreeForAlly"/>
      </xsl:variable>

      <xsl:value-of select="$exceptionalCost + $flexibleCost + $focusCost + $harmfulCost + $numerousCost + $professionalCost + $protectiveCost + $resilientCost + $sturdyCost"/>
    </xsl:variable>
    <xsl:value-of select="$baseFeaturesCost + $specialFeaturesCost"/>

  </xsl:template>

</xsl:stylesheet>
