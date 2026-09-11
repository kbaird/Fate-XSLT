<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="signature-aspect">
    <xsl:for-each select="/character/aspects/aspect">
      <xsl:if test="@signature='true'">
        <tr>
          <td>
            <fieldset class="stunt" style="padding-left: 18.5em"><legend><span>Signature Aspect: <xsl:value-of select="."/> ☐</span></legend>
       Invoke once for free, compel at two fate points instead of one
      </fieldset>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
