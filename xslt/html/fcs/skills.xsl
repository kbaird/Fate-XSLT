<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<!--
     TODO: Pyramid presentation or similar
-->
<xsl:template match="skills">
<table border="1">
<tr><th colspan="2" class="sectionheader">Skills</th></tr>
<xsl:apply-templates name="skill"/>
</table>
</xsl:template>

<xsl:template match="skill">
<tr>
  <th><xsl:value-of select="@name"/></th>
  <td><xsl:value-of select="."/></td>
</tr>
</xsl:template>

</xsl:stylesheet>
