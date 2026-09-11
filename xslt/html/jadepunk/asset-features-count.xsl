<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="asset" mode="features-count">
    <xsl:variable name="baseFeaturesCount" select="count(features/feature[@type!='Focus'][@type!='Harmful'][@type!='Numerous'][@type!='Professional'][@type!='Protective'][@type!='Resilient'][@type!='Sturdy'])"/>

    <xsl:variable name="specialFeaturesCount">
      <!-- Exceptional and Flexible count double, so count them again -->
      <xsl:variable name="exceptionalCount" select="count(features/feature[@type='Exceptional'])"/>

      <xsl:variable name="flexibleCount" select="count(features/feature[@type='Flexible'])"/>

      <xsl:variable name="focusCount" select="sum(features/feature[@type='Focus']/@bonus)"/>

      <xsl:variable name="harmfulCount" select="sum(features/feature[@type='Harmful']/@bonus)"/>

      <xsl:variable name="numerousCount" select="sum(features/feature[@type='Numerous']/@bonus)"/>

      <xsl:variable name="professionalCount">
        <xsl:variable name="oneFreeForAlly">
          <xsl:apply-templates select="." mode="one-free-for-ally"/>
        </xsl:variable>
        <xsl:value-of select="sum(features/feature[@type='Professional']/@bonus) - $oneFreeForAlly"/>
      </xsl:variable>

      <xsl:variable name="protectiveCount">
        <xsl:choose>
          <xsl:when test="features/feature[@type='Protective'][@bonus]">
            <xsl:value-of select="2 * sum(features/feature[@type='Protective']/@bonus)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="2 * count(features/feature[@type='Protective'])"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="resilientCount">
        <xsl:variable name="oneFreeForAlly">
          <xsl:apply-templates select="." mode="one-free-for-ally"/>
        </xsl:variable>
        <xsl:value-of select="count(features/feature[@type='Resilient']) - $oneFreeForAlly"/>
      </xsl:variable>

      <xsl:variable name="sturdyCount">
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

      <xsl:value-of select="$exceptionalCount + $flexibleCount + $focusCount + $harmfulCount + $numerousCount + $professionalCount + $protectiveCount + $resilientCount + $sturdyCount"/>
    </xsl:variable>
    <xsl:value-of select="$baseFeaturesCount + $specialFeaturesCount"/>

  </xsl:template>

</xsl:stylesheet>
