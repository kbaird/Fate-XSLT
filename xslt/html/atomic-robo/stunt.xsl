<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="stunt">
    <tr>
      <td>
        <fieldset class="stunt">
          <legend><span><xsl:value-of select="@name"/></span></legend>
          <xsl:value-of select="."/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
