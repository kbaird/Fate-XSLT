<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="stress-box-addition.xsl"/>
  <xsl:template name="calculate-pure-stress-by-rating">
    <xsl:param name="rating"/>
    <xsl:param name="stressType"/>
    <xsl:call-template name="stress-box-addition">
      <xsl:with-param name="modeRating">
        <xsl:value-of select="/character/skills/mode[@stress-type=$stressType][@rating = $rating]/@rating"/>
      </xsl:with-param>
      <xsl:with-param name="stressType">
        <xsl:value-of select="$stressType"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="calculate-stress">
    <xsl:param name="stressType"/>
    <xsl:variable name="stressBoxAdditionsPure">
      <xsl:variable name="stressBoxAdditionsPureMax">
        <xsl:call-template name="calculate-pure-stress-by-rating">
          <xsl:with-param name="rating">
            <xsl:value-of select="$maxModeRating"/>
          </xsl:with-param>
          <xsl:with-param name="stressType">
            <xsl:value-of select="$stressType"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="stressBoxAdditionsPureMed">
        <xsl:call-template name="calculate-pure-stress-by-rating">
          <xsl:with-param name="rating">
            <xsl:value-of select="$medModeRating"/>
          </xsl:with-param>
          <xsl:with-param name="stressType">
            <xsl:value-of select="$stressType"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="stressBoxAdditionsPureMin">
        <xsl:call-template name="calculate-pure-stress-by-rating">
          <xsl:with-param name="rating">
            <xsl:value-of select="$minModeRating"/>
          </xsl:with-param>
          <xsl:with-param name="stressType">
            <xsl:value-of select="$stressType"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
      <xsl:value-of select="$stressBoxAdditionsPureMax + $stressBoxAdditionsPureMed + $stressBoxAdditionsPureMin"/>
    </xsl:variable>
    <xsl:variable name="stressBoxAdditionsSplit">
      <xsl:variable name="stressBoxAdditionsSplitMax">
        <xsl:call-template name="stress-box-addition">
          <xsl:with-param name="modeRating">
            <xsl:value-of select="/character/skills/mode[@stress-type='split'][@rating = $maxModeRating]/@rating"/>
          </xsl:with-param>
          <xsl:with-param name="modeType">split</xsl:with-param>
          <xsl:with-param name="stressType">
            <xsl:value-of select="$stressType"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="stressBoxAdditionsSplitMed">
        <xsl:call-template name="stress-box-addition">
          <xsl:with-param name="modeRating">
            <xsl:value-of select="/character/skills/mode[@stress-type='split'][@rating = $medModeRating]/@rating"/>
          </xsl:with-param>
          <xsl:with-param name="modeType">split</xsl:with-param>
          <xsl:with-param name="stressType">
            <xsl:value-of select="$stressType"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="stressBoxAdditionsSplitMin">
        <xsl:call-template name="stress-box-addition">
          <xsl:with-param name="modeRating">
            <xsl:value-of select="/character/skills/mode[@stress-type='split'][@rating = $minModeRating]/@rating"/>
          </xsl:with-param>
          <xsl:with-param name="modeType">split</xsl:with-param>
          <xsl:with-param name="stressType">
            <xsl:value-of select="$stressType"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
      <xsl:value-of select="$stressBoxAdditionsSplitMax + $stressBoxAdditionsSplitMed + $stressBoxAdditionsSplitMin"/>
    </xsl:variable>
    <xsl:value-of select="2 + $stressBoxAdditionsPure + $stressBoxAdditionsSplit"/>
  </xsl:template>
</xsl:stylesheet>
