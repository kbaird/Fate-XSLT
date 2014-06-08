<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="experiences">
  <div id="experiences">
   <xsl:apply-templates select="experience"/>
  </div>
 </xsl:template>
 <xsl:template match="experience">
  <fieldset class="experience">
   <xsl:if test="@used='true'">
    <xsl:attribute name="class">used experience</xsl:attribute>
   </xsl:if>
   <legend class="label">
    <span>Experience</span>
   </legend>
   <xsl:value-of select="."/>
  </fieldset>
 </xsl:template>
</xsl:stylesheet>
