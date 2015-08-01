<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:template match="bad-at">
<xsl:text>

**Bad At**
: </xsl:text><xsl:value-of select="."/><xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
