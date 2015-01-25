<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="approaches" mode="aether-sea">
    <table id="approaches">
      <tr><th class="sectionheader" colspan="2">Approaches</th></tr>
      <tr>
        <td><xsl:apply-templates select="approach" mode="aether-sea"/></td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template match="approach" mode="aether-sea">
    <xsl:variable name="favoredApproach">
      <xsl:choose>
        <xsl:when test="/character/id/species='Dwarf'">
          <xsl:text>Careful</xsl:text>
        </xsl:when>
        <xsl:when test="/character/id/species='Elf'">
          <xsl:text>Clever</xsl:text>
        </xsl:when>
        <xsl:when test="/character/id/species='Goblin'">
          <xsl:text>Sneaky</xsl:text>
        </xsl:when>
        <xsl:when test="/character/id/species='Human'">
          <xsl:text>Flashy</xsl:text>
        </xsl:when>
        <xsl:when test="/character/id/species='Orc'">
          <xsl:text>Quick</xsl:text>
        </xsl:when>
        <xsl:when test="/character/id/species='Troll'">
          <xsl:text>Forceful</xsl:text>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <dl class="approaches">
      <xsl:if test="@name = $favoredApproach">
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
