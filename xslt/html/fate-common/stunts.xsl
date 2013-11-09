<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="stunts">
<table border="1">
  <tr><th colspan="2" class="sectionheader">Stunts</th></tr>
  <xsl:apply-templates select="stunt"/>
</table>
</xsl:template>

<xsl:template match="stunt">
<tr>
  <th><xsl:value-of select="."/></th>
  <td><xsl:value-of select="@effect"/></td>
</tr>
</xsl:template>

</xsl:stylesheet>
