<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="extras">
  <table>
   <tr>
    <th colspan="1" class="sectionheader">Extras</th>
   </tr>
   <xsl:apply-templates select="extra"/>
  </table>
 </xsl:template>
 <xsl:template match="extra">
  <tr>
   <td>
    <fieldset>
      <legend><xsl:value-of select="@name"/></legend>
     <xsl:value-of select="."/>
    </fieldset>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>
