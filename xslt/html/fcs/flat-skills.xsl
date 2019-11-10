<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="flat-skills">
    <tr>
      <th colspan="6" class="sectionheader"><xsl:value-of select="@name"/></th>
    </tr>
    <tr><td><xsl:apply-templates select="skill" mode="flat"/></td></tr>
  </xsl:template>
</xsl:stylesheet>
