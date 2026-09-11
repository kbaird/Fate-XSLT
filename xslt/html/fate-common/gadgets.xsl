<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
            <xsl:if test="string-length(@notes) &lt; 1">
              <xsl:call-template name="dynamic-padding">
                <xsl:with-param name="name" select="@name"/>
                <xsl:with-param name="threshold" select="8"/>
                <xsl:with-param name="base" select="8"/>
                <xsl:with-param name="scale" select="8"/>
              </xsl:call-template>
            </xsl:if>
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

