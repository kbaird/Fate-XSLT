<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="gadgets">
  <table border="1">
   <tr>
    <th colspan="2" class="sectionheader">Gadgets</th>
   </tr>
   <xsl:apply-templates select="gadget"/>
  </table>
 </xsl:template>
 <xsl:template match="gadget">
  <tr>
   <td>
    <fieldset class="gadget">
     <legend class="label">
      <xsl:value-of select="@name"/>
      (pg<xsl:value-of select="@page"/>)
     </legend>
      <xsl:value-of select="."/>
    </fieldset>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>
