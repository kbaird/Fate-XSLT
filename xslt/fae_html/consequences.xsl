<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template name="consequences">
<table border="1">
<tr><th colspan="2" class="sectionheader">Consequences</th></tr>
<xsl:call-template name="consequence"/>
</table>
</xsl:template>

<xsl:template name="consequence">
<tr>
  <td class="severity">Mild (2):</td>
  <td class="consequence">
    <xsl:for-each select="/fae/consequences/consequence[@severity='mild']">
      <xsl:value-of select="."/>
    </xsl:for-each>
  </td>
</tr>
<tr>
  <td class="severity">Moderate (4):</td>
  <td class="consequence">
    <xsl:for-each select="/fae/consequences/consequence[@severity='moderate']">
      <xsl:value-of select="."/>
    </xsl:for-each>
  </td>
</tr>
<tr>
  <td class="severity">Severe (6):</td>
  <td class="consequence">
    <xsl:for-each select="/fae/consequences/consequence[@severity='severe']">
      <xsl:value-of select="."/>
    </xsl:for-each>
  </td>
</tr>
</xsl:template>

</xsl:stylesheet>
