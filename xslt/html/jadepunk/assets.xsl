<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="assets-header.xsl"/>
  <xsl:include href="feature.xsl"/>
  <xsl:include href="flaw.xsl"/>
  <xsl:include href="guiding-aspect.xsl"/>
  <xsl:template match="assets">
    <table>
      <xsl:call-template name="assets-header">
        <xsl:with-param name="label">Assets</xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="asset"/>
    </table>
  </xsl:template>
  <xsl:template match="asset">
    <tr>
      <td>
        <fieldset class="asset">
          <dl>
            <dt>Refresh Cost:</dt>
            <dd>
              <xsl:value-of select="@cost"/>
            </dd>
            <dt>Name:</dt>
            <dd>
              <xsl:value-of select="@name"/>
            </dd>
            <dt>Type:</dt>
            <dd>
              <xsl:value-of select="@type"/>
            </dd>
            <xsl:if test="@function">
              <dt>Function:</dt>
              <dd>
                <xsl:value-of select="@function"/>
              </dd>
            </xsl:if>
            <xsl:if test="@guiding-aspect">
              <xsl:call-template name="guiding-aspect">
                <xsl:with-param name="type">
                  <xsl:value-of select="@guiding-aspect"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:apply-templates select="features/feature"/>
            <xsl:apply-templates select="flaws/flaw"/>
          </dl>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
