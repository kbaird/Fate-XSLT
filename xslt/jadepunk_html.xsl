<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="html/fae/stress.xsl"/>
 <xsl:include href="html/fate-common/aspects.xsl"/>
 <xsl:include href="html/fate-common/current-fate-points.xsl"/>
 <xsl:include href="html/fate-common/head.xsl"/>
 <xsl:include href="html/fate-common/id.xsl"/>
 <xsl:include href="html/fate-common/name-of-rating.xsl"/>
 <xsl:include href="html/fate-common/notes.xsl"/>
 <xsl:include href="html/fate-common/refresh.xsl"/>
 <xsl:include href="html/fcs/conditions.xsl"/>
 <xsl:include href="html/fcs/consequences.xsl"/>
 <xsl:include href="html/jadepunk/assets.xsl"/>
 <xsl:include href="html/jadepunk/character.xsl"/>
 <xsl:include href="html/jadepunk/id.xsl"/>
 <xsl:include href="html/jadepunk/professions.xsl"/>
 <xsl:template match="/">
  <xsl:apply-templates select="character">
   <xsl:with-param name="aspectWidth">
    <xsl:value-of select="40"/>
   </xsl:with-param>
  </xsl:apply-templates>
 </xsl:template>
</xsl:stylesheet>
