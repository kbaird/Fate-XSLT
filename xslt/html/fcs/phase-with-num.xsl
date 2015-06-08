<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/phase-aspects.xsl"/>
  <xsl:include href="../fate-common/phase-title.xsl"/>
  <xsl:template name="phase-with-num">
    <xsl:param name="num"/>
    <xsl:if test="@num = $num">
      <legend class="label">
        <span class="phase-title">
          <xsl:call-template name="phase-title">
            <xsl:with-param name="phase">
              <xsl:value-of select="$num"/>
            </xsl:with-param>
          </xsl:call-template>
        </span>
        <xsl:call-template name="phase-aspects">
          <xsl:with-param name="phase">
            <xsl:value-of select="$num"/>
          </xsl:with-param>
        </xsl:call-template>
      </legend>
      <xsl:value-of select="events"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
