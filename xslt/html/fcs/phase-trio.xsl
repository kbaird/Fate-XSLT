<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/phase-aspects.xsl"/>
  <xsl:template match="phase-trio">
    <table>
      <tr>
        <th colspan="2" class="sectionheader">Phases</th>
      </tr>
      <xsl:apply-templates select="phase"/>
    </table>
  </xsl:template>
  <xsl:template match="phase">
    <tr>
      <td>
        <fieldset class="phase">
          <xsl:if test="@num = '1'">
            <legend class="label">
              <span class="phase-title">Phase 1: Your Adventure</span>
              <xsl:call-template name="phase-aspects">
                <xsl:with-param name="phase">1</xsl:with-param>
              </xsl:call-template>
            </legend>
            <xsl:value-of select="events"/>
          </xsl:if>
          <xsl:if test="@num = '2'">
            <legend class="label">
              <span class="phase-title">Phase 2: Crossing Paths</span>
              <xsl:call-template name="phase-aspects">
                <xsl:with-param name="phase">2</xsl:with-param>
              </xsl:call-template>
            </legend>
            <xsl:value-of select="events"/>
          </xsl:if>
          <xsl:if test="@num = '3'">
            <legend class="label">
              <span class="phase-title">Phase 3: Crossing Paths Again</span>
              <xsl:call-template name="phase-aspects">
                <xsl:with-param name="phase">3</xsl:with-param>
              </xsl:call-template>
            </legend>
            <xsl:value-of select="events"/>
          </xsl:if>
        </fieldset>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
