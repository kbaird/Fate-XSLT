<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../fate-common/id.xsl"/>
  <xsl:template match="id">
    <xsl:call-template name="id-frame">
      <xsl:with-param name="name-colspan" select="2"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="id-extra">
    <tr>
      <td colspan="2">
        <fieldset id="description">
          <legend class="label">
            <span>Story</span>
          </legend>
          <xsl:value-of select="story"/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>