<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="id">
    <table>
      <tr>
        <th colspan="2" class="sectionheader">ID</th>
      </tr>
      <tr>
        <td><xsl:call-template name="name"/></td>
      </tr>
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
    </table>
  </xsl:template>
</xsl:stylesheet>
