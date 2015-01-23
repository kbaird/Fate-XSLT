<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="species">
    <fieldset id="species">
      <legend class="label"><span>Species</span></legend>
      <xsl:value-of select="species"/>
    </fieldset>
  </xsl:template>
</xsl:stylesheet>
