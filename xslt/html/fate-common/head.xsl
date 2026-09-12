<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="head">
    <xsl:param name="baseCSS"/>
    <xsl:param name="customCSS"/>
    <xsl:param name="moreCSS"/>
    <xsl:param name="useConditions"/>
    <xsl:variable name="cyberpunkStyle" select="/character/hacks/@cyberpunk-style='true'"/>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <title><xsl:value-of select="id/charname"/></title>
      <style type="text/css" media="all">
      @import url("http://fonts.googleapis.com/css?family=<xsl:if test="$cyberpunkStyle">Orbitron|</xsl:if>Cabin|Montserrat|Sriracha");
      @import url(./css/fate.css);
      @import url(./css/<xsl:value-of select="$baseCSS"/>.css);<xsl:if test="string-length($moreCSS) &gt; 0">
      @import url(./css/<xsl:value-of select="$moreCSS"/>.css);</xsl:if>
    <xsl:if test="$useConditions">  @import url(./css/conditions.css);</xsl:if><xsl:if test="string-length($customCSS) &gt; 0">
      @import url(./css/<xsl:value-of select="$customCSS"/>.css);</xsl:if><xsl:if test="$cyberpunkStyle">
      @import url(./css/cyberpunk-style.css);</xsl:if>
   </style>
    </head>
  </xsl:template>
</xsl:stylesheet>
