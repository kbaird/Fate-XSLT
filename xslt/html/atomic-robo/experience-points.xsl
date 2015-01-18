<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="experience-points">
    <td>
      <dl id="experience-points">
        <dt>Points:</dt>
        <dd class="box">
          <xsl:value-of select="experience-points"/>
        </dd>
      </dl>
    </td>
  </xsl:template>
</xsl:stylesheet>
