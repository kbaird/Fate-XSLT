<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="html/fae/fae_common.xsl"/>
 <xsl:template match="/">
  <xsl:apply-templates select="character"/>
 </xsl:template>
</xsl:stylesheet>
