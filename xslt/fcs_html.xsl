<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:include href="html/fate-common/aspects.xsl"/>
<xsl:include href="html/fate-common/current-fate-points.xsl"/>
<xsl:include href="html/fate-common/id.xsl"/>
<xsl:include href="html/fate-common/refresh.xsl"/>
<xsl:include href="html/fate-common/stunts.xsl"/>

<xsl:include href="html/fcs/consequences.xsl"/>
<xsl:include href="html/fcs/copyright.xsl"/>
<xsl:include href="html/fcs/extras.xsl"/>
<xsl:include href="html/fcs/fcs.xsl"/>
<xsl:include href="html/fcs/skills.xsl"/>
<xsl:include href="html/fcs/stress.xsl"/>

<xsl:template match="/">
<xsl:apply-templates select="fcs"/>
</xsl:template>

</xsl:stylesheet>
