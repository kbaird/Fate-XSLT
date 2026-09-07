<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../fate-common/id.xsl"/>
  <xsl:output method="html"/>
  <xsl:template match="id">
    <xsl:call-template name="id-frame"/>
  </xsl:template>
  <xsl:template name="id-extra">
    <tr>
      <td>
        <fieldset id="homeworld">
          <legend class="label">
            <span>Homeworld</span>
          </legend>
          <xsl:value-of select="homeworld"/>
        </fieldset>
      </td>
    </tr>
    <tr>
      <td>
        <fieldset id="cluster">
          <legend class="label">
            <span>Cluster</span>
          </legend>
          <xsl:value-of select="cluster"/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>