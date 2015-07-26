<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="asset-cost.xsl"/>

  <xsl:template match="asset" mode="wrapped-cost">
    <cost>
      <xsl:apply-templates select="." mode="cost"/>
    </cost>
  </xsl:template>

</xsl:stylesheet>
