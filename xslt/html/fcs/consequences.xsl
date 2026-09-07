<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./consequence.xsl"/>
  <xsl:template name="consequences">
    <table>
      <tr>
        <th colspan="2" class="sectionheader">Consequences</th>
      </tr>
      <tr>
        <td>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Mild (2)</xsl:with-param>
            <xsl:with-param name="severity">Mild</xsl:with-param>
          </xsl:call-template>
          <xsl:if test="/character/stunts/stunt[@consequence='Mild']">
            <xsl:call-template name="consequence">
              <xsl:with-param name="label">Mild (2)</xsl:with-param>
              <xsl:with-param name="severity">Mild</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Moderate (4)</xsl:with-param>
            <xsl:with-param name="severity">Moderate</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="consequence">
            <xsl:with-param name="label">Severe (6)</xsl:with-param>
            <xsl:with-param name="severity">Severe</xsl:with-param>
          </xsl:call-template>
          <xsl:variable name="physical-consequence-skill">
            <xsl:choose>
              <xsl:when test="/character/hacks/@physical-consequence-skill">
                <xsl:value-of select="/character/hacks/@physical-consequence-skill"/>
              </xsl:when>
              <xsl:otherwise>Physique</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:variable name="mental-consequence-skill">
            <xsl:choose>
              <xsl:when test="/character/hacks/@mental-consequence-skill">
                <xsl:value-of select="/character/hacks/@mental-consequence-skill"/>
              </xsl:when>
              <xsl:otherwise>Will</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:variable name="physical-consequence-stunt">
            <xsl:choose>
              <xsl:when test="/character/hacks/@physical-consequence-stunt">
                <xsl:value-of select="/character/hacks/@physical-consequence-stunt"/>
              </xsl:when>
              <xsl:otherwise>Dwarven Toughness</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:if test="/character/skills/skill[@name=$physical-consequence-skill]/@rating &gt; 4 or /character/stunts/stunt[@name=$physical-consequence-stunt]">
            <xsl:call-template name="consequence">
              <xsl:with-param name="label">Mild Physical (2)</xsl:with-param>
              <xsl:with-param name="severity">Mild-Physical</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="/character/skills/skill[@name=$mental-consequence-skill]/@rating &gt; 4">
            <xsl:call-template name="consequence">
              <xsl:with-param name="label">Mild Mental (2)</xsl:with-param>
              <xsl:with-param name="severity">Mild-Mental</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </td>
      </tr>
      <tfoot><tr><th colspan="2">F = Free, R? = Recovering?</th></tr></tfoot>
    </table>
  </xsl:template>
</xsl:stylesheet>
