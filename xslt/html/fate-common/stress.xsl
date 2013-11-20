<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="pre-core-stress">
  <xsl:param name="headerName"/>
  <xsl:param name="skillName"/>
  <tr>
   <th class="sectionheader" colspan="5">
    <xsl:value-of select="$headerName"/>
   </th>
  </tr>
  <tr>
   <td>1</td>
   <td>2</td>
   <td>3</td>
   <xsl:if test="/character/skills/skill[@name=$skillName]/@rating &gt; 0">
    <td>4</td>
   </xsl:if>
   <xsl:if test="/character/skills/skill[@name=$skillName]/@rating &gt; 2">
    <td>5</td>
   </xsl:if>
  </tr>
 </xsl:template>
</xsl:stylesheet>
