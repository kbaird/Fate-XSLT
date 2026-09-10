<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../fate-common/id.xsl"/>
  <xsl:output method="html"/>
  <xsl:template match="id">
    <xsl:call-template name="id-frame"/>
  </xsl:template>
  <xsl:template name="id-extra">
    <tr>
      <td><xsl:call-template name="species"/></td>
    </tr>
    <tr>
      <td><xsl:call-template name="description"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>