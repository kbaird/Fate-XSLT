<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="./component.xsl"/>
  <xsl:template match="components">
<xsl:text>
**Components**

</xsl:text><xsl:apply-templates select="component"/>
  </xsl:template>
</xsl:stylesheet>
