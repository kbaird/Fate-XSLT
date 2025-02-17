<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="character">
    <xsl:param name="moreCSS"/>
    <xsl:variable name="useConditions">
      <xsl:choose>
        <xsl:when test="hacks/@conditions='true'">true</xsl:when>
        <xsl:when test="hacks/@conditions='wwn'">wwn</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="useCreditStress">
      <xsl:choose>
        <xsl:when test="hacks/@credit-stress='true'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="useSkillModes">
      <xsl:choose>
        <xsl:when test="hacks/@skill-modes='true'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="useSystemsStress">
      <xsl:choose>
        <xsl:when test="hacks/@systems-stress='true'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="wealthStressCount">
      <xsl:choose>
        <xsl:when test="hacks/@wealth-stress-count">
          <xsl:value-of select="hacks/@wealth-stress-count"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="moreCSS">
          <xsl:value-of select="$moreCSS"/>
        </xsl:with-param>
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
          <xsl:apply-templates select="professions"/>
          <xsl:apply-templates select="approaches"/>
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
            <xsl:with-param name="useCreditStress">
              <xsl:value-of select="$useCreditStress"/>
            </xsl:with-param>
            <xsl:with-param name="useSkillModes">
              <xsl:value-of select="$useSkillModes"/>
            </xsl:with-param>
            <xsl:with-param name="useSystemsStress">
              <xsl:value-of select="$useSystemsStress"/>
            </xsl:with-param>
            <xsl:with-param name="wealthStressCount">
              <xsl:value-of select="$wealthStressCount"/>
            </xsl:with-param>
          </xsl:call-template>
        </section>
        <section id="consequences">
          <xsl:choose>
            <xsl:when test="$useConditions='true'">
              <xsl:call-template name="conditions"/>
            </xsl:when>
            <xsl:when test="$useConditions='wwn'">
              <xsl:call-template name="conditions-wwn"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="consequences"/>
            </xsl:otherwise>
          </xsl:choose>
        </section>
        <xsl:apply-templates select="phase-trio"/>
        <xsl:apply-templates select="notes"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
