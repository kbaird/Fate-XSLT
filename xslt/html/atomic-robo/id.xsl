<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="id" mode="atomic-robo">
    <table>
      <tr>
        <td><xsl:call-template name="name"/></td>
      </tr>
      <tr>
        <td><xsl:if test="affiliation">
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
        </xsl:if></td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
