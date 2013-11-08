<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:include href="html/fae/approaches.xsl"/>
<xsl:include href="html/fae/consequences.xsl"/>
<xsl:include href="html/fae/copyright.xsl"/>
<xsl:include href="html/fae/fae.xsl"/>
<xsl:include href="html/fae/stress.xsl"/>

<xsl:include href="html/fate_common/aspects.xsl"/>
<xsl:include href="html/fate_common/current_fate_points.xsl"/>
<xsl:include href="html/fate_common/id.xsl"/>
<xsl:include href="html/fate_common/refresh.xsl"/>
<xsl:include href="html/fate_common/stunts.xsl"/>

<xsl:template match="/">
<xsl:apply-templates select="fae"/>
</xsl:template>

</xsl:stylesheet>
