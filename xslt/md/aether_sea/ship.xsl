<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:include href="./addenda.xsl"/>
  <xsl:include href="./aspects.xsl"/>
  <xsl:include href="./components.xsl"/>
  <xsl:include href="./refresh.xsl"/>
  <xsl:include href="./stress.xsl"/>
  <xsl:include href="./stunts.xsl"/>
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

## </xsl:text><xsl:value-of select="id/name"/>
<xsl:text>

</xsl:text><xsl:value-of select="id/description"/>
<xsl:text>

**Size**
: </xsl:text><xsl:value-of select="@size"/><xsl:text>
</xsl:text><xsl:apply-templates select="aspects"/><xsl:text>
**Skilled At**
: _</xsl:text><xsl:value-of select="skilled-at"/><xsl:text>_

**Bad At**
: _</xsl:text><xsl:value-of select="bad-at"/><xsl:text>_
</xsl:text>
<xsl:apply-templates select="components"/>
<xsl:call-template name="refresh"/>
<xsl:call-template name="stress"/>
<xsl:apply-templates select="stunts"/>
<xsl:call-template name="addenda"/>
  </xsl:template>
</xsl:stylesheet>
