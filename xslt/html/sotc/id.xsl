<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../fate-common/id.xsl"/>
  <xsl:output method="html"/>
  <xsl:template match="id">
    <xsl:call-template name="id-frame"/>
  </xsl:template>
  <xsl:template name="id-extra">
    <tr>
      <td>
        <fieldset id="concept">
          <legend class="label">
            <span>Concept</span>
          </legend>
          <xsl:value-of select="concept"/>
        </fieldset>
      </td>
    </tr>
    <tr>
      <td>
        <fieldset id="archetype">
          <legend class="label">
            <span>Archetype</span>
          </legend>
          <xsl:value-of select="archetype"/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>