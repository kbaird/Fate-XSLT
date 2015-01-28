<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="approaches">
    <table id="approaches">
      <tr>
        <th class="sectionheader" colspan="2">Approaches</th>
      </tr>
      <tr>
        <td><xsl:apply-templates select="approach"/></td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template match="approach">
    <dl class="approaches">
      <dt><xsl:value-of select="@name"/></dt>
      <dd>
        <xsl:text>+</xsl:text>
        <xsl:value-of select="@rating"/>
      </dd>
    </dl>
  </xsl:template>
</xsl:stylesheet>
