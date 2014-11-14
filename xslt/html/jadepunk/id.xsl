<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="id">
    <table>
      <tr>
        <th colspan="2" class="sectionheader">ID</th>
      </tr>
      <tr>
        <td colspan="2">
          <xsl:call-template name="name"/>
        </td>
      </tr>
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
      <tr>
        <xsl:call-template name="refresh"/>
        <xsl:call-template name="current-fate-points"/>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
