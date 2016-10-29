<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/stress.xsl"/>
  <xsl:template name="stress">
    <xsl:param name="useCreditStress"/>
    <xsl:param name="useSkillModes"/>
    <xsl:param name="useSystemsStress"/>
    <xsl:variable name="stressBaseCount">
      <xsl:choose>
        <xsl:when test="/character/hacks/@stress-base-count">
          <xsl:value-of select="/character/hacks/@stress-base-count"/>
        </xsl:when>
        <xsl:otherwise>2</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <table id="stress_table">
      <xsl:choose>
        <xsl:when test="/character/hacks/@single-stress-track='true'">
          <xsl:call-template name="generic-stress">
            <xsl:with-param name="baseCount">
              <xsl:value-of select="$stressBaseCount"/>
            </xsl:with-param>
            <xsl:with-param name="headerName">Stress</xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="/character/stress">
              <xsl:call-template name="generic-stress">
                <xsl:with-param name="baseCount">
                  <xsl:value-of select="/character/stress/@physical"/>
                </xsl:with-param>
                <xsl:with-param name="headerName">Physical Stress</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="generic-stress">
                <xsl:with-param name="baseCount">
                  <xsl:value-of select="/character/stress/@mental"/>
                </xsl:with-param>
                <xsl:with-param name="headerName">Mental Stress</xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
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
              <xsl:if test="$useCreditStress='true'">
                <xsl:call-template name="generic-stress">
                  <xsl:with-param name="baseCount">
                    <xsl:value-of select="$stressBaseCount"/>
                  </xsl:with-param>
                  <xsl:with-param name="headerName">Credit Stress</xsl:with-param>
                  <xsl:with-param name="skillName">Resources</xsl:with-param>
                  <xsl:with-param name="useSkillModes">
                    <xsl:value-of select="$useSkillModes"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$useSystemsStress='true'">
                <xsl:call-template name="generic-stress">
                  <xsl:with-param name="baseCount">
                    <xsl:value-of select="$stressBaseCount"/>
                  </xsl:with-param>
                  <xsl:with-param name="headerName">Systems Stress</xsl:with-param>
                  <xsl:with-param name="skillName">Systems</xsl:with-param>
                  <xsl:with-param name="useSkillModes">
                    <xsl:value-of select="$useSkillModes"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="hacks/@wealth-stress='true'">
                <xsl:call-template name="generic-stress">
                  <xsl:with-param name="baseCount">2</xsl:with-param>
                  <xsl:with-param name="maxCount">4</xsl:with-param>
                  <xsl:with-param name="headerName">Wealth Stress</xsl:with-param>
                  <xsl:with-param name="skillName">Resources</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template>
</xsl:stylesheet>
