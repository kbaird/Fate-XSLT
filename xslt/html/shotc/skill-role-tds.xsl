<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:key name="skill-name" match="/character/skills/role/skill" use="@name"/>
  <xsl:output method="html"/>
  <xsl:template name="skill-role-tds">
    <xsl:param name="skillRating"/>
    <xsl:for-each select="/character/skills/role/skill">
      <xsl:sort select="@name"/>
      <xsl:if test="generate-id() = generate-id(key('skill-name', normalize-space(@name)))">
        <xsl:variable name="skillName" select="@name"/>
        <xsl:variable name="localSkillRating" select="count(/character/skills/role/skill[@name = $skillName]) +
                                sum(/character/skills/role/skill[@name = $skillName]/@add)"/>
        <xsl:if test="$localSkillRating = $skillRating">
          <xsl:element name="td">
            <xsl:value-of select="$skillName"/>
          </xsl:element>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="/character/skills/skill">
      <xsl:if test="@add = $skillRating">
        <xsl:element name="td">
          <xsl:value-of select="@name"/>
        </xsl:element>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
