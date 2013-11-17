<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="consequences">
  <table border="1">
   <tr>
    <th colspan="2" class="sectionheader">Consequences</th>
   </tr>
   <tr>
    <td>
     <xsl:call-template name="consequence">
      <xsl:with-param name="label">Mild (2):</xsl:with-param>
      <xsl:with-param name="severity">mild</xsl:with-param>
     </xsl:call-template>
     <xsl:call-template name="consequence">
      <xsl:with-param name="label">Moderate (4):</xsl:with-param>
      <xsl:with-param name="severity">moderate</xsl:with-param>
     </xsl:call-template>
     <xsl:call-template name="consequence">
      <xsl:with-param name="label">Severe (6):</xsl:with-param>
      <xsl:with-param name="severity">severe</xsl:with-param>
     </xsl:call-template>
    </td>
   </tr>
  </table>
 </xsl:template>
 <xsl:template name="consequence">
  <xsl:param name="label"/>
  <xsl:param name="severity"/>
  <fieldset class="consequence">
   <legend class="severity">
    <span>
     <xsl:value-of select="$label"/>
    </span>
   </legend>
   <xsl:for-each select="/fae/consequences/consequence[@severity=$severity]">
    <xsl:value-of select="."/>
   </xsl:for-each>
  </fieldset>
 </xsl:template>
</xsl:stylesheet>
