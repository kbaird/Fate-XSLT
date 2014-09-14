<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="../fate-common/stress.xsl"/>
 <xsl:include href="calculate-stress.xsl"/>
 <xsl:include href="simple-stress.xsl"/>

 <xsl:template name="atomic-robo-stress">

  <xsl:variable name="mentalStress">
   <xsl:call-template name="calculate-stress">
    <xsl:with-param name="stressType">mental</xsl:with-param>
   </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="physicalStress">
   <xsl:call-template name="calculate-stress">
    <xsl:with-param name="stressType">physical</xsl:with-param>
   </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="maxCount">
   <xsl:choose>
    <xsl:when test="$physicalStress &gt; $mentalStress">
     <xsl:value-of select="$physicalStress"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="$mentalStress"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <table id="stress">
   <xsl:call-template name="simple-stress">
    <xsl:with-param name="count">
     <xsl:value-of select="$physicalStress"/>
    </xsl:with-param>
    <xsl:with-param name="headerName">Physical Stress</xsl:with-param>
    <xsl:with-param name="maxCount">
     <xsl:value-of select="$maxCount"/>
    </xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="simple-stress">
    <xsl:with-param name="count">
     <xsl:value-of select="$mentalStress"/>
    </xsl:with-param>
    <xsl:with-param name="headerName">Mental Stress</xsl:with-param>
    <xsl:with-param name="maxCount">
     <xsl:value-of select="$maxCount"/>
    </xsl:with-param>
   </xsl:call-template>
  </table>
 </xsl:template>

</xsl:stylesheet>
