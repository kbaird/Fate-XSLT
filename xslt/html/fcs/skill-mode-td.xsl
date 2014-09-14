<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skill-mode-td">
  <xsl:param name="modeRating"/>
  <xsl:param name="skillRating"/>
  <xsl:param name="skillName"/>
  <xsl:variable name="actualRating">
   <xsl:call-template name="skill-rating-by-name">
    <xsl:with-param name="skillName"  select="$skillName"/>
    <xsl:with-param name="modeRating" select="$modeRating"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:if test="($actualRating = $skillRating) and
    not(/character/skills/mode[@rating=$modeRating+1]/skill[@name=$skillName]) and
    not(/character/skills/mode[@rating=$modeRating+2]/skill[@name=$skillName])
  ">
   <xsl:element name="li">
    <xsl:call-template name="add-skill-focusing">
     <xsl:with-param name="skillName"   select="$skillName"/>
     <xsl:with-param name="skillRating" select="$skillRating"/>
     <xsl:with-param name="modeRating"  select="$modeRating"/>
    </xsl:call-template>
    <xsl:value-of select="$skillName"/>
   </xsl:element>
  </xsl:if>
 </xsl:template>

</xsl:stylesheet>
