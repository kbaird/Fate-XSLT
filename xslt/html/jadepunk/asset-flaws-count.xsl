<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="asset" mode="flaws-count">
    <xsl:variable name="baseFlawsCount" select="count(flaws/flaw[@type!='Consuming'][@type!='Success-With-Style'])"/>
    <xsl:variable name="specialFlawsCount">
      <xsl:variable name="consumingCount" select="2 * count(flaws/flaw[@type='Consuming'])"/>
      <xsl:variable name="successWithStyleCount" select="2 * count(flaws/flaw[@type='Success-With-Style'])"/>
      <xsl:value-of select="$consumingCount + $successWithStyleCount"/>
    </xsl:variable>
    <xsl:value-of select="$baseFlawsCount + $specialFlawsCount"/>
  </xsl:template>

</xsl:stylesheet>
