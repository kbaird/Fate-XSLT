<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="homeworld">
    <fieldset id="homeworld">
      <legend class="label">
        <span>Homeworld</span>
      </legend>
      Name: <xsl:value-of select="@name"/>
      <xsl:if test="@ref"> (<xsl:value-of select="@ref"/>)</xsl:if>, 
      Habituated Gravity: 
      <xsl:value-of select="@habituated-gravity"/>, 
      Tech Index: 
      <xsl:value-of select="@tech-index"/>
    </fieldset>
  </xsl:template>
</xsl:stylesheet>
