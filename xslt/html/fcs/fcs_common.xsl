<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:include href="../fate-common/aspects.xsl"/>
<xsl:include href="../fate-common/current-fate-points.xsl"/>
<xsl:include href="../fate-common/id.xsl"/>
<xsl:include href="../fate-common/refresh.xsl"/>
<xsl:include href="../fate-common/stunts.xsl"/>

<xsl:include href="copyright.xsl"/>
<xsl:include href="extras.xsl"/>
<xsl:include href="fcs.xsl"/>
<xsl:include href="skills.xsl"/>
<xsl:include href="stress.xsl"/>

<xsl:template match="/">
<xsl:apply-templates select="fcs"/>
</xsl:template>

</xsl:stylesheet>
