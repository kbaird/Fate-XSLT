<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:variable name="useConditions">false</xsl:variable>

<xsl:include href="html/fcs/fcs_common.xsl"/>
<xsl:include href="html/fcs/consequences.xsl"/>
<xsl:include href="html/diaspora/diaspora.xsl"/>
<xsl:include href="html/diaspora/id.xsl"/>
<xsl:include href="html/diaspora/stress.xsl"/>

<xsl:template match="/">
<xsl:apply-templates select="diaspora"/>
</xsl:template>

</xsl:stylesheet>
