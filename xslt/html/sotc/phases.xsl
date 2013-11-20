<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="phases">
  <table border="1">
   <tr>
    <th colspan="2" class="sectionheader">Phases</th>
   </tr>
   <xsl:apply-templates select="phase"/>
  </table>
 </xsl:template>
 <xsl:template match="phase">
  <tr>
   <td>
    <fieldset class="phase">
     <xsl:choose>
      <xsl:when test="@type">
       <xsl:if test="@type = 'background'">
        <legend class="label">
         <span>Phase 1: Background</span>
        </legend>
        <xsl:value-of select="events"/>
       </xsl:if>
       <xsl:if test="@type = 'the-great-war'">
        <legend class="label">
         <span>Phase 2: The Great War</span>
         <span id="century-club-patron">Century Club Patron: <xsl:value-of select="century-club-patron"/></span>
        </legend>
        <xsl:value-of select="events"/>
       </xsl:if>
       <xsl:if test="@type = 'your-novel'">
        <legend class="label">
         <span>Phase 3: <xsl:value-of select="@title"/></span>
         <span id="guest-stars">Guest-starring <xsl:value-of select="guest-stars"/></span>
        </legend>
        <xsl:value-of select="events"/>
       </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <legend class="label">
         <span>Phase <xsl:value-of select="@num"/>: Other Adventures</span>
         <span id="guest-starring">Guest-starring in <xsl:value-of select="@title"/></span>
        </legend>
        <xsl:value-of select="events"/>
      </xsl:otherwise>
     </xsl:choose>
    </fieldset>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>
