<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="asset-stress-boxes">
    <xsl:if test="/character/assets/asset[@type!='Ally']/features/feature[@type='Sturdy']/@effect">
      <xsl:variable name="max">
        <xsl:for-each select="/character/assets/asset[@type!='Ally']/features/feature[@type='Sturdy']/@effect">
          <xsl:sort select="." data-type="number" order="descending"/>
          <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <tr colspan="3">
        <td><xsl:value-of select="$max"/></td>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
