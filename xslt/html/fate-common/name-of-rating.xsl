<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="name-of-rating">
  <xsl:param name="rating"/>
  <xsl:choose>
   <xsl:when test="$rating='5'">
    <xsl:text>Superb</xsl:text>
   </xsl:when>
   <xsl:when test="$rating='4'">
    <xsl:text>Great</xsl:text>
   </xsl:when>
   <xsl:when test="$rating='3'">
    <xsl:text>Good</xsl:text>
   </xsl:when>
   <xsl:when test="$rating='2'">
    <xsl:text>Fair</xsl:text>
   </xsl:when>
   <xsl:when test="$rating='1'">
    <xsl:text>Average</xsl:text>
   </xsl:when>
  </xsl:choose>
 </xsl:template>
</xsl:stylesheet>
