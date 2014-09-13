<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="id">
  <table>
   <tr>
    <th colspan="2" class="sectionheader">ID</th>
   </tr>
   <tr>
    <td>
     <fieldset id="name">
      <legend class="label">
       <span>Name</span>
      </legend>
      <xsl:value-of select="charname"/>
      <xsl:if test="charname/@nickname">
       <xsl:text> (</xsl:text>
        <q><xsl:value-of select="charname/@nickname"/></q>
       <xsl:text>)</xsl:text>
      </xsl:if>
     </fieldset>
    </td>
   </tr>
   <tr>
    <td>
     <xsl:if test="affiliation">
      <fieldset id="affiliation">
       <legend class="label">
        <span>Affiliation</span>
       </legend>
       <xsl:value-of select="affiliation"/>
      </fieldset>
     </xsl:if>
     <xsl:if test="description">
      <fieldset id="description">
       <legend class="label">
        <span>Description</span>
       </legend>
       <xsl:value-of select="description"/>
      </fieldset>
     </xsl:if>
    </td>
   </tr>
  </table>
 </xsl:template>
</xsl:stylesheet>
