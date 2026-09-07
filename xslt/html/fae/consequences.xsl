<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/consequences.xsl"/>
  <xsl:template name="consequence">
    <xsl:param name="label"/>
    <xsl:param name="severity"/>
    <fieldset class="consequence">
      <legend class="severity">
        <span><xsl:value-of select="$label"/></span>
        <xsl:text>F☐</xsl:text>
        <xsl:if test="$severity != 'Mild'">
          <xsl:text> / R?☐</xsl:text>
        </xsl:if>
      </legend>
      <xsl:for-each select="/character/consequences/consequence[@severity=$severity]">
        <xsl:value-of select="."/>
      </xsl:for-each>
    </fieldset>
  </xsl:template>
</xsl:stylesheet>