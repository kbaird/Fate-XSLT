<?xml version="1.0" ?>
<!--
  OPTIMIZE: DRY up along with pre-core stress
  This one would be simplest, with just the base
  and max integers as params.
-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="stress">
  <table border="1" id="stress">
   <tr>
    <th class="sectionheader" colspan="3">Stress</th>
   </tr>
   <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
   </tr>
  </table>
 </xsl:template>
</xsl:stylesheet>
