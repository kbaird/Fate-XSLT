<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="head">
  <xsl:param name="baseCSS"/>
  <xsl:param name="additionalCSS"/>
  <xsl:param name="useConditions"/>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
   <title>
    <xsl:value-of select="id/charname"/>
   </title>
   <style type="text/css">
      @import url("http://fonts.googleapis.com/css?family=Montserrat");
      @import url(./css/fate.css);
      @import url(./css/<xsl:value-of select="$baseCSS"/>.css);
    <xsl:if test="$additionalCSS">
      @import url(./css/<xsl:value-of select="$additionalCSS"/>.css);
    </xsl:if>
    <xsl:if test="$useConditions='true'">
      @import url(./css/conditions.css);
    </xsl:if>
   </style>
  </head>
 </xsl:template>
</xsl:stylesheet>
