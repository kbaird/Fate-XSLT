<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="refresh">
    <xsl:variable name="assetTotalCost">
      <xsl:value-of select="/character/refresh/@base"/>
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
