<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="aspect-name">
    <xsl:param name="aspect-name"/>
    <xsl:value-of select="$aspect-name"/>
    <xsl:if test="@signature='true'">
      <xsl:text>*</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
