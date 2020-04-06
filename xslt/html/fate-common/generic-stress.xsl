<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="generic-stress">
    <xsl:param name="baseCount"/>
    <xsl:param name="headerName"/>
    <xsl:param name="skillName"/>
    <xsl:param name="useSkillModes"/>
    <xsl:call-template name="stress-header">
      <xsl:with-param name="headerName" select="$headerName"/>
      <xsl:with-param name="maxCount">
        <xsl:choose>
          <xsl:when test="/character/hacks/@one-point-stress='true'">
            <xsl:value-of select="$baseCount + 3"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$baseCount + 2"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
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
          <xsl:choose>
            <xsl:when test="/character/hacks/@one-point-stress='true'">
              <xsl:value-of select="$baseCount + 3"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$baseCount + 2"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
        <xsl:with-param name="skillRating">
          <xsl:value-of select="/character/skills/skill[@name=$skillName]/@rating"/>
        </xsl:with-param>
      </xsl:call-template>
    </tr>
  </xsl:template>
</xsl:stylesheet>
