<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  exclude-result-prefixes="exsl">
  <xsl:output method="html"/>
  <xsl:template match="refresh" mode="asset-cost">
  </xsl:template>

  <xsl:template match="refresh">
    <xsl:variable name="assetTotalCost">
      <xsl:variable name="assetWrappedCost">
        <values>
          <xsl:apply-templates select="/character/assets/asset" mode="wrapped-cost"/>
        </values>
      </xsl:variable>
      <xsl:variable name="values" select="exsl:node-set($assetWrappedCost)/values/cost" />
      <xsl:value-of select="sum($values)"/>
    </xsl:variable>
    <xsl:variable name="baseRefresh">
      <xsl:value-of select="/character/refresh/@base"/>
    </xsl:variable>
    <xsl:variable name="currentRefresh">
      <xsl:value-of select="$baseRefresh - $assetTotalCost"/>
    </xsl:variable>
    <xsl:variable name="currentFatePoints">
      <xsl:choose>
        <xsl:when test="/character/refresh/@current">
          <xsl:value-of select="/character/refresh/@current"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$currentRefresh"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <td>
      <dl id="refresh">
        <dt>Refresh:</dt>
        <dd class="box">
          <xsl:value-of select="$currentRefresh"/>
          <xsl:text>/</xsl:text>
          <xsl:value-of select="$baseRefresh"/>
        </dd>
      </dl>
    </td>
    <td>
      <dl id="current-fate-points">
        <dt>Current <acronym title="Fate Points">FP</acronym>:</dt>
        <dd class="box"><xsl:value-of select="$currentFatePoints"/></dd>
      </dl>
    </td>
  </xsl:template>
</xsl:stylesheet>
