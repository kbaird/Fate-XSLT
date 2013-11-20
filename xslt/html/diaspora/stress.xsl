<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="../fate-common/stress.xsl"/>
 <xsl:template name="diaspora-stress">
  <table border="1" id="stress">
   <xsl:call-template name="pre-core-stress">
    <xsl:with-param name="baseCount">3</xsl:with-param>
    <xsl:with-param name="colSpan">5</xsl:with-param>
    <xsl:with-param name="headerName">Health</xsl:with-param>
    <xsl:with-param name="skillName">Stamina</xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="pre-core-stress">
    <xsl:with-param name="baseCount">3</xsl:with-param>
    <xsl:with-param name="colSpan">5</xsl:with-param>
    <xsl:with-param name="headerName">Composure</xsl:with-param>
    <xsl:with-param name="skillName">Resolve</xsl:with-param>
   </xsl:call-template>
   <xsl:call-template name="pre-core-stress">
    <xsl:with-param name="baseCount">3</xsl:with-param>
    <xsl:with-param name="colSpan">5</xsl:with-param>
    <xsl:with-param name="headerName">Wealth</xsl:with-param>
    <xsl:with-param name="skillName">Assets</xsl:with-param>
   </xsl:call-template>
  </table>
 </xsl:template>
</xsl:stylesheet>
