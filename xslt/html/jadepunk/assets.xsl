<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
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
            <xsl:apply-templates select="features"/>
            <xsl:apply-templates select="flaws"/>
          </dl>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="guiding-aspect">
    <xsl:param name="type"/>
    <xsl:for-each select="/character/aspects/aspect[@type=$type]">
      <dt>Guiding Aspect:</dt>
      <dd>
        <xsl:value-of select="."/>
      </dd>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="assets-header">
    <xsl:param name="label"/>
    <tr>
      <th colspan="2" class="sectionheader">
        <xsl:value-of select="$label"/>
      </th>
    </tr>
  </xsl:template>
  <xsl:template match="features">
    <xsl:apply-templates select="feature"/>
  </xsl:template>
  <xsl:template match="feature">
    <dt class="feature"><xsl:value-of select="@type"/>:</dt>
    <dd>
      <xsl:value-of select="@effect"/>
    </dd>
  </xsl:template>
  <xsl:template match="flaws">
    <xsl:apply-templates select="flaw"/>
  </xsl:template>
  <xsl:template match="flaw">
    <dt class="flaw"><xsl:value-of select="@type"/>:</dt>
    <dd>
      <xsl:choose>
        <xsl:when test="@effect">
          <xsl:value-of select="@effect"/>
        </xsl:when>
        <xsl:when test="@type='Consuming'">
          <xsl:text>Costs 1 Fate Point to use</xsl:text>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </dd>
  </xsl:template>
</xsl:stylesheet>
