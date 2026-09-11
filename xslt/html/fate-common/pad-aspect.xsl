<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="pad-aspect">
    <xsl:param name="name"/>
    <xsl:if test="string-length($name) &gt; 17">
      <xsl:variable name="customPadding" select="10 + floor(string-length($name) div 6)"/>
      <xsl:attribute name="style">padding-left: <xsl:value-of select="$customPadding"/>em</xsl:attribute>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
