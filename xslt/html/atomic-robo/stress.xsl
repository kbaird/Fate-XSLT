<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="../fate-common/stress.xsl"/>
 <xsl:template name="atomic-robo-stress">
  <table border="1" id="stress">
   <xsl:call-template name="simple-stress">
    <xsl:with-param name="count">
     <xsl:value-of select="/character/stress/@physical"/>
    </xsl:with-param>
    <xsl:with-param name="headerName">Physical Stress</xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="simple-stress">
    <xsl:with-param name="count">
     <xsl:value-of select="/character/stress/@mental"/>
    </xsl:with-param>
    <xsl:with-param name="headerName">Mental Stress</xsl:with-param>
   </xsl:call-template>
  </table>
 </xsl:template>
 <xsl:template name="simple-stress">
  <xsl:param name="count"/>
  <xsl:param name="headerName"/>
  <xsl:call-template name="stress-header">
   <xsl:with-param name="headerName" select="$headerName"/>
   <xsl:with-param name="maxCount"   select="$count"/>
  </xsl:call-template>
  <xsl:call-template name="base-stress-boxes">
   <xsl:with-param name="current" select="$count"/>
  </xsl:call-template>
 </xsl:template>
</xsl:stylesheet>
