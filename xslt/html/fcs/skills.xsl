<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skill-mode-tds">
  <xsl:param name="modeRating"/>
  <xsl:param name="addRating"/>
  <xsl:for-each select="/character/skills/mode[@rating=$modeRating]/skill[@add=$addRating]">
   <xsl:value-of select="@name"/>
   <xsl:if test="position() != last()">
    <xsl:text>,</xsl:text>
   </xsl:if>
  </xsl:for-each>
 </xsl:template>

 <xsl:template name="skill-mode-th">
  <xsl:param name="rating"/>
  <xsl:for-each select="/character/skills/mode[@rating=$rating]">
   <xsl:call-template name="name-of-rating">
    <xsl:with-param name="rating" select="$rating"/>
   </xsl:call-template>
   (+<xsl:value-of select="$rating"/>)
   <xsl:value-of select="@name"/>
  </xsl:for-each>
 </xsl:template>

 <xsl:template match="skills">
  <xsl:variable name="useSkillModes">
   <xsl:choose>
    <xsl:when test="/character/hacks/@skill-modes='true'">true</xsl:when>
    <xsl:otherwise>false</xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <table id="skills">
   <xsl:choose>
    <xsl:when test="$useSkillModes='true'">
     <tr><th colspan="4" class="sectionheader">Skills</th></tr>
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
      <th>+5</th>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="3"/>
        <xsl:with-param name="addRating"  select="2"/>
       </xsl:call-template>
      </td>
      <td>x</td>
      <td>x</td>
     </tr>
     <tr>
      <th>+4</th>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="3"/>
        <xsl:with-param name="addRating"  select="1"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="2"/>
        <xsl:with-param name="addRating"  select="2"/>
       </xsl:call-template>
      </td>
      <td>x</td>
     </tr>
     <tr>
      <th>+3</th>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="3"/>
        <xsl:with-param name="addRating"  select="0"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="2"/>
        <xsl:with-param name="addRating"  select="1"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="1"/>
        <xsl:with-param name="addRating"  select="2"/>
       </xsl:call-template>
      </td>
     </tr>
     <tr>
      <th>+2</th>
      <td>x</td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="2"/>
        <xsl:with-param name="addRating"  select="0"/>
       </xsl:call-template>
      </td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="1"/>
        <xsl:with-param name="addRating"  select="1"/>
       </xsl:call-template>
      </td>
     </tr>
     <tr>
      <th>+1</th>
      <td>x</td>
      <td>x</td>
      <td>
       <xsl:call-template name="skill-mode-tds">
        <xsl:with-param name="modeRating" select="1"/>
        <xsl:with-param name="addRating"  select="0"/>
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
