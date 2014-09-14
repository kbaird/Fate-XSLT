<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skills-with-modes-plus5-row">
  <tr>
   <th class="mode-rating">+5</th>
   <td>
    <xsl:call-template name="skill-mode-tds">
     <xsl:with-param name="modeRating"  select="3"/>
     <xsl:with-param name="skillRating" select="5"/>
    </xsl:call-template>
   </td>
   <td class="unused"/>
   <td class="unused">
    <ul id="skill-explanation">
     <li class="specialized">specialized</li>
     <li class="focused">focused</li>
     <li>trained</li>
    </ul>
   </td>
  </tr>
 </xsl:template>

</xsl:stylesheet>
