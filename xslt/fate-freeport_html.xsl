<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="html/fcs/fcs_common.xsl"/>
 <xsl:include href="html/fate-common/stunts.xsl"/>
 <xsl:include href="html/fcs/phase-trio.xsl"/>
 <xsl:include href="html/fate-freeport/skills.xsl"/>
 <xsl:include href="html/fate-freeport/stress.xsl"/>
 <xsl:template match="/">
  <xsl:apply-templates select="character">
   <xsl:with-param name="moreCSS">freeport</xsl:with-param>
  </xsl:apply-templates>
 </xsl:template>
</xsl:stylesheet>
