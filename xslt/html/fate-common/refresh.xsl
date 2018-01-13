<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:include href="refresh-variables.xsl"/>

  <xsl:template name="refresh">
    <td>
      <dl id="refresh">
        <dt>Refresh:</dt>
        <dd class="box"><xsl:value-of select="$currentRefresh"/></dd>
      </dl>
    </td>
    <td>
      <dl id="current-fate-points">
        <dt>Current Fate Points:</dt>
        <dd class="box"><xsl:value-of select="$currentFatePoints"/></dd>
      </dl>
    </td>
  </xsl:template>

</xsl:stylesheet>
