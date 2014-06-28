<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:include href="skill-modes.xsl"/>

 <xsl:template match="skills">
  <xsl:param name="useSkillModes"/>
  <table id="skills">
   <xsl:choose>
    <xsl:when test="$useSkillModes='true'">
     <tr><th colspan="4" class="sectionheader">Modes and Skills</th></tr>
     <tr>
      <th/>
      <th>
       <xsl:call-template name="skill-mode-th">
        <xsl:with-param name="rating" select="3"/>
       </xsl:call-template>
      </th>
      <th>
       <xsl:call-template name="skill-mode-th">
        <xsl:with-param name="rating" select="2"/>
       </xsl:call-template>
      </th>
      <th>
       <xsl:call-template name="skill-mode-th">
        <xsl:with-param name="rating" select="1"/>
       </xsl:call-template>
      </th>
     </tr>
     <tr>
      <th class="mode-rating">+5</th>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="3"/>
        <xsl:with-param name="skillRating" select="5"/>
       </xsl:call-template>
      </td>
      <td/>
      <td/>
     </tr>
     <tr>
      <th class="mode-rating">+4</th>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="3"/>
        <xsl:with-param name="skillRating" select="4"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="2"/>
        <xsl:with-param name="skillRating" select="4"/>
       </xsl:call-template>
      </td>
      <td/>
     </tr>
     <tr>
      <th class="mode-rating">+3</th>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="3"/>
        <xsl:with-param name="skillRating" select="3"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="2"/>
        <xsl:with-param name="skillRating" select="3"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="1"/>
        <xsl:with-param name="skillRating" select="3"/>
       </xsl:call-template>
      </td>
     </tr>
     <tr>
      <th class="mode-rating">+2</th>
      <td/>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="2"/>
        <xsl:with-param name="skillRating" select="2"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="1"/>
        <xsl:with-param name="skillRating" select="2"/>
       </xsl:call-template>
      </td>
     </tr>
     <tr>
      <th class="mode-rating">+1</th>
      <td/>
      <td/>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating"  select="1"/>
        <xsl:with-param name="skillRating" select="1"/>
       </xsl:call-template>
      </td>
     </tr>
    </xsl:when>
    <xsl:otherwise>
     <tr>
      <th colspan="6" class="sectionheader">Skills</th>
     </tr>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating" select="5"/>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating" select="4"/>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating" select="3"/>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating" select="2"/>
     </xsl:call-template>
     <xsl:call-template name="skill">
      <xsl:with-param name="rating" select="1"/>
     </xsl:call-template>
    </xsl:otherwise>
   </xsl:choose>
  </table>
  <xsl:if test="$useSkillModes='true'">
  <ul id="skill_explanation">
   <li class="specialized">specialized</li>
   <li class="focused">focused</li>
   <li>trained</li>
  </ul>
  </xsl:if>
 </xsl:template>
 <xsl:template name="skill">
  <xsl:param name="rating"/>
  <xsl:variable name="textRating">
   <xsl:call-template name="name-of-rating">
    <xsl:with-param name="rating" select="$rating"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:if test="/character/skills/skill[@rating=$rating]">
   <tr>
    <th class="rating">
     <xsl:value-of select="$textRating"/> (+<xsl:value-of select="$rating"/>)</th>
    <xsl:for-each select="/character/skills/skill[@rating=$rating]">
     <td>
      <xsl:value-of select="@name"/>
     </td>
    </xsl:for-each>
   </tr>
  </xsl:if>
 </xsl:template>
</xsl:stylesheet>
