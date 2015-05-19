<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:math="http://exslt.org/math" extension-element-prefixes="math">
  <xsl:output method="html"/>
  <xsl:template match="feature">
    <dt class="feature"><xsl:value-of select="@type"/>:</dt>
    <dd><xsl:choose>
      <xsl:when test="@effect">
        <xsl:value-of select="@effect"/>
      </xsl:when>
      <xsl:when test="@type='Focus'">
        <xsl:value-of select="@profession"/>
        <xsl:text> +</xsl:text>
        <xsl:value-of select="@bonus"/>
      </xsl:when>
      <xsl:when test="@type='Harmful' or @type='Protective'">
        <xsl:value-of select="@bonus"/>
      </xsl:when>
      <xsl:when test="@type='Independent'">
        <xsl:text>Can act independently w/o the expenditure of a Fate Point</xsl:text>
      </xsl:when>
      <xsl:when test="@type='Numerous'">
        <xsl:value-of select="math:power(2, @bonus)"/>
      </xsl:when>
      <xsl:when test="@type='Professional'">
        <xsl:value-of select="@main-profession"/>
        <xsl:text> +</xsl:text>
        <xsl:value-of select="@bonus"/>
        <xsl:if test="@bonus &gt; 1">
          <xsl:text>; </xsl:text>
          <xsl:value-of select="@other-professions"/>
          <xsl:text> +1</xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:when test="@type='Resilient'">
        <xsl:text>Mild Consequence: ☐ 
          &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
          &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
        </xsl:text>
      </xsl:when>
      <xsl:when test="@type='Sturdy'">
        <xsl:choose>
          <xsl:when test="../../@type='Ally'">
            <xsl:value-of select="@bonus"/>
            <xsl:text> Stress Box</xsl:text>
            <xsl:if test="@bonus &gt; 1">
              <xsl:text>es</xsl:text>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@bonus"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose></dd>
  </xsl:template>
</xsl:stylesheet>
