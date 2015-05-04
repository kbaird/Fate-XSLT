<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="assets-header.xsl"/>
  <xsl:include href="feature.xsl"/>
  <xsl:include href="flaw.xsl"/>
  <xsl:include href="guiding-aspect.xsl"/>
  <xsl:template match="assets">
    <table>
      <xsl:call-template name="assets-header">
        <xsl:with-param name="label">Assets</xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="asset"/>
    </table>
  </xsl:template>
  <xsl:template match="asset">
    <xsl:variable name="assetCost">
      <xsl:variable name="featuresCost">
        <xsl:variable name="baseFeaturesCost">
          <xsl:value-of select="count(features/feature)"/>
        </xsl:variable>
        <xsl:variable name="moreFeaturesCost">
          <xsl:variable name="exceptionalCost">
            <xsl:value-of select="count(features/feature[@type='Exceptional'])"/>
          </xsl:variable>
          <xsl:variable name="flexibleCost">
            <xsl:value-of select="count(features/feature[@type='Flexible'])"/>
          </xsl:variable>
          <xsl:variable name="focusCost">
            <xsl:variable name="focusEffect">
              <xsl:choose>
                <xsl:when test="features/feature[@type='Focus'][@value]">
                  <xsl:value-of select="sum(features/feature[@type='Focus']/@value)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="1"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:value-of select="$focusEffect - 1"/>
          </xsl:variable>
          <xsl:variable name="harmfulCost">
            <xsl:variable name="harmfulEffect">
              <xsl:choose>
                <xsl:when test="features/feature[@type='Harmful'][@effect]">
                  <xsl:value-of select="sum(features/feature[@type='Harmful']/@effect)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="1"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:value-of select="$harmfulEffect - 1"/>
          </xsl:variable>
          <xsl:variable name="protectiveCost">
            <xsl:value-of select="count(features/feature[@type='Protective'])"/>
          </xsl:variable>
          <xsl:value-of select="$exceptionalCost + $flexibleCost + $focusCost + $harmfulCost + $protectiveCost"/>
        </xsl:variable>
        <xsl:value-of select="$baseFeaturesCost + $moreFeaturesCost"/>
      </xsl:variable>
      <xsl:variable name="flawsCost">
        <xsl:variable name="baseFlawsCost">
          <xsl:value-of select="count(flaws/flaw)"/>
        </xsl:variable>
        <xsl:variable name="moreFlawsCost">
          <xsl:value-of select="count(flaws/flaw[@type='Consuming'])"/>
        </xsl:variable>
        <xsl:value-of select="$baseFlawsCost + $moreFlawsCost"/>
      </xsl:variable>
      <!-- initial expenditure of 1 Refresh buys 2 Features and 1 Flaw, 2 Features / Refresh after that -->
      <xsl:value-of select="1 + ((($featuresCost - 2) - ($flawsCost - 1)) div 2)"/>
    </xsl:variable>
    <tr>
      <td>
        <fieldset class="asset">
          <dl>
            <dt>Refresh Cost:</dt>
            <dd><xsl:value-of select="$assetCost"/></dd>
            <dt>Name:</dt>
            <dd><xsl:value-of select="@name"/></dd>
            <dt>Type:</dt>
            <dd><xsl:value-of select="@type"/></dd>
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
          </dl>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
