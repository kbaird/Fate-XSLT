<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="stunts" mode="aether-sea">
    <table>
      <xsl:call-template name="stunts-header">
        <xsl:with-param name="label">Stunts</xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="magic/dabbles-in"/>
      <xsl:apply-templates select="magic/focuses-on"/>
      <xsl:apply-templates select="magic/permanent-magic"/>
      <xsl:apply-templates select="stunt"/>
    </table>
  </xsl:template>
  <xsl:template match="dabbles-in">
    <tr>
      <td>
        <fieldset class="stunt">
          <legend><span>Dabbles in</span></legend>
          <xsl:value-of select="."/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="focuses-on">
    <tr>
      <td>
        <fieldset class="stunt">
          <legend><span>Focuses within <cite><xsl:value-of select="@within"/></cite> on</span></legend>
          <xsl:value-of select="."/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="permanent-magic">
    <tr>
      <td>
        <fieldset class="stunt">
          <legend><span><xsl:value-of select="@name"/> [2]</span></legend>
          <xsl:value-of select="."/>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
