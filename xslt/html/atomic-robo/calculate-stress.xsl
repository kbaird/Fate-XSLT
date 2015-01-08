<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
      <xsl:variable name="splitModeDupeRemoval">
        <!-- This variable exists to ensure that Fair Modes with stress-type of 'split' are
             not counted twice, since Fair Modes can only add a single stress box. I have
             arbitrarily decided on Physical Stress as the default for only 1 split box. -->
        <xsl:choose>
          <xsl:when test="$stressType='physical'">
            <!-- Allow Fair Split Modes to add to Physical Stress boxes, so remove nothing. -->
            <xsl:value-of select="0"/>
          </xsl:when>
          <xsl:otherwise>
            <!-- Don't allow Fair Split Modes to add to any other Stress boxes, so remove the false
                 positive additions (the count of Modes that are rated Fair (+2) and have split stress). -->
            <xsl:value-of select="count(/character/skills/mode[@stress-type='split'][@rating='2'])"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="matchingModeRatingsSplitRaw">
        <xsl:value-of select="floor(sum(/character/skills/mode[@stress-type='split']/@rating) div 2)"/>
      </xsl:variable>
      <xsl:variable name="matchingModeRatingsSplit">
        <!-- A Split mode at rating 2 should only add to one stress type, not both. -->
        <xsl:value-of select="$matchingModeRatingsSplitRaw - $splitModeDupeRemoval"/>
      </xsl:variable>
      <xsl:value-of select="$matchingModeRatingsPure + $matchingModeRatingsSplit"/>
    </xsl:variable>
    <xsl:value-of select="2 + $matchingModeRatingsSum - $matchingModeCount"/>
  </xsl:template>
</xsl:stylesheet>
