<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="approaches">
<table border="1">
<tr>
<th class="sectionheader" colspan="2">Approaches</th>
</tr>
<xsl:apply-templates select="approach"/>
</table>
</xsl:template>

<xsl:template match="approach">
<tr>
<td class="approach_name"><xsl:value-of select="@name"/></td>
<td><xsl:value-of select="."/></td>
</tr>
</xsl:template>

</xsl:stylesheet>
