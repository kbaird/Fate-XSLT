<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="./aspects.xsl"/>
  <xsl:include href="./component.xsl"/>
  <xsl:include href="./stunt.xsl"/>
  <xsl:template match="ship">
    <xsl:text>---
title:
- type: main
  text: </xsl:text>
<xsl:value-of select="id/name"/><xsl:text>
creator:
- role: author
  text: Kevin C. Baird
...

## </xsl:text><xsl:value-of select="id/name"/><xsl:text>

</xsl:text><xsl:value-of select="id/description"/>
<xsl:text>

**Size**
: </xsl:text><xsl:value-of select="@size"/><xsl:text>
</xsl:text><xsl:apply-templates select="aspects"/><xsl:text>
**Skilled At**
: _</xsl:text><xsl:value-of select="skilled-at"/><xsl:text>_

**Bad At**
: _</xsl:text><xsl:value-of select="bad-at"/><xsl:text>_

**Components**

</xsl:text><xsl:apply-templates select="components/component"/><xsl:text>
**Refresh**
: 3

**Resources Stress**
: [1] [2] [3] [4]

### Stunts

</xsl:text><xsl:apply-templates select="stunts/stunt"/><xsl:text>
Starts with 2 Stations, pg 27

Consequences, pg 29

</xsl:text>
  </xsl:template>
</xsl:stylesheet>
