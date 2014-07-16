<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template match="experiences">
  <div id="experiences">
   <span class="sectionheader">Experiences</span>
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

 <xsl:template name="experiences_explanation">
  <p id="experiences_explanation">
   Experiences are Boosts. After invoking an Experience, draw a line through it, but leave it on your character sheet.
   When you erase 3 crossed-out Experiences, you reach a <strong>Major Milestone</strong> (ARRPG227).
  </p>
 </xsl:template>

</xsl:stylesheet>
