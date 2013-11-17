<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="aspects">
  <table border="1">
   <tr>
    <th colspan="2" class="sectionheader">Aspects</th>
   </tr>
   <xsl:apply-templates select="aspect"/>
  </table>
 </xsl:template>
 <xsl:template match="aspect">
  <tr>
   <td>
    <fieldset class="aspect">
     <xsl:if test="@type = 'high_concept'">
      <legend>
       <span>High Concept</span>
      </legend>
     </xsl:if>
     <xsl:if test="@type = 'trouble'">
      <legend>
       <span>Trouble</span>
      </legend>
     </xsl:if>
     <xsl:value-of select="."/>
    </fieldset>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>
