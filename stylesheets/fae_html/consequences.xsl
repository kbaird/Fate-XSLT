<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<!--
     TODO: show empty boxes even when no consequence elements in XML
-->
<xsl:template match="consequences">
<table border="1">
<tr><th colspan="2" class="sectionheader">Consequences</th></tr>
<xsl:apply-templates select="consequence"/>
</table>
</xsl:template>

<xsl:template match="consequence">
<tr>
<td>
<xsl:if test="@severity = 'mild'">
<strong>Mild (2)</strong>:
</xsl:if>
<xsl:if test="@severity = 'moderate'">
<strong>Moderate (4)</strong>:
</xsl:if>
<xsl:if test="@severity = 'severe'">
<strong>Severe (6)</strong>:
</xsl:if>
<xsl:value-of select="."/>
</td>
</tr>
</xsl:template>

</xsl:stylesheet>
