<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="../fate-common/stress.xsl"/>
  <xsl:template name="stress">
    <xsl:param name="useCorruption"/>
    <table id="stress">
      <xsl:call-template name="generic-stress">
        <xsl:with-param name="baseCount">2</xsl:with-param>
        <xsl:with-param name="maxCount">4</xsl:with-param>
        <xsl:with-param name="headerName">Physical Stress</xsl:with-param>
        <xsl:with-param name="skillName">Constitution</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="generic-stress">
        <xsl:with-param name="baseCount">2</xsl:with-param>
        <xsl:with-param name="maxCount">4</xsl:with-param>
        <xsl:with-param name="headerName">Mental Stress</xsl:with-param>
        <xsl:with-param name="skillName">Wisdom</xsl:with-param>
      </xsl:call-template>
      <xsl:if test="$useCorruption='true'">
        <xsl:call-template name="corruption-stress"/>
      </xsl:if>
    </table>
  </xsl:template>
  <xsl:template name="corruption-stress">
    <tr>
      <th class="sectionheader" colspan="4">Corruption</th>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
