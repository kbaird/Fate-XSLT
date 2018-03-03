<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./name.xsl"/>
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
          <!-- Used for Mindjammer, ignored otherwise -->
          <xsl:if test="homeworld">
            <fieldset id="homeworld">
              <legend class="label">
                <span>Homeworld</span>
              </legend>
              Name: <xsl:value-of select="homeworld/@name"/>
              <xsl:if test="homeworld/@ref"> (<xsl:value-of select="homeworld/@ref"/>)</xsl:if>, 
              Habituated Gravity: 
              <xsl:value-of select="homeworld/@habituated-gravity"/>, 
              Tech Index: 
              <xsl:value-of select="homeworld/@tech-index"/>
            </fieldset>
          </xsl:if>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
