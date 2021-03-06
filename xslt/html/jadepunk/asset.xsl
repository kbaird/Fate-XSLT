<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="asset-cost.xsl"/>
  <xsl:include href="feature.xsl"/>
  <xsl:include href="flaw.xsl"/>
  <xsl:include href="guiding-aspect.xsl"/>
  <xsl:include href="notes.xsl"/>

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
