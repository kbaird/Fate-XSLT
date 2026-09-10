<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="skills">
    <xsl:param name="useSkillModes"/>
    <xsl:choose>
      <xsl:when test="/character/hacks/@skill-roles='true'">
        <table id="skills_table">
          <xsl:call-template name="skills-with-roles"/>
        </table>
      </xsl:when>
      <xsl:when test="$useSkillModes">
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
    <xsl:if test="../languages and not(@shape='flat')">
      <xsl:call-template name="languages-section"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
