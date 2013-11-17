<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template name="fcs_head">
  <xsl:param name="useConditions"/>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
    <title><xsl:value-of select="id/charname"/></title>
    <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"/>
    <style type="text/css">
      @import url(./css/fate.css);
      @import url(./css/fcs.css);
    <xsl:if test="$useConditions='true'">
      @import url(./css/conditions.css);
    </xsl:if>
    </style>
  </head>
</xsl:template>

</xsl:stylesheet>
