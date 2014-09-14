<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="stress-header">
  <xsl:param name="headerName"/>
  <xsl:param name="maxCount"/>
  <tr>
   <th class="sectionheader">
    <xsl:attribute name="colspan">
     <xsl:value-of select="$maxCount"/>
    </xsl:attribute>
    <xsl:value-of select="$headerName"/>
   </th>
  </tr>
 </xsl:template>

</xsl:stylesheet>
