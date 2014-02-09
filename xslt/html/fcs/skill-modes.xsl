<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skill-rating-by-name">
  <xsl:param name="skillName"/>
  <xsl:param name="modeRating"/>
  <xsl:variable name="skillCount">
   <xsl:value-of select="count(/character/skills/mode/skill[@name=$skillName])"/>
  </xsl:variable>
  <xsl:variable name="skillImprovements">
   <xsl:choose>
    <xsl:when test="/character/skills/mode[@rating=$modeRating]/skill[@name=$skillName]/@add">
     <xsl:value-of select="/character/skills/mode[@rating=$modeRating]/skill[@name=$skillName]/@add"/>
    </xsl:when>
    <xsl:otherwise>
     0
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:value-of select="$modeRating + $skillCount + $skillImprovements - 1"/>
 </xsl:template>

 <xsl:template name="skill-mode-td">
  <xsl:param name="modeRating"/>
  <xsl:param name="skillRating"/>
  <xsl:variable name="actualRating">
   <xsl:call-template name="skill-rating-by-name">
    <xsl:with-param name="skillName"  select="@name"/>
    <xsl:with-param name="modeRating" select="$modeRating"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$actualRating = $skillRating">
   <xsl:value-of select="@name"/>
  </xsl:if>
 </xsl:template>

 <xsl:template name="skill-mode-tds">
  <xsl:param name="modeRating"/>
  <xsl:param name="skillRating"/>
  <xsl:for-each select="/character/skills/mode[@rating=$modeRating]/skill">
   <xsl:call-template name="skill-mode-td">
    <xsl:with-param name="modeRating"  select="$modeRating"/>
    <xsl:with-param name="skillRating" select="$skillRating"/>
   </xsl:call-template>
  </xsl:for-each>
 </xsl:template>

 <xsl:template name="skill-mode-th">
  <xsl:param name="rating"/>
  <xsl:for-each select="/character/skills/mode[@rating=$rating]">
   <xsl:call-template name="name-of-rating">
    <xsl:with-param name="rating" select="$rating"/>
   </xsl:call-template>
   (+<xsl:value-of select="$rating"/>)
   <xsl:value-of select="@name"/>
  </xsl:for-each>
 </xsl:template>

</xsl:stylesheet>
