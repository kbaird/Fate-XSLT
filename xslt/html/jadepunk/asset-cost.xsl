<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="asset-features-cost.xsl"/>
  <xsl:include href="asset-flaws-cost.xsl"/>

  <xsl:template match="asset" mode="cost">
    <xsl:variable name="featuresCost">
      <xsl:apply-templates select="." mode="features-cost"/>
    </xsl:variable>
    <xsl:variable name="flawsCost">
      <xsl:apply-templates select="." mode="flaws-cost"/>
    </xsl:variable>
    <xsl:choose>
      <!-- initial expenditure of 1 Refresh buys 2 Features and 1 Flaw, 2 Features / Refresh after that -->
      <xsl:when test="(1 + ceiling((($featuresCost - 2) - ($flawsCost - 1)) div 2)) &lt; 1">
        <!-- minimum Asset cost of 1 -->
        <xsl:value-of select="1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="1 + ceiling((($featuresCost - 2) - ($flawsCost - 1)) div 2)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
