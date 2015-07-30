<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <!--
  <xsl:include href="./approaches.xsl"/>
  <xsl:include href="./stunts.xsl"/>
  -->
  <xsl:template match="ship">
    <xsl:text>
---
title:
- type: main
  text: </xsl:text>
<xsl:value-of select="id/name"/><xsl:text>
creator:
- role: author
  text: Kevin C. Baird
...

## </xsl:text><xsl:value-of select="id/name"/><xsl:text>

</xsl:text><xsl:value-of select="id/description"/><xsl:text>

**Size**
: </xsl:text><xsl:value-of select="@size"/><xsl:text>

**Aspects**

</xsl:text><xsl:apply-templates select="aspects/aspect"/><xsl:text>
**Skilled At**
: _</xsl:text><xsl:value-of select="skilled-at"/><xsl:text>_

**Bad At**
: _</xsl:text><xsl:value-of select="bad-at"/><xsl:text>_

**Components**
</xsl:text><xsl:apply-templates select="components/component"/><xsl:text>
**Refresh**
: 3
    </xsl:text>
  </xsl:template>

  <xsl:template match="aspect">
    <xsl:text>- _</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>_
</xsl:text>
  </xsl:template>

  <xsl:template match="component">
    <xsl:text>- </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text> (</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>)
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
