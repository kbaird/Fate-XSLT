<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="asset-stress-boxes">
    <xsl:if test="/character/assets/asset[@type!='Ally']/features/feature[@type='Sturdy']/@bonus">
      <xsl:variable name="max">
        <xsl:for-each select="/character/assets/asset[@type!='Ally']/features/feature[@type='Sturdy']/@bonus">
          <xsl:sort select="." data-type="number" order="descending"/>
          <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <tr colspan="3">
        <td><xsl:value-of select="1"/></td>
        <xsl:if test="$max &gt; 1">
        <td><xsl:value-of select="2"/></td>
        </xsl:if>
        <xsl:if test="$max &gt; 2">
        <td><xsl:value-of select="3"/></td>
        </xsl:if>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
