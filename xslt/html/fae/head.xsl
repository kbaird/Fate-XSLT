<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template name="fae_head">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
    <title><xsl:value-of select="id/charname"/></title>
    <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"/>
    <style type="text/css">
      @import url(./css/fate.css);
      @import url(./css/fae.css);
    </style>
  </head>
</xsl:template>

</xsl:stylesheet>
