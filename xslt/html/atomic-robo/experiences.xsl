<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template match="experiences">
  <table border="1" id="experiences">
   <tr>
    <th colspan="2" class="sectionheader">Experiences</th>
   </tr>
   <xsl:apply-templates select="experience"/>
  </table>
 </xsl:template>

 <xsl:template match="experience">
  <tr>
   <td>
    <fieldset class="experience">
     <xsl:if test="@used='true'">
      <xsl:attribute name="class">experience used</xsl:attribute>
     </xsl:if>
     <legend class="label">
      <span>Experience</span>
     </legend>
     <xsl:value-of select="."/>
    </fieldset>
   </td>
  </tr>
 </xsl:template>

 <xsl:template name="experiences-explanation">
  <p id="experiences-explanation">
   Experiences are Boosts. After invoking an Experience, draw a line through it, but leave it on your character sheet.
   When you erase 3 crossed-out Experiences, you reach a <strong>Major Milestone</strong> (ARRPG227).
  </p>
 </xsl:template>

</xsl:stylesheet>
