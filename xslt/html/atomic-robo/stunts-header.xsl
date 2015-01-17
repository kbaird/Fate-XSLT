<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./mega-stunts-cost.xsl"/>
  <xsl:template name="stunts-header">
    <xsl:param name="label"/>
    <tr>
      <th colspan="2" class="sectionheader">
        <xsl:value-of select="$label"/>
        <xsl:call-template name="mega-stunts-cost"/>
      </th>
    </tr>
  </xsl:template>
</xsl:stylesheet>
