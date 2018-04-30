<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="pad-stunt.xsl"/>
  <xsl:template match="stunts">
    <table>
      <xsl:call-template name="stunts-header">
        <xsl:with-param name="label">Stunts</xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="stunt"/>
    </table>
  </xsl:template>
  <xsl:template match="stunt">
    <tr>
      <td>
        <fieldset class="stunt">
          <dl>
            <dt><xsl:value-of select="@name"/></dt>
            <dd><xsl:value-of select="."/></dd>
          </dl>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="stunts-header">
    <xsl:param name="label"/>
    <tr>
      <th colspan="2" class="sectionheader">
        <xsl:value-of select="$label"/>
      </th>
    </tr>
  </xsl:template>
</xsl:stylesheet>
