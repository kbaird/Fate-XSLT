<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="stress-header.xsl"/>
  <xsl:include href="base-stress-boxes.xsl"/>
  <xsl:include href="generic-stress.xsl"/>
  <xsl:include href="more-stress-boxes.xsl"/>
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
