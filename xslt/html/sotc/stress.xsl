<?xml version="1.0" ?>
<!--
  OPTIMIZE: DRY up both pre-core stress templates
-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="sotc-stress">
  <table border="1" id="stress">
   <tr>
    <th class="sectionheader" colspan="9">Health</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
    <xsl:if test="/character/skills/skill[@name='Endurance']/@rating &gt; 0">
     <td>6</td>
    </xsl:if>
    <xsl:if test="/character/skills/skill[@name='Endurance']/@rating &gt; 2">
     <td>7</td>
    </xsl:if>
    <xsl:if test="/character/skills/skill[@name='Endurance']/@rating &gt; 4">
     <td>8</td>
    </xsl:if>
   </tr>
   <tr>
    <th class="sectionheader" colspan="9">Composure</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
    <xsl:if test="/character/skills/skill[@name='Resolve']/@rating &gt; 0">
     <td>6</td>
    </xsl:if>
    <xsl:if test="/character/skills/skill[@name='Resolve']/@rating &gt; 2">
     <td>7</td>
    </xsl:if>
    <xsl:if test="/character/skills/skill[@name='Resolve']/@rating &gt; 4">
     <td>8</td>
    </xsl:if>
   </tr>
  </table>
 </xsl:template>
</xsl:stylesheet>
