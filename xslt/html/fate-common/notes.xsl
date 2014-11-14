<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="notes">
    <pre>
      <xsl:value-of select="."/>
    </pre>
  </xsl:template>
</xsl:stylesheet>
