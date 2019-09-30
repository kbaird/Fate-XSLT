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
        <h1><xsl:value-of select="id/charname"/></h1>
        <section id="id">
          <xsl:apply-templates select="id"/>
        </section>
        <section id="fate-logo">
          <span id="fate">
            <img alt="Powered By Fate" src="./powered_by_fate.svg" style="height: 2em; width: 5.15em"/>
          </span>
          <table>
            <tr>
              <xsl:call-template name="refresh"/>
            </tr>
          </table>
        </section>
        <wbr/>
        <section id="aspects">
          <xsl:apply-templates select="aspects"/>
        </section>
        <section id="skills">
          <xsl:apply-templates select="skills">
            <xsl:with-param name="useSkillModes">
              <xsl:value-of select="$useSkillModes"/>
            </xsl:with-param>
          </xsl:apply-templates>
        </section>
        <wbr/>
        <section id="extras">
          <xsl:apply-templates select="extras"/>
        </section>
        <section id="stunts">
          <xsl:apply-templates select="stunts"/>
        </section>
        <wbr/>
        <section id="stress">
          <xsl:call-template name="stress">
            <xsl:with-param name="useCorruption">
              <xsl:value-of select="$useCorruption"/>
            </xsl:with-param>
            <xsl:with-param name="useSkillModes">
              <xsl:value-of select="$useSkillModes"/>
            </xsl:with-param>
          </xsl:call-template>
        </section>
        <section id="consequences">
          <xsl:choose>
            <xsl:when test="$useConditions='true'">
              <xsl:call-template name="conditions"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="consequences"/>
            </xsl:otherwise>
          </xsl:choose>
        </section>
        <xsl:apply-templates select="phase-trio"/>
        <xsl:apply-templates select="notes"/>
        <xsl:call-template name="copyright"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
