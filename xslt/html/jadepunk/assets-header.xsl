<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="assets-header">
    <xsl:param name="label"/>
    <tr>
      <th colspan="2" class="sectionheader">
        <xsl:value-of select="$label"/>
      </th>
    </tr>
  </xsl:template>
</xsl:stylesheet>
