<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="aspect-label">
    <xsl:param name="modeName"/>
    <xsl:param name="type"/>
    <xsl:choose>
      <xsl:when test="$type = 'High-Concept'">
        <legend class="label">
          <span>High Concept</span>
        </legend>
      </xsl:when>
      <xsl:when test="$type = 'Inciting-Incident'">
        <legend class="label">
          <span>Inciting Incident</span>
        </legend>
        </xsl:when>
        <xsl:when test="$type = 'Mode'">
          <legend class="label">
            <span><xsl:value-of select="$modeName"/> Mode</span>
          </legend>
      </xsl:when>
      <xsl:when test="$type = 'Relationship'">
        <legend class="label">
          <span>Relationship</span>
        </legend>
      </xsl:when>
      <xsl:otherwise>
        <legend class="label">
          <span><xsl:value-of select="$type"/></span>
        </legend>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
