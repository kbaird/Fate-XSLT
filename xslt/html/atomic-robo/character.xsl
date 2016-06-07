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
    <xsl:variable name="useSkillModes">true</xsl:variable>
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="moreCSS">atomic-robo</xsl:with-param>
      </xsl:call-template>
      <body>
        <h1>
          <xsl:value-of select="id/charname"/>
        </h1>
        <section id="id">
          <xsl:apply-templates select="id" mode="atomic-robo"/>
        </section>
        <figure id="fate-logo">
          <span id="atomic-robo-logo">
            <img alt="Atomic Robo" src="robo_logo.gif"/>
          </span>
          <table>
            <tr>
              <xsl:call-template name="fate-points" mode="atomic-robo"/>
              <xsl:call-template name="experience-points"/>
            </tr>
          </table>
        </figure>
        <hr/>
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
        <hr/>
        <section id="stunts">
          <xsl:apply-templates select="stunts" mode="atomic-robo"/>
        </section>
        <hr/>
        <section id="stress">
          <xsl:call-template name="atomic-robo-stress"/>
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
        <hr/>
        <xsl:choose>
          <xsl:when test="experiences/@suppress and experiences/@suppress='true'">
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="experiences"/>
            <xsl:call-template name="experiences-explanation"/>
            <hr/>
          </xsl:otherwise>
        </xsl:choose>
        <section id="notes">
          <xsl:apply-templates select="notes"/>
        </section>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
