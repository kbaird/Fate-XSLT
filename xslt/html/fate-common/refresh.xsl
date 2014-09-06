<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="refresh">
  <td>
   <dl id="refresh">
    <dt>Refresh:</dt>
    <dd class="box">
     <xsl:value-of select="/character/refresh"/>
    </dd>
   </dl>
  </td>
 </xsl:template>
</xsl:stylesheet>
