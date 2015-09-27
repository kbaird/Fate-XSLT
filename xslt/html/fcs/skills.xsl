<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skill.xsl"/>
  <xsl:include href="flat-skills.xsl"/>
  <xsl:include href="skill-modes.xsl"/>
  <xsl:include href="skills-with-modes.xsl"/>
  <xsl:include href="skills-without-modes.xsl"/>
  <xsl:template match="skills">
    <xsl:param name="useSkillModes"/>
      <xsl:choose>
        <xsl:when test="$useSkillModes='true'">
          <table id="skills_table">
            <xsl:call-template name="skills-with-modes"/>
          </table>
        </xsl:when>
        <xsl:when test="@shape='flat'">
          <table id="professions">
            <xsl:call-template name="flat-skills"/>
          </table>
        </xsl:when>
        <xsl:otherwise>
          <table id="skills_table">
            <xsl:call-template name="skills-without-modes"/>
          </table>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
