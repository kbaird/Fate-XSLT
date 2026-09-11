<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="character">
    <xsl:variable name="useConditions" select="hacks/@conditions='true'"/>
    <xsl:variable name="useSkillModes" select="true()"/>
    <html>
      <xsl:call-template name="head">
        <xsl:with-param name="baseCSS">fcs</xsl:with-param>
        <xsl:with-param name="moreCSS">atomic-robo</xsl:with-param>
        <xsl:with-param name="useConditions" select="$useConditions"/>
      </xsl:call-template>
      <body>
        <xsl:call-template name="character-title"/>
        <section id="id">
          <xsl:apply-templates select="id" mode="atomic-robo"/>
        </section>
        <section id="fate-logo">
          <span id="atomic-robo-logo">
            <img alt="Atomic Robo" src="robo_logo.gif"/>
          </span>
          <table>
            <tr>
              <xsl:call-template name="fate-points"/>
              <xsl:call-template name="experience-points"/>
            </tr>
          </table>
        </section>
        <wbr/>
        <xsl:call-template name="aspects-section"/>
        <section id="skills">
          <xsl:apply-templates select="skills">
            <xsl:with-param name="useSkillModes" select="$useSkillModes"/>
          </xsl:apply-templates>
        </section>
        <wbr/>
        <section id="stunts">
          <xsl:apply-templates select="stunts" mode="atomic-robo"/>
        </section>
        <wbr/>
        <section id="stress">
          <xsl:call-template name="atomic-robo-stress"/>
        </section>
        <section id="consequences">
          <xsl:choose>
            <xsl:when test="$useConditions">
              <xsl:call-template name="conditions"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="consequences"/>
            </xsl:otherwise>
          </xsl:choose>
        </section>
        <wbr/>
        <xsl:choose>
          <xsl:when test="experiences/@suppress and experiences/@suppress='true'">
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="experiences"/>
            <xsl:call-template name="experiences-explanation"/>
            <wbr/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="atomic-robo-copyright"/>
        <xsl:call-template name="notes-section"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
