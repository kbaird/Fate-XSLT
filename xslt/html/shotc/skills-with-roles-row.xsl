<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="skill-role-tds.xsl"/>
  <xsl:template name="skills-with-roles-row">
    <xsl:param name="skillRating"/>
    <tr>
      <th class="mode-rating">+<xsl:value-of select="$skillRating"/></th>
      <xsl:call-template name="skill-role-tds">
        <xsl:with-param name="skillRating" select="$skillRating"/>
      </xsl:call-template>
    </tr>
  </xsl:template>
</xsl:stylesheet>
