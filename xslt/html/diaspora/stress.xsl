<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="pre-core-stress">
  <table border="1" id="stress">
   <tr>
    <th class="sectionheader" colspan="5">Health</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <xsl:if test="/character/skills/skill[@name='Stamina']/@rating &gt; 0">
     <td>4</td>
    </xsl:if>
    <xsl:if test="/character/skills/skill[@name='Stamina']/@rating &gt; 2">
     <td>5</td>
    </xsl:if>
   </tr>
   <tr>
    <th class="sectionheader" colspan="5">Composure</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <xsl:if test="/character/skills/skill[@name='Resolve']/@rating &gt; 0">
     <td>4</td>
    </xsl:if>
    <xsl:if test="/character/skills/skill[@name='Resolve']/@rating &gt; 2">
     <td>5</td>
    </xsl:if>
   </tr>
   <tr>
    <th class="sectionheader" colspan="5">Wealth</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <xsl:if test="/character/skills/skill[@name='Assets']/@rating &gt; 0">
     <td>4</td>
    </xsl:if>
    <xsl:if test="/character/skills/skill[@name='Assets']/@rating &gt; 2">
     <td>5</td>
    </xsl:if>
   </tr>
  </table>
 </xsl:template>
</xsl:stylesheet>
