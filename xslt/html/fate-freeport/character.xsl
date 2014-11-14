<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="character">
    <xsl:variable name="useConditions">
      <xsl:choose>
        <xsl:when test="hacks/@conditions='true'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="useCorruption">
      <xsl:choose>
        <xsl:when test="hacks/@corruption='true'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="useSkillModes">
      <xsl:choose>
        <xsl:when test="hacks/@skill-modes='true'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="useConditions">
          <xsl:value-of select="$useConditions"/>
        </xsl:with-param>
      </xsl:call-template>
      <body>
        <h1>
          <xsl:value-of select="id/charname"/>
        </h1>
        <div id="id">
          <xsl:apply-templates select="id"/>
        </div>
        <div id="fate-logo">
          <span id="fate">
            <img alt="Powered By Fate" src="./powered_by_fate.svg" height="60px"/>
          </span>
          <table>
            <tr>
              <xsl:call-template name="refresh"/>
              <xsl:call-template name="current-fate-points"/>
            </tr>
          </table>
        </div>
        <hr/>
        <div id="aspects">
          <xsl:apply-templates select="aspects"/>
        </div>
        <div id="skills">
          <xsl:apply-templates select="skills">
            <xsl:with-param name="useSkillModes">
              <xsl:value-of select="$useSkillModes"/>
            </xsl:with-param>
          </xsl:apply-templates>
        </div>
        <hr/>
        <div id="extras">
          <xsl:apply-templates select="extras"/>
        </div>
        <div id="stunts">
          <xsl:apply-templates select="stunts"/>
        </div>
        <hr/>
        <div id="stress">
          <xsl:call-template name="stress">
            <xsl:with-param name="useCorruption">
              <xsl:value-of select="$useCorruption"/>
            </xsl:with-param>
            <xsl:with-param name="useSkillModes">
              <xsl:value-of select="$useSkillModes"/>
            </xsl:with-param>
          </xsl:call-template>
        </div>
        <div id="consequences">
          <xsl:choose>
            <xsl:when test="$useConditions='true'">
              <xsl:call-template name="conditions"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="consequences"/>
            </xsl:otherwise>
          </xsl:choose>
        </div>
        <xsl:apply-templates select="phase-trio"/>
        <xsl:apply-templates select="notes"/>
        <xsl:call-template name="copyright"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
