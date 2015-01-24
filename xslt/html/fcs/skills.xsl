<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
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
  <xsl:template name="skill">
    <xsl:param name="rating"/>
    <xsl:variable name="textRating">
      <xsl:call-template name="name-of-rating">
        <xsl:with-param name="rating" select="$rating"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="/character/skills/skill[@rating=$rating]">
      <tr>
        <th class="rating"><xsl:value-of select="$textRating"/>&#160;(+<xsl:value-of select="$rating"/>)</th>
        <xsl:for-each select="/character/skills/skill[@rating=$rating]">
          <td><xsl:value-of select="@name"/></td>
        </xsl:for-each>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
