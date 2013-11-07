<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<!--
     TODO: shows empty boxes even when no consequence elements in XML,
     but doesn't show values stored in XML. Do both.
-->
<xsl:template name="consequences">
<table border="1">
<tr><th colspan="2" class="sectionheader">Consequences</th></tr>
<xsl:call-template name="consequence"/>
</table>
</xsl:template>

<xsl:template name="consequence">
<tr>
  <td class="severity">Mild (2):</td>
  <td class="consequence"><xsl:value-of select="fae/consequences/consequence[severity='mild']"/></td>
</tr>
<tr>
  <td class="severity">Moderate (4):</td>
  <td class="consequence"><xsl:value-of select="fae/consequences/consequence[severity='moderate']"/></td>
</tr>
<tr>
  <td class="severity">Severe (6):</td>
  <td class="consequence"><xsl:value-of select="fae/consequences/consequence[severity='severe']"/></td>
</tr>
</xsl:template>

</xsl:stylesheet>
