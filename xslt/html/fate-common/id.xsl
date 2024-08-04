<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./name.xsl"/>
  <xsl:include href="../mindjammer/homeworld.xsl"/>
  <xsl:template match="id">
    <table>
      <tr>
        <th colspan="2" class="sectionheader">ID</th>
      </tr>
      <tr>
        <td><xsl:call-template name="name"/></td>
      </tr>
      <tr>
        <td>
          <xsl:if test="description">
            <fieldset id="description">
              <legend class="label"><span>Description</span></legend>
              <xsl:value-of select="description"/>
            </fieldset>
          </xsl:if>
          <xsl:if test="arc">
            <fieldset id="arc">
              <legend class="label">
                <span>Arc: <xsl:value-of select="arc/@name"/></span>
              </legend>
              <xsl:value-of select="arc"/>
            </fieldset>
          </xsl:if>
          <xsl:if test="unique">
            <fieldset id="unique">
              <legend class="label"><span>One Unique Thing</span></legend>
              <xsl:value-of select="unique"/>
            </fieldset>
          </xsl:if>
          <xsl:apply-templates select="homeworld"/>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
