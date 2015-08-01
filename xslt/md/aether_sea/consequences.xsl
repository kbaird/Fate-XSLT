<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:template match="consequences">
<xsl:text>### Consequences

**Mild**
: </xsl:text><xsl:value-of select="consequence[@severity='Mild']"/><xsl:text>

**Moderate**
: </xsl:text><xsl:value-of select="consequence[@severity='Moderate']"/><xsl:text>

**Severe**
: </xsl:text><xsl:value-of select="consequence[@severity='Severe']"/><xsl:text>

</xsl:text>
  </xsl:template>
</xsl:stylesheet>
