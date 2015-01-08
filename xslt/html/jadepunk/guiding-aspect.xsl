<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="guiding-aspect">
    <xsl:param name="type"/>
    <xsl:for-each select="/character/aspects/aspect[@type=$type]">
      <dt>Guiding Aspect:</dt>
      <dd>
        <xsl:value-of select="."/>
      </dd>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
