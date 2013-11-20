<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="../fate-common/stress.xsl"/>
 <xsl:template name="stress">
  <table border="1" id="stress">
   <xsl:call-template name="pre-core-stress">
    <xsl:with-param name="baseCount">3</xsl:with-param>
    <xsl:with-param name="colSpan">3</xsl:with-param>
    <xsl:with-param name="headerName">Stress</xsl:with-param>
   </xsl:call-template>
  </table>
 </xsl:template>
</xsl:stylesheet>
