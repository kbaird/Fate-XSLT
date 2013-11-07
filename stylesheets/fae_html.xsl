<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:include href="fae_html/fae.xsl"/>
<xsl:include href="fae_html/approaches.xsl"/>
<xsl:include href="fae_html/aspects.xsl"/>
<xsl:include href="fae_html/consequences.xsl"/>
<xsl:include href="fae_html/id.xsl"/>
<xsl:include href="fae_html/stress.xsl"/>
<xsl:include href="fae_html/stunts.xsl"/>

<xsl:template match="/">
<xsl:apply-templates select="fae"/>
</xsl:template>

</xsl:stylesheet>
