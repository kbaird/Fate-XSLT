<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="aspects">
    <table id="aspects">
      <tr>
        <th colspan="2" class="sectionheader">Aspects</th>
      </tr>
      <xsl:apply-templates select="aspect"/>
    </table>
  </xsl:template>
  <xsl:template match="aspect">
    <tr>
      <td>
        <fieldset class="aspect">
          <xsl:choose>
            <xsl:when test="@type">
              <xsl:choose>
                <xsl:when test="@type = 'High-Concept'">
                  <legend class="label">
                    <span>High Concept</span>
                  </legend>
                  <xsl:call-template name="aspect-name">
                    <xsl:with-param name="aspect-name">
                      <xsl:value-of select="."/>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@type = 'Inciting-Incident'">
                  <legend class="label">
                    <span>Inciting Incident</span>
                  </legend>
                  <xsl:call-template name="aspect-name">
                    <xsl:with-param name="aspect-name">
                      <xsl:value-of select="."/>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="@type = 'Mode'">
                  <legend class="label">
                    <span><xsl:value-of select="@mode-name"/> Mode</span>
                  </legend>
                  <xsl:call-template name="aspect-name">
                    <xsl:with-param name="aspect-name">
                      <xsl:value-of select="."/>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <legend class="label">
                    <span>
                      <xsl:value-of select="@type"/>
                    </span>
                  </legend>
                  <xsl:call-template name="aspect-name">
                    <xsl:with-param name="aspect-name">
                      <xsl:value-of select="."/>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
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
  <xsl:template name="aspect-name">
    <xsl:param name="aspect-name"/>
    <xsl:value-of select="$aspect-name"/>
    <xsl:if test="@signature='true'">
      <xsl:text>*</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
