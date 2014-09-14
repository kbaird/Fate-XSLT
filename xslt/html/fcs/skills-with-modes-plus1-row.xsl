<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skills-with-modes-plus1-row">
  <tr>
   <th class="mode-rating">+1</th>
   <td class="unused"/>
   <td class="unused"/>
   <td>
    <xsl:call-template name="skill-mode-tds">
     <xsl:with-param name="modeRating"  select="1"/>
     <xsl:with-param name="skillRating" select="1"/>
    </xsl:call-template>
   </td>
  </tr>
 </xsl:template>

</xsl:stylesheet>