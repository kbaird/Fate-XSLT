<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="condition-boxes.xsl"/>

  <xsl:template match="conditions">
    <table id="conditions">
      <tr>
        <th colspan="1" class="sectionheader">Conditions</th>
      </tr>
      <xsl:apply-templates select="condition"/>
    </table>
  </xsl:template>

  <xsl:template match="condition">
    <tr>
      <td style="text-align: left">
        <dl class="conditions">
          <dt><xsl:value-of select="@name"/> (<xsl:value-of select="@duration"/>, pg<xsl:value-of select="@ref"/>)</dt>
            <xsl:call-template name="condition-boxes">
              <xsl:with-param name="current">1</xsl:with-param>
              <xsl:with-param name="max">
                <xsl:value-of select="@boxes"/>
              </xsl:with-param>
            </xsl:call-template>
        </dl>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
