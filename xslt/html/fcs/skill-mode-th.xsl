<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skill-mode-th">
  <xsl:param name="rating"/>
  <xsl:for-each select="/character/skills/mode[@rating=$rating]">
   <xsl:call-template name="name-of-rating">
    <xsl:with-param name="rating" select="$rating"/>
   </xsl:call-template>
   (+<xsl:value-of select="$rating"/>)
   <xsl:value-of select="@name"/>
  </xsl:for-each>
 </xsl:template>

</xsl:stylesheet>
