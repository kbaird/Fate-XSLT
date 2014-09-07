<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="gear">
  <table>
   <tr>
    <th class="sectionheader">Gear</th>
   </tr>
   <tr>
    <td>
     <xsl:value-of select="."/>
    </td>
   </tr>
  </table>
 </xsl:template>
</xsl:stylesheet>
