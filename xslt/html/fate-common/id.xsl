<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="id">
    <xsl:call-template name="id-frame"/>
  </xsl:template>
  <!--
    id-frame renders the ID table skeleton (section header, name, id-extra).
    Game stylesheets import this module and re-declare the id-extra template
    (or the id match) with their own extra content; import precedence makes
    the importing game's same-named template win over this module's defaults.
    Do not override id-frame: call it from a game-local id match and pass the
    section-header / name-colspan parameters instead.
  -->
  <xsl:template name="id-frame">
    <xsl:param name="section-header" select="'ID'"/>
    <xsl:param name="name-colspan" select="1"/>
    <table>
      <xsl:if test="string-length($section-header) > 0">
        <tr>
          <th colspan="2" class="sectionheader"><xsl:value-of select="$section-header"/></th>
        </tr>
      </xsl:if>
      <tr>
        <td>
          <xsl:if test="$name-colspan = 2">
            <xsl:attribute name="colspan">2</xsl:attribute>
          </xsl:if>
          <xsl:call-template name="name"/>
        </td>
      </tr>
      <xsl:call-template name="id-extra"/>
    </table>
  </xsl:template>
  <xsl:template name="id-extra">
    <tr>
      <td>
        <xsl:if test="description">
          <fieldset id="description">
            <legend class="label"><span>Description</span></legend>
            <xsl:value-of select="description"/>
          </fieldset>
        </xsl:if>
        <xsl:if test="arc">
          <fieldset id="arc">
            <legend class="label">
              <span>Arc: <xsl:value-of select="arc/@name"/></span>
            </legend>
            <xsl:value-of select="arc"/>
          </fieldset>
        </xsl:if>
        <xsl:if test="unique">
          <fieldset id="unique">
            <legend class="label"><span>One Unique Thing</span></legend>
            <xsl:value-of select="unique"/>
          </fieldset>
        </xsl:if>
        <xsl:apply-templates select="homeworld"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
