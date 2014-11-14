<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="generic-stress">
    <xsl:param name="baseCount"/>
    <xsl:param name="maxCount" select="$baseCount + 2"/>
    <xsl:param name="headerName"/>
    <xsl:param name="skillName"/>
    <xsl:param name="useSkillModes"/>
    <xsl:call-template name="stress-header">
      <xsl:with-param name="headerName" select="$headerName"/>
      <xsl:with-param name="maxCount" select="$maxCount"/>
    </xsl:call-template>
    <tr>
      <xsl:call-template name="base-stress-boxes">
        <xsl:with-param name="current">1</xsl:with-param>
        <xsl:with-param name="max">
          <xsl:value-of select="$baseCount"/>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="more-stress-boxes">
        <xsl:with-param name="baseCount">
          <xsl:value-of select="$baseCount"/>
        </xsl:with-param>
        <xsl:with-param name="maxCount">
          <xsl:value-of select="$maxCount"/>
        </xsl:with-param>
        <xsl:with-param name="skillRating">
          <xsl:choose>
            <xsl:when test="$useSkillModes='true'">
              <xsl:call-template name="skill-rating-by-name">
                <xsl:with-param name="skillName">
                  <xsl:value-of select="$skillName"/>
                </xsl:with-param>
                <xsl:with-param name="modeRating">
                  <xsl:choose>
                    <xsl:when test="$skillName='Physique'">
                      <xsl:value-of select="/character/skills/mode[@name='Action']/@rating"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="/character/skills/mode[@name='Banter']/@rating &gt; /character/skills/mode[@name='Science']/@rating">
                          <xsl:value-of select="/character/skills/mode[@name='Banter']/@rating"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="/character/skills/mode[@name='Science']/@rating"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="/character/skills/skill[@name=$skillName]/@rating"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </tr>
  </xsl:template>
</xsl:stylesheet>
