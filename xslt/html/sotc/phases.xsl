<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="../fate-common/phase-aspects.xsl"/>
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
         <span class="phase-title">Phase 1: Background</span>
         <xsl:call-template name="phase-aspects">
          <xsl:with-param name="phase">1</xsl:with-param>
         </xsl:call-template>
        </legend>
        <xsl:value-of select="events"/>
       </xsl:if>
       <xsl:if test="@type = 'the-great-war'">
        <legend class="label">
         <span class="phase-title">Phase 2: The Great War and Entry Into the Club</span>
         <span id="century-club-patron">Century Club Patron: <xsl:value-of select="century-club-patron"/>
         </span>
         <xsl:call-template name="phase-aspects">
          <xsl:with-param name="phase">2</xsl:with-param>
         </xsl:call-template>
        </legend>
        <xsl:value-of select="events"/>
       </xsl:if>
       <xsl:if test="@type = 'your-novel'">
        <legend class="label">
         <span class="phase-title">Phase 3: <em>
           <xsl:value-of select="@title"/>
          </em>
         </span>
         <span id="guest-stars">Guest-starring <xsl:value-of select="guest-stars"/>
         </span>
         <xsl:call-template name="phase-aspects">
          <xsl:with-param name="phase">3</xsl:with-param>
         </xsl:call-template>
        </legend>
        <xsl:value-of select="events"/>
       </xsl:if>
      </xsl:when>
      <xsl:otherwise>
       <legend class="label">
        <span class="phase-title">Phase <xsl:value-of select="@num"/>: Other Adventures</span>
        <span id="guest-starring">Guest-starring in: <em>
          <xsl:value-of select="@title"/>
         </em>
        </span>
        <xsl:call-template name="phase-aspects">
         <xsl:with-param name="phase">
          <xsl:value-of select="@num"/>
         </xsl:with-param>
        </xsl:call-template>
       </legend>
       <xsl:value-of select="events"/>
      </xsl:otherwise>
     </xsl:choose>
    </fieldset>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>
