<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:key name="skill-name" match="/character/skills/role/skill" use="@name"/>
  <xsl:output method="html"/>
  <xsl:include href="skill-role-td.xsl"/>
  <xsl:template name="skill-role-tds">
    <xsl:param name="skillRating"/>
    <xsl:element name="ul">
      <xsl:for-each select="/character/skills/role/skill">
        <xsl:sort select="@name"/>
        <xsl:if test="generate-id() = generate-id(key('skill-name', normalize-space(@name)))">
          <xsl:call-template name="skill-role-td">
            <xsl:with-param name="skillRating" select="$skillRating"/>
            <xsl:with-param name="skillName" select="@name"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/character/skills/skill">
        <xsl:call-template name="skill-role-td">
          <xsl:with-param name="skillRating" select="$skillRating"/>
          <xsl:with-param name="skillName" select="@name"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
