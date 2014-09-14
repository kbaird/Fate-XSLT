<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skills-with-modes">
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
   <td class="unused"/>
   <td class="unused">
    <ul id="skill-explanation">
     <li class="specialized">specialized</li>
     <li class="focused">focused</li>
     <li>trained</li>
    </ul>
   </td>
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
   <td class="unused"/>
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
   <td class="unused"/>
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
