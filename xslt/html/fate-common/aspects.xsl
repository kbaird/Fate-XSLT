<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./aspect.xsl"/>
  <xsl:template match="aspects">
    <table id="aspects_table">
      <tr>
        <th colspan="2" class="sectionheader">Aspects</th>
      </tr>
      <xsl:apply-templates select="aspect"/>
    </table>
    <xsl:if test="../languages and /character/skills/@shape='flat'">
      <section id="languages">Languages: <xsl:value-of select="../languages"/></section>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
