<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="flaw">
    <dt id="flaw">Flaw Aspect:</dt>
    <dd><xsl:value-of select="."/></dd>
  </xsl:template>
</xsl:stylesheet>
