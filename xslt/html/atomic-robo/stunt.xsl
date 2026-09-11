<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="stunt">
    <tr>
      <td>
        <fieldset class="stunt">
          <xsl:if test="@mega='true'">
            <xsl:attribute name="class">mega stunt</xsl:attribute>
          </xsl:if>
          <xsl:if test="string-length(@notes) &lt; 1">
            <xsl:call-template name="dynamic-padding">
              <xsl:with-param name="name" select="@name"/>
              <xsl:with-param name="threshold" select="8"/>
              <xsl:with-param name="base" select="8"/>
              <xsl:with-param name="scale" select="8"/>
            </xsl:call-template>
          </xsl:if>
          <legend><span><xsl:value-of select="@name"/></span></legend>
          <xsl:value-of select="."/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
