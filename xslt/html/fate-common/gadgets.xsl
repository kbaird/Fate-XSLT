<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="aspect" mode="gadget">
    <dt>
      <xsl:text>Aspect: </xsl:text>
    </dt>
    <dd>
      <xsl:value-of select="."/>
    </dd>
  </xsl:template>
  <xsl:template match="aspects" mode="gadget">
    <xsl:apply-templates select="aspect" mode="gadget"/>
  </xsl:template>
  <xsl:template match="benefit">
    <dt>
      <xsl:value-of select="@name"/>
      <xsl:if test="@cost">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="@cost"/>
        <xsl:text>]</xsl:text>
      </xsl:if>
      <xsl:text>: </xsl:text>
    </dt>
    <dd>
      <xsl:value-of select="."/>
    </dd>
  </xsl:template>
  <xsl:template match="function">
    <dt id="function">Function Aspect:</dt>
    <dd><xsl:value-of select="."/></dd>
  </xsl:template>
  <xsl:template match="flaw">
    <dt id="flaw">Flaw Aspect:</dt>
    <dd><xsl:value-of select="."/></dd>
  </xsl:template>
  <xsl:template match="gadget">
    <tr>
      <td>
        <fieldset class="stunt">
          <legend>
            <span>
              <xsl:value-of select="@name"/>
            </span>
          </legend>
          <dl class="gadget">
            <xsl:apply-templates select="function"/>
            <xsl:apply-templates select="flaws/flaw"/>
            <xsl:apply-templates select="benefits/benefit"/>
            <xsl:apply-templates select="aspects/aspect" mode="gadget"/>
          </dl>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
