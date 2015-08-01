<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="./approach.xsl"/>
  <xsl:template match="approaches">
<xsl:text>
### Approaches

</xsl:text>
    <xsl:apply-templates select="approach"/>
  </xsl:template>
</xsl:stylesheet>
