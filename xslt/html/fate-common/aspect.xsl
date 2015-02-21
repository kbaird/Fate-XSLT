<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./aspect-label.xsl"/>
  <xsl:include href="./aspect-name.xsl"/>
  <xsl:include href="./pad-aspect.xsl"/>
  <xsl:template match="aspect">
    <tr>
      <td>
        <fieldset class="aspect">
          <xsl:call-template name="pad-aspect">
            <xsl:with-param name="name">
              <xsl:value-of select="@type"/>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:choose>
            <xsl:when test="@type">
              <xsl:call-template name="aspect-label">
                <xsl:with-param name="modeName">
                  <xsl:value-of select="@mode-name"/>
                </xsl:with-param>
                <xsl:with-param name="type">
                  <xsl:value-of select="@type"/>
                </xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="aspect-name">
                <xsl:with-param name="aspect-name">
                  <xsl:value-of select="."/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <span class="content">
                <xsl:call-template name="aspect-name">
                  <xsl:with-param name="aspect-name">
                    <xsl:value-of select="."/>
                  </xsl:with-param>
                </xsl:call-template>
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
