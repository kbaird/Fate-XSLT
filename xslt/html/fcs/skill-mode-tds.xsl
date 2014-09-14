<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skill-mode-tds">
  <xsl:param name="modeRating"/>
  <xsl:param name="skillRating"/>
  <xsl:element name="ul">
   <xsl:for-each select="/character/skills/mode[@rating=$modeRating]/skill">
    <xsl:call-template name="skill-mode-td">
     <xsl:with-param name="modeRating"  select="$modeRating"/>
     <xsl:with-param name="skillRating" select="$skillRating"/>
     <xsl:with-param name="skillName"   select="@name"/>
    </xsl:call-template>
   </xsl:for-each>
  </xsl:element>
 </xsl:template>

</xsl:stylesheet>
