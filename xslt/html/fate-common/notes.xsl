<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="notes">
  <table border="1">
   <tr>
    <th colspan="4" class="sectionheader">Notes</th>
   </tr>
   <tr>
    <td style="text-align:left;">
     <strong>Character Notes: </strong>
     <xsl:value-of select="charnotes"/>
    </td>
    <td rowspan="2" style="text-align:left;">
     <strong>Wishlist: </strong>
     <ul>
      <xsl:apply-templates select="wishlist/wish"/>
     </ul>
    </td>
   </tr>
   <tr>
    <td style="text-align:left;">
     <strong>Character History: </strong>
     <xsl:value-of select="charhistory"/>
    </td>
   </tr>
  </table>
 </xsl:template>
 <xsl:template match="wish">
  <li>
   <xsl:value-of select="."/>
  </li>
 </xsl:template>
</xsl:stylesheet>
