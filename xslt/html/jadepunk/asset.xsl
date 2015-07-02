<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="feature.xsl"/>
  <xsl:include href="flaw.xsl"/>
  <xsl:include href="guiding-aspect.xsl"/>
  <xsl:include href="notes.xsl"/>

  <xsl:template match="asset" mode="one-free-for-ally">
    <xsl:choose>
      <xsl:when test="@type='Ally'">
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="asset" mode="cost">
    <xsl:variable name="assetCost">
      <xsl:variable name="featuresCost">
        <xsl:variable name="baseFeaturesCost">
          <xsl:value-of select="count(features/feature[@type!='Focus'][@type!='Harmful'][@type!='Numerous'][@type!='Protective'][@type!='Resilient'][@type!='Sturdy'])"/>
        </xsl:variable>

        <xsl:variable name="moreFeaturesCost">
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
        <xsl:value-of select="$baseFeaturesCost + $moreFeaturesCost"/>
      </xsl:variable>

      <xsl:variable name="flawsCost">
        <xsl:variable name="baseFlawsCost">
          <xsl:value-of select="count(flaws/flaw[@type!='Consuming'])"/>
        </xsl:variable>
        <xsl:variable name="moreFlawsCost">
          <xsl:value-of select="2 * count(flaws/flaw[@type='Consuming'])"/>
        </xsl:variable>
        <xsl:value-of select="$baseFlawsCost + $moreFlawsCost"/>
      </xsl:variable>
      <!-- initial expenditure of 1 Refresh buys 2 Features and 1 Flaw, 2 Features / Refresh after that -->
      <xsl:value-of select="1 + ceiling((($featuresCost - 2) - ($flawsCost - 1)) div 2)"/>
    </xsl:variable>
    <xsl:value-of select="$assetCost"/>
  </xsl:template>

  <xsl:template match="asset" mode="wrapped-cost">
    <cost>
      <xsl:apply-templates select="." mode="cost"/>
    </cost>
  </xsl:template>

  <xsl:template match="asset">
    <xsl:variable name="assetCost">
      <xsl:apply-templates select="." mode="cost"/>
    </xsl:variable>
    <tr>
      <td>
        <fieldset class="asset">
          <dl>
              <dt>Name:</dt>
              <dd><xsl:value-of select="@name"/> (<xsl:value-of select="@type"/>) [<xsl:value-of select="$assetCost"/>]</dd>
            <xsl:if test="@function">
              <dt>Function:</dt>
              <dd><xsl:value-of select="@function"/></dd>
            </xsl:if>
            <xsl:if test="@guiding-aspect">
              <xsl:call-template name="guiding-aspect">
                <xsl:with-param name="type">
                  <xsl:value-of select="@guiding-aspect"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:apply-templates select="features/feature"/>
            <xsl:apply-templates select="flaws/flaw"/>
            <xsl:apply-templates select="notes"/>
          </dl>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
