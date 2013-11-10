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
  <td>
    <fieldset class="consequence">
      <legend class="severity">Mild (2):</legend>
        <xsl:for-each select="/fcs/consequences/consequence[@severity='mild']">
          <xsl:value-of select="."/>
        </xsl:for-each>
    </fieldset>
    <fieldset class="consequence">
      <legend class="severity">Moderate (4):</legend>
        <xsl:for-each select="/fcs/consequences/consequence[@severity='moderate']">
          <xsl:value-of select="."/>
        </xsl:for-each>
    </fieldset>
    <fieldset class="consequence">
      <legend class="severity">Severe (6):</legend>
        <xsl:for-each select="/fcs/consequences/consequence[@severity='severe']">
          <xsl:value-of select="."/>
        </xsl:for-each>
    </fieldset>
<xsl:if test="/fcs/skills/skill[@name='Physique']/@rating &gt; 4">
    <fieldset class="consequence">
      <legend class="severity">Mild Physical (2):</legend>
        <xsl:for-each select="/fcs/consequences/consequence[@severity='mild-physical']">
          <xsl:value-of select="."/>
        </xsl:for-each>
    </fieldset>
</xsl:if>
<xsl:if test="/fcs/skills/skill[@name='Will']/@rating &gt; 4">
    <fieldset class="consequence">
    <legend class="severity">Mild Mental (2):</legend>
        <xsl:for-each select="/fcs/consequences/consequence[@severity='mild-mental']">
          <xsl:value-of select="."/>
        </xsl:for-each>
    </fieldset>
</xsl:if>
  </td>
</tr>
</xsl:template>

</xsl:stylesheet>
