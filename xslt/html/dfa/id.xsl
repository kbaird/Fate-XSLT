<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../fate-common/id.xsl"/>
  <xsl:template match="id" mode="fae">
    <xsl:call-template name="id-frame"/>
  </xsl:template>
  <xsl:template name="id-extra">
    <tr>
      <td>
        <xsl:if test="description">
          <fieldset id="description">
            <legend class="label"><span>Description</span></legend>
            <xsl:value-of select="description"/>
          </fieldset>
        </xsl:if>
      </td>
    </tr>
    <xsl:apply-templates select="../mantles"/>
  </xsl:template>
  <xsl:template match="mantles">
    <xsl:apply-templates select="mantle"/>
  </xsl:template>
  <xsl:template match="mantle">
    <tr>
      <td>
        <fieldset id="affiliation">
          <legend class="label"><span>Mantle</span></legend>
          <xsl:value-of select="@name"/>
          <xsl:text> (pg</xsl:text>
          <xsl:value-of select="@ref"/>
          <xsl:text>)</xsl:text>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>