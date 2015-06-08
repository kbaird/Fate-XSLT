<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="condition">
    <xsl:param name="label"/>
    <xsl:param name="severity"/>
    <dt>
      <xsl:if test="$severity=4">
        <xsl:attribute name="class">severe</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="$label"/>
    </dt>
    <dd class="box">
      <xsl:value-of select="$severity"/>
    </dd>
    <xsl:if test="$severity=4">
      <dd class="box additional">
        <xsl:value-of select="$severity"/>
      </dd>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
