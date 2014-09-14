<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="simple-stress">
  <xsl:param name="count"/>
  <xsl:param name="headerName"/>
  <xsl:param name="maxCount"/>
  <xsl:call-template name="stress-header">
   <xsl:with-param name="headerName" select="$headerName"/>
   <xsl:with-param name="maxCount"   select="$maxCount"/>
  </xsl:call-template>
  <tr>
  <xsl:call-template name="base-stress-boxes">
   <xsl:with-param name="current" select="1"/>
   <xsl:with-param name="max"     select="$count"/>
  </xsl:call-template>
  </tr>
 </xsl:template>

</xsl:stylesheet>
