<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="fate-points">
    <td>
      <dl id="current-fate-points">
        <dt>Current Fate Points:</dt>
        <dd class="box"><xsl:value-of select="count(/character/aspects/aspect[normalize-space(text()) != '' and text() != '&#160;'])"/></dd>
      </dl>
    </td>
  </xsl:template>
</xsl:stylesheet>
