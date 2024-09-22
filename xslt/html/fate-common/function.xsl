<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="function">
    <!-- TODO: DRY up with gadget mode aspects -->
    <dt class="function">
      <xsl:choose>
        <xsl:when test="@name">
          <xsl:value-of select="@name"/>
        </xsl:when>
        <xsl:when test="../@override-name">
          <xsl:value-of select="../@override-name"/>
        </xsl:when>
        <xsl:otherwise>
          Function Aspect:
        </xsl:otherwise>
      </xsl:choose>
    </dt>
    <dd><xsl:value-of select="."/></dd>
  </xsl:template>
</xsl:stylesheet>
