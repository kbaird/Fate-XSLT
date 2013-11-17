<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="stress">
  <table border="1" id="stress">
   <tr>
    <th class="sectionheader" colspan="4">Physical Stress (Physique)</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <xsl:if test="/fcs/skills/skill[@name='Physique']/@rating &gt; 0">
     <td>3</td>
    </xsl:if>
    <xsl:if test="/fcs/skills/skill[@name='Physique']/@rating &gt; 2">
     <td>4</td>
    </xsl:if>
   </tr>
   <tr>
    <th class="sectionheader" colspan="4">Mental Stress (Will)</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <xsl:if test="/fcs/skills/skill[@name='Will']/@rating &gt; 0">
     <td>3</td>
    </xsl:if>
    <xsl:if test="/fcs/skills/skill[@name='Will']/@rating &gt; 2">
     <td>4</td>
    </xsl:if>
   </tr>
  </table>
 </xsl:template>
</xsl:stylesheet>
