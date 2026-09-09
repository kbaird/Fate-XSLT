<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="benefit.xsl"/>
  <xsl:include href="dl-entry.xsl"/>
  <xsl:include href="function.xsl"/>
  <xsl:include href="flaw.xsl"/>
  <xsl:template match="aspect" mode="gadget">
    <xsl:variable name="label">
      <xsl:choose>
        <xsl:when test="../../@override-name">
          <xsl:value-of select="../../@override-name"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>Aspect:</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="dl-entry">
      <xsl:with-param name="label" select="$label"/>
      <xsl:with-param name="value" select="."/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="gadget">
    <tr>
      <td>
        <fieldset class="mega stunt">
          <legend>
            <span><xsl:value-of select="@name"/></span>
            <p><xsl:value-of select="@notes"/></p>
          </legend>
          <dl class="gadget">
            <xsl:call-template name="pad-stunt">
              <xsl:with-param name="name">
                <xsl:value-of select="@name"/>
              </xsl:with-param>
            </xsl:call-template>
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

