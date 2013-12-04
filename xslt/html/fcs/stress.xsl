<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="../fate-common/stress.xsl"/>
 <xsl:template name="stress">
  <table border="1" id="stress">
   <xsl:call-template name="generic-stress">
    <xsl:with-param name="baseCount">2</xsl:with-param>
    <xsl:with-param name="headerName">Physical Stress (Physique)</xsl:with-param>
    <xsl:with-param name="skillName">Physique</xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="generic-stress">
    <xsl:with-param name="baseCount">2</xsl:with-param>
    <xsl:with-param name="headerName">Mental Stress (Will)</xsl:with-param>
    <xsl:with-param name="skillName">Will</xsl:with-param>
   </xsl:call-template>
  </table>
 </xsl:template>
</xsl:stylesheet>
