<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skill-mode-td">
  <xsl:param name="modeRating"/>
  <xsl:param name="skillRating"/>
  <xsl:variable name="addRating">
   <xsl:value-of select="$skillRating - $modeRating"/>
  </xsl:variable>
  <xsl:choose>
   <xsl:when test="$addRating=0">
    <xsl:for-each select="mode[@rating=$modeRating]/skill[not(@add)]">
     <xsl:value-of select="@name"/>
     <xsl:if test="position() != last()">
      <xsl:text>,</xsl:text>
     </xsl:if>
    </xsl:for-each>
   </xsl:when>
   <xsl:otherwise>
    <xsl:for-each select="mode[@rating=$modeRating]/skill[@add=$addRating]">
     <xsl:value-of select="@name"/>
     <xsl:if test="position() != last()">
      <xsl:text>,</xsl:text>
     </xsl:if>
    </xsl:for-each>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template name="skill-mode-tds">
  <xsl:param name="modeRating"/>
  <xsl:param name="skillRating"/>
  <xsl:for-each select="/character/skills">
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
