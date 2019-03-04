<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-roles-header-row">
    <tr>
      <th colspan="4" class="sectionheader">Roles and Skills</th>
    </tr>
    <tr>
      <th/>
      <xsl:for-each select="/character/skills/role">
      <th><xsl:value-of select="@name"/></th>
      </xsl:for-each>
    </tr>
  </xsl:template>
</xsl:stylesheet>
