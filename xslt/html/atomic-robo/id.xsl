<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../fate-common/id.xsl"/>
  <xsl:output method="html"/>
  <xsl:template match="id" mode="atomic-robo">
    <xsl:call-template name="id-frame">
      <xsl:with-param name="section-header" select="''"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="id-extra">
    <tr>
      <td>
        <xsl:if test="affiliation">
          <fieldset id="affiliation">
            <legend class="label"><span>Affiliation</span></legend>
            <xsl:value-of select="affiliation"/>
          </fieldset>
        </xsl:if>
        <xsl:if test="description">
          <fieldset id="description">
            <legend class="label"><span>Description</span></legend>
            <xsl:value-of select="description"/>
          </fieldset>
        </xsl:if>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>