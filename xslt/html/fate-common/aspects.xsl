<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="aspects">
  <table border="1" id="aspects">
   <tr>
    <th colspan="2" class="sectionheader">Aspects</th>
   </tr>
   <xsl:apply-templates select="aspect"/>
  </table>
 </xsl:template>
 <xsl:template match="aspect">
  <tr>
   <td>
    <fieldset class="aspect">
     <xsl:choose>
      <xsl:when test="@type">
       <xsl:if test="@type = 'concept'">
        <legend class="label">
         <span>Concept</span>
        </legend>
        <xsl:value-of select="."/>
       </xsl:if>
       <xsl:if test="@type = 'high_concept'">
        <legend class="label">
         <span>High Concept</span>
        </legend>
        <xsl:value-of select="."/>
       </xsl:if>
       <xsl:if test="@type = 'mode'">
        <legend class="label">
         <span><xsl:value-of select="@mode_name"/> Mode</span>
        </legend>
        <xsl:value-of select="."/>
       </xsl:if>
       <xsl:if test="@type = 'omega'">
        <legend class="label">
         <span>Omega</span>
        </legend>
        <xsl:value-of select="."/>
       </xsl:if>
       <xsl:if test="@type = 'trouble'">
        <legend class="label">
         <span>Trouble</span>
        </legend>
        <xsl:value-of select="."/>
       </xsl:if>
      </xsl:when>
      <xsl:otherwise>
       <span class="content">
        <xsl:value-of select="."/>
       </span>
      </xsl:otherwise>
     </xsl:choose>
    </fieldset>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>
