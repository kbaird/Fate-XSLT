<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-modes-plus4-row">
    <tr>
      <th class="mode-rating">+4</th>
      <td>
        <xsl:call-template name="skill-mode-tds">
          <xsl:with-param name="modeRating" select="3"/>
          <xsl:with-param name="skillRating" select="4"/>
        </xsl:call-template>
      </td>
      <td>
        <xsl:call-template name="skill-mode-tds">
          <xsl:with-param name="modeRating" select="2"/>
          <xsl:with-param name="skillRating" select="4"/>
        </xsl:call-template>
      </td>
      <td class="unused"/>
    </tr>
  </xsl:template>
</xsl:stylesheet>
