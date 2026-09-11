<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="character">
    <xsl:param name="moreCSS"/>
    <xsl:variable name="useConditions" select="hacks/@conditions='true' or hacks/@conditions='wwn'"/>
    <xsl:variable name="useCreditStress" select="hacks/@credit-stress='true'"/>
    <xsl:variable name="useSkillModes" select="hacks/@skill-modes='true'"/>
    <xsl:variable name="useSystemsStress" select="hacks/@systems-stress='true'"/>
    <xsl:variable name="wealthStressCount" select="number(hacks/@wealth-stress-count)"/>
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="moreCSS">
          <xsl:value-of select="$moreCSS"/>
        </xsl:with-param>
        <xsl:with-param name="useConditions" select="$useConditions"/>
      </xsl:call-template>
      <body>
        <xsl:call-template name="character-title"/>
        <section id="id">
          <xsl:apply-templates select="id"/>
        </section>
        <section id="fate-logo">
          <span id="fate">
            <img alt="Powered By Fate" src="./powered_by_fate.svg" style="height: 2em; width: 5.15em"/>
          </span><xsl:call-template name="refresh-table"/>
        </section>
        <wbr/>
        <xsl:call-template name="aspects-section"/>
        <section id="skills">
          <xsl:apply-templates select="skills">
            <xsl:with-param name="useSkillModes" select="$useSkillModes"/>
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
            <xsl:with-param name="useCreditStress" select="$useCreditStress"/>
            <xsl:with-param name="useSystemsStress" select="$useSystemsStress"/>
            <xsl:with-param name="wealthStressCount" select="$wealthStressCount"/>
          </xsl:call-template>
        </section>
        <section id="consequences">
          <xsl:choose>
            <xsl:when test="hacks/@conditions='wwn'">
              <!-- 'wwn' = the Weird World News World of Adventure conditions set -->
              <xsl:call-template name="conditions-wwn"/>
            </xsl:when>
            <xsl:when test="$useConditions">
              <xsl:call-template name="conditions"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="consequences"/>
            </xsl:otherwise>
          </xsl:choose>
        </section>
        <xsl:apply-templates select="phase-trio"/>
        <xsl:call-template name="notes-section"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
