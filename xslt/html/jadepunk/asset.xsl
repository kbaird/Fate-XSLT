<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="asset-features-cost.xsl"/>
  <xsl:include href="feature.xsl"/>
  <xsl:include href="flaw.xsl"/>
  <xsl:include href="guiding-aspect.xsl"/>
  <xsl:include href="notes.xsl"/>

  <xsl:template match="asset" mode="cost">
    <xsl:variable name="assetCost">
      <xsl:variable name="featuresCost">
        <xsl:apply-templates select="." mode="features-cost"/>
      </xsl:variable>

      <xsl:variable name="flawsCost">
        <xsl:variable name="baseFlawsCost">
          <xsl:value-of select="count(flaws/flaw[@type!='Consuming'])"/>
        </xsl:variable>
        <xsl:variable name="specialFlawsCost">
          <xsl:value-of select="2 * count(flaws/flaw[@type='Consuming'])"/>
        </xsl:variable>
        <xsl:value-of select="$baseFlawsCost + $specialFlawsCost"/>
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
