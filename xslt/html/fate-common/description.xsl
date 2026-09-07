<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="description">
    <fieldset id="description">
      <legend class="label"><span>Description</span></legend>
      <xsl:value-of select="description"/>
    </fieldset>
  </xsl:template>
</xsl:stylesheet>
