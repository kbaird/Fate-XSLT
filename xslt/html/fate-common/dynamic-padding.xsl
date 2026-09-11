<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="dynamic-padding">
    <xsl:param name="name"/>
    <xsl:param name="threshold"/>
    <xsl:param name="base"/>
    <xsl:param name="scale"/>
    <xsl:if test="string-length($name) &gt; $threshold">
      <xsl:variable name="customPadding" select="$base + floor(string-length($name) div $scale)"/>
      <xsl:attribute name="style">padding-left: <xsl:value-of select="$customPadding"/>em</xsl:attribute>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
