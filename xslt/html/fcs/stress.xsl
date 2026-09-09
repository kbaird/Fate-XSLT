<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/stress.xsl"/>
  <xsl:template name="stress">
    <xsl:param name="useCreditStress"/>
    <xsl:param name="useSystemsStress"/>
    <xsl:param name="wealthStressCount"/>
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
              </xsl:call-template>
              <xsl:call-template name="generic-stress">
                <xsl:with-param name="baseCount">
                  <xsl:value-of select="$stressBaseCount"/>
                </xsl:with-param>
                <xsl:with-param name="headerName">Mental Stress</xsl:with-param>
                <xsl:with-param name="skillName">Will</xsl:with-param>
              </xsl:call-template>
              <xsl:if test="$useCreditStress='true'">
                <xsl:call-template name="generic-stress">
                  <xsl:with-param name="baseCount">
                    <xsl:value-of select="$stressBaseCount"/>
                  </xsl:with-param>
                  <xsl:with-param name="headerName">Credit Stress</xsl:with-param>
                  <xsl:with-param name="skillName">Resources</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$useSystemsStress='true'">
                <xsl:call-template name="generic-stress">
                  <xsl:with-param name="baseCount">
                    <xsl:value-of select="$stressBaseCount"/>
                  </xsl:with-param>
                  <xsl:with-param name="headerName">Systems Stress</xsl:with-param>
                  <xsl:with-param name="skillName">Systems</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$wealthStressCount &gt; 0">
                <xsl:call-template name="stress-header">
                  <xsl:with-param name="headerName">Wealth Stress</xsl:with-param>
                  <xsl:with-param name="maxCount">
                    <xsl:value-of select="$wealthStressCount"/>
                  </xsl:with-param>
                </xsl:call-template>
                <tr>
                  <xsl:call-template name="base-stress-boxes">
                    <xsl:with-param name="current">1</xsl:with-param>
                    <xsl:with-param name="max">
                      <xsl:value-of select="$wealthStressCount"/>
                    </xsl:with-param>
                  </xsl:call-template>
                </tr>
              </xsl:if>
              <xsl:if test="/character/hacks/@corruption='true'">
                <xsl:call-template name="corruption-stress"/>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template>
</xsl:stylesheet>
