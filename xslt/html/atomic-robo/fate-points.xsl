<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="fate-points" mode="atomic-robo">
    <td>
      <dl id="current-fate-points">
        <dt>Current <acronym title="Fate Points">FP</acronym>:</dt>
        <dd class="box"><xsl:value-of select="count(/character/aspects/aspect)"/></dd>
      </dl>
    </td>
  </xsl:template>
</xsl:stylesheet>
