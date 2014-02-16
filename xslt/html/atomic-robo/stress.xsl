<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="../fate-common/stress.xsl"/>
 <xsl:template name="atomic-robo-stress">
  <xsl:variable name="maxCount">
   <xsl:choose>
    <xsl:when test="/character/stress/@physical &gt; /character/stress/@mental">
     <xsl:value-of select="/character/stress/@physical"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="/character/stress/@mental"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <table border="1" id="stress">
   <xsl:call-template name="simple-stress">
    <xsl:with-param name="count">
     <xsl:value-of select="/character/stress/@physical"/>
    </xsl:with-param>
    <xsl:with-param name="headerName">Physical Stress</xsl:with-param>
    <xsl:with-param name="maxCount">
     <xsl:value-of select="$maxCount"/>
    </xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="simple-stress">
    <xsl:with-param name="count">
     <xsl:value-of select="/character/stress/@mental"/>
    </xsl:with-param>
    <xsl:with-param name="headerName">Mental Stress</xsl:with-param>
    <xsl:with-param name="maxCount">
     <xsl:value-of select="$maxCount"/>
    </xsl:with-param>
   </xsl:call-template>
  </table>
 </xsl:template>
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
