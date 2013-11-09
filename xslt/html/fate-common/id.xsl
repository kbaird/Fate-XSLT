<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="id">

<table border="1">
<tr>
<th colspan="2" class="sectionheader">ID</th>
</tr>
<tr>
<th>Name:</th>
<td><xsl:value-of select="charname"/></td>
</tr>
<xsl:if test="charname/@nickname">
<tr>
<th>Nickname:</th>
<td><q><xsl:value-of select="charname/@nickname"/></q></td>
</tr>
</xsl:if>
<tr>
<th>Description:</th>
<td><xsl:value-of select="description"/></td>
</tr>
</table>

</xsl:template>

</xsl:stylesheet>
