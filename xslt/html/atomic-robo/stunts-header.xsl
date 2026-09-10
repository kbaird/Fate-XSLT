<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="stunts-header">
    <xsl:param name="label"/>
    <tr>
      <th colspan="2" class="sectionheader">
        <xsl:value-of select="$label"/>
        <xsl:call-template name="mega-stunts-cost">
          <xsl:with-param name="gadgetsCount" select="count(/character/stunts/gadget)"/>
          <xsl:with-param name="gadgetsBenefitsCost" select="sum(/character/stunts/gadget/benefits/benefit/@cost)"/>
          <xsl:with-param name="signatureAspectCount" select="count(/character/aspects/aspect[@signature='true'])"/>
          <xsl:with-param name="stuntsCount" select="count(/character/stunts/stunt)"/>
          <xsl:with-param name="stuntsMegaCount" select="count(/character/stunts/stunt[@mega='true'])"/>
        </xsl:call-template>
      </th>
    </tr>
  </xsl:template>
</xsl:stylesheet>
