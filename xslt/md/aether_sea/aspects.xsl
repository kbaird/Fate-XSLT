<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="./aspect.xsl"/>
  <xsl:template match="aspects">
<xsl:text>
**Aspects**

</xsl:text><xsl:apply-templates select="aspect"/>
  </xsl:template>
</xsl:stylesheet>
