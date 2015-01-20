<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="approaches" mode="aether-sea">
    <table id="approaches">
      <tr><th class="sectionheader" colspan="2">Approaches</th></tr>
      <tr>
        <td>
          <xsl:apply-templates select="approach" mode="aether-sea"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template match="approach" mode="aether-sea">
    <dl class="approaches">
      <!-- FIXME: variable based on species -->
      <xsl:if test="@name='Clever'">
        <xsl:attribute name="class">approaches favored</xsl:attribute>
      </xsl:if>
      <dt><xsl:value-of select="@name"/></dt>
      <dd>
        <xsl:text>+</xsl:text>
        <xsl:value-of select="@rating"/>
      </dd>
    </dl>
  </xsl:template>
</xsl:stylesheet>
