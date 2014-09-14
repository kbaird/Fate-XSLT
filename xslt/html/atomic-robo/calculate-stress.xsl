<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="calculate-stress">
  <xsl:param name="stressType"/>
  <xsl:variable name="matchingModeCount">
   <xsl:value-of select="count(/character/skills/mode[@stress-type=$stressType])"/>
  </xsl:variable>
  <xsl:variable name="matchingModeRatingsSum">
   <xsl:variable name="matchingModeRatingsPure">
    <xsl:value-of select="sum(/character/skills/mode[@stress-type=$stressType]/@rating)"/>
   </xsl:variable>
   <xsl:variable name="matchingModeRatingsSplit">
    <xsl:value-of select="floor(sum(/character/skills/mode[@stress-type='split']/@rating) div 2)"/>
   </xsl:variable>
    <xsl:value-of select="$matchingModeRatingsPure + $matchingModeRatingsSplit"/>
  </xsl:variable>
  <xsl:value-of select="2 + $matchingModeRatingsSum - $matchingModeCount"/>
 </xsl:template>

</xsl:stylesheet>
