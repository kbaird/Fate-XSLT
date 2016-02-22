<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="./description.xsl"/>
  <xsl:template match="id">
    <table>
      <tr><th colspan="2" class="sectionheader">ID</th></tr>
      <tr><td><xsl:call-template name="name"/></td></tr>
      <tr><td><xsl:call-template name="description"/></td></tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
