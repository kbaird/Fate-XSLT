<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="refresh">
    <td>
      <dl id="refresh">
        <dt>Refresh:</dt>
        <!-- TODO: Calculate from stunts cost -->
        <dd class="box"><xsl:value-of select="/character/refresh"/></dd>
      </dl>
    </td>
    <td>
      <dl id="current-fate-points">
        <dt>Current <acronym title="Fate Points">FP</acronym>:</dt>
        <dd class="box"><xsl:value-of select="/character/refresh/@current"/></dd>
      </dl>
    </td>
  </xsl:template>
</xsl:stylesheet>
