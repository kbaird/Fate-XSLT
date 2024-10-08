<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="pad-stunt">
    <xsl:param name="name"/>
    <xsl:if test="string-length($name) &gt; 8 and string-length(@notes) &lt; 1">
      <xsl:variable name="customPadding">
        <xsl:value-of select="8 + (string-length($name) div 8)"/>
      </xsl:variable>
      <xsl:attribute name="style">padding-left: <xsl:value-of select="$customPadding"/>em</xsl:attribute>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
