<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/stress.xsl"/>
  <xsl:template name="stress">
    <xsl:param name="useSkillModes"/>
    <xsl:variable name="stressBaseCount">
      <xsl:choose>
        <xsl:when test="/character/hacks/@stress-base-count">
          <xsl:value-of select="/character/hacks/@stress-base-count"/>
        </xsl:when>
        <xsl:otherwise>2</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <table id="stress_table">
      <xsl:call-template name="generic-stress">
        <xsl:with-param name="baseCount">
          <xsl:value-of select="$stressBaseCount"/>
        </xsl:with-param>
        <xsl:with-param name="headerName">Physical Stress</xsl:with-param>
        <xsl:with-param name="skillName">Physique</xsl:with-param>
        <xsl:with-param name="useSkillModes">
          <xsl:value-of select="$useSkillModes"/>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="generic-stress">
        <xsl:with-param name="baseCount">
          <xsl:value-of select="$stressBaseCount"/>
        </xsl:with-param>
        <xsl:with-param name="headerName">Mental Stress</xsl:with-param>
        <xsl:with-param name="skillName">Will</xsl:with-param>
        <xsl:with-param name="useSkillModes">
          <xsl:value-of select="$useSkillModes"/>
        </xsl:with-param>
      </xsl:call-template>
    </table>
  </xsl:template>
</xsl:stylesheet>
