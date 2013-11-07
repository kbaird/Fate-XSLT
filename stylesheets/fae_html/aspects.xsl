<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="aspects">
<table border="1">
<tr><th colspan="2" class="sectionheader">Aspects</th></tr>
<xsl:apply-templates select="aspect"/>
</table>
</xsl:template>

<xsl:template match="aspect">
<tr>
<td>
<xsl:if test="@type = 'high_concept'">
<strong>High Concept</strong>:
</xsl:if>
<xsl:if test="@type = 'trouble'">
<strong>Trouble</strong>:
</xsl:if>
<xsl:value-of select="."/>
</td>
</tr>
</xsl:template>

</xsl:stylesheet>
