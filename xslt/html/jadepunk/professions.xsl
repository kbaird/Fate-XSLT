<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="professions">
    <table id="professions">
      <tr>
        <th class="sectionheader" colspan="2">Professions</th>
      </tr>
      <tr>
        <td><xsl:apply-templates select="profession"/></td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template match="profession">
    <dl class="approaches">
      <dt><xsl:value-of select="@name"/><xsl:apply-templates select="." mode="explanation"/></dt>
      <dd>+<xsl:value-of select="@rating"/></dd>
    </dl>
  </xsl:template>
  <xsl:template match="profession" mode="explanation">
    <br />
    <span class="explanation">
      <xsl:choose>
        <xsl:when test="@name = 'Aristocrat'">
          <xsl:text>Influences and socializes</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'Engineer'">
          <xsl:text>Builds and sabotages</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'Explorer'">
          <xsl:text>Evades and navigates</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'Fighter'">
          <xsl:text>Attacks and manuevers</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'Scholar'">
          <xsl:text>Thinks and discovers</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'Scoundrel'">
          <xsl:text>Sneaks and deceives</xsl:text>
        </xsl:when>
      </xsl:choose>
    </span>
  </xsl:template>
</xsl:stylesheet>
