<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skill.xsl"/>
  <xsl:include href="skill-modes.xsl"/>
  <xsl:include href="skills-with-modes.xsl"/>
  <xsl:include href="skills-without-modes.xsl"/>
  <xsl:template match="skills">
    <xsl:param name="useSkillModes"/>
    <table id="skills">
      <xsl:choose>
        <xsl:when test="$useSkillModes='true'">
          <xsl:call-template name="skills-with-modes"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="skills-without-modes"/>
        </xsl:otherwise>
      </xsl:choose>
    </table>
  </xsl:template>
</xsl:stylesheet>
