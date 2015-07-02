<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="asset" mode="flaws-cost">
    <xsl:variable name="baseFlawsCost">
      <xsl:value-of select="count(flaws/flaw[@type!='Consuming'])"/>
    </xsl:variable>
    <xsl:variable name="specialFlawsCost">
      <xsl:value-of select="2 * count(flaws/flaw[@type='Consuming'])"/>
    </xsl:variable>
    <xsl:value-of select="$baseFlawsCost + $specialFlawsCost"/>
  </xsl:template>

</xsl:stylesheet>
