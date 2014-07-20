<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="professions">
  <table border="1" id="skills">
   <tr>
    <th class="sectionheader" colspan="2">Professions</th>
   </tr>
   <tr>
    <td>
     <xsl:apply-templates select="profession"/>
    </td>
   </tr>
  </table>
 </xsl:template>
 <xsl:template match="profession">
  <dl class="approaches">
   <dt>
    <xsl:value-of select="@name"/>
   </dt>
   <dd>
    <xsl:value-of select="@rating"/>
   </dd>
  </dl>
 </xsl:template>
</xsl:stylesheet>
