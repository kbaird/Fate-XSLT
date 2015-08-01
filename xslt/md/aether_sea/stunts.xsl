<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="./stunt.xsl"/>
  <xsl:template match="stunts">
<xsl:text>
### Stunts

</xsl:text><xsl:apply-templates select="stunt"/>
  </xsl:template>
</xsl:stylesheet>
