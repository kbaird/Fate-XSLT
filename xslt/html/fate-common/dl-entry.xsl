<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="dl-entry">
    <xsl:param name="label"/>
    <xsl:param name="value"/>
    <dt class="function">
      <xsl:value-of select="$label"/>
    </dt>
    <dd><xsl:value-of select="$value"/></dd>
  </xsl:template>

</xsl:stylesheet>
