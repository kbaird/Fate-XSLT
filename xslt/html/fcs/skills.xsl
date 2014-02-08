<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="skills">
  <xsl:variable name="useSkillModes">
   <xsl:choose>
    <xsl:when test="/character/hacks/@skill-modes='true'">true</xsl:when>
    <xsl:otherwise>false</xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <table id="skills">
   <xsl:choose>
    <xsl:when test="$useSkillModes='true'">
     <p>Skill Modes</p>
    </xsl:when>
    <xsl:otherwise>
     <tr>
      <th colspan="6" class="sectionheader">Skills</th>
     </tr>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating">5</xsl:with-param>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating">4</xsl:with-param>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating">3</xsl:with-param>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating">2</xsl:with-param>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating">1</xsl:with-param>
     </xsl:call-template>
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
    <th class="rating">
     <xsl:value-of select="$textRating"/> (+<xsl:value-of select="$rating"/>)</th>
    <xsl:for-each select="/character/skills/skill[@rating=$rating]">
     <td>
      <xsl:value-of select="@name"/>
     </td>
    </xsl:for-each>
   </tr>
  </xsl:if>
 </xsl:template>
</xsl:stylesheet>
