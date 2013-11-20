<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="html/fcs/fcs_common.xsl"/>
 <xsl:include href="html/sotc/character.xsl"/>
 <xsl:include href="html/sotc/copyright.xsl"/>
 <xsl:include href="html/sotc/gadgets.xsl"/>
 <xsl:include href="html/sotc/id.xsl"/>
 <xsl:include href="html/sotc/stress.xsl"/>
 <xsl:template match="/">
  <xsl:apply-templates select="character"/>
 </xsl:template>
</xsl:stylesheet>
