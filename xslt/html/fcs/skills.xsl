<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="skills">
<table id="skills">
<tr><th colspan="6" class="sectionheader">Skills</th></tr>
  <xsl:call-template name="skill">
    <xsl:with-param name="numericRating">5</xsl:with-param>
    <xsl:with-param name="textRating">Superb</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="skill">
    <xsl:with-param name="numericRating">4</xsl:with-param>
    <xsl:with-param name="textRating">Great</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="skill">
    <xsl:with-param name="numericRating">3</xsl:with-param>
    <xsl:with-param name="textRating">Good</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="skill">
    <xsl:with-param name="numericRating">2</xsl:with-param>
    <xsl:with-param name="textRating">Fair</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="skill">
    <xsl:with-param name="numericRating">1</xsl:with-param>
    <xsl:with-param name="textRating">Average</xsl:with-param>
  </xsl:call-template>
</table>
</xsl:template>

<xsl:template name="skill">
  <xsl:param name="numericRating"/>
  <xsl:param name="textRating"/>

<!--
     FIXME: these 2 xsl:if blocks are a hack. Clean them up.
-->
<xsl:if test="/diaspora/skills/skill[@rating=$numericRating]">
<tr>
  <th class="rating"><xsl:value-of select="$textRating"/> (+<xsl:value-of select="$numericRating"/>)</th>
<xsl:for-each select="/diaspora/skills/skill[@rating=$numericRating]">
  <td><xsl:value-of select="@name"/></td>
</xsl:for-each>
</tr>
</xsl:if>

<xsl:if test="/fcs/skills/skill[@rating=$numericRating]">
<tr>
  <th class="rating"><xsl:value-of select="$textRating"/> (+<xsl:value-of select="$numericRating"/>)</th>
<xsl:for-each select="/fcs/skills/skill[@rating=$numericRating]">
  <td><xsl:value-of select="@name"/></td>
</xsl:for-each>
</tr>
</xsl:if>

</xsl:template>

</xsl:stylesheet>
