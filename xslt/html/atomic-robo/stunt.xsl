<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/pad-stunt.xsl"/>
  <xsl:template match="stunt">
    <tr>
      <td>
        <fieldset class="stunt">
          <xsl:if test="@mega='true'">
            <xsl:attribute name="class">mega stunt</xsl:attribute>
          </xsl:if>
          <xsl:call-template name="pad-stunt">
            <xsl:with-param name="name">
              <xsl:value-of select="@name"/>
            </xsl:with-param>
          </xsl:call-template>
          <legend><span><xsl:value-of select="@name"/></span></legend>
          <xsl:value-of select="."/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
