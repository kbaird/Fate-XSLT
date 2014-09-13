<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="id">
  <table>
   <tr>
    <th colspan="2" class="sectionheader">ID</th>
   </tr>
   <tr>
    <td>
     <xsl:call-template name="name"/>
    </td>
   </tr>
   <tr>
    <td>
     <fieldset id="concept">
      <legend class="label">
       <span>Concept</span>
      </legend>
      <xsl:value-of select="concept"/>
     </fieldset>
    </td>
   </tr>
   <tr>
    <td>
     <fieldset id="archetype">
      <legend class="label">
       <span>Archetype</span>
      </legend>
      <xsl:value-of select="archetype"/>
     </fieldset>
    </td>
   </tr>
  </table>
 </xsl:template>
</xsl:stylesheet>
