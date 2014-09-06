<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="character">
  <xsl:variable name="useConditions">
   <xsl:choose>
    <xsl:when test="hacks/@conditions='true'">true</xsl:when>
    <xsl:otherwise>false</xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:variable name="useSkillModes">true</xsl:variable>
  <html>
   <xsl:call-template name="head">
    <xsl:with-param name="baseCSS">fcs</xsl:with-param>
    <xsl:with-param name="moreCSS">atomic-robo</xsl:with-param>
   </xsl:call-template>
   <body>
    <h1>
     <xsl:value-of select="id/charname"/>
    </h1>
    <div id="id">
     <xsl:apply-templates select="id"/>
    </div>
    <div id="fate-logo">
     <span id="atomic-robo-logo">
      <img alt="Atomic Robo" src="robo_logo.gif"/>
     </span>
     <table>
      <tr>
       <xsl:call-template name="current-fate-points"/>
       <xsl:call-template name="experience-points"/>
      </tr>
     </table>
    </div>
    <hr />
    <div id="aspects">
     <xsl:apply-templates select="aspects"/>
    </div>
    <div id="skills">
     <xsl:apply-templates select="skills">
      <xsl:with-param name="useSkillModes">
       <xsl:value-of select="$useSkillModes"/>
      </xsl:with-param>
     </xsl:apply-templates>
    </div>
    <hr />
    <xsl:apply-templates select="experiences"/>
    <xsl:call-template name="experiences-explanation"/>
    <hr />
    <div id="stunts">
     <xsl:apply-templates select="stunts" mode="atomic-robo"/>
    </div>
    <hr />
    <div id="stress">
     <xsl:call-template name="atomic-robo-stress"/>
    </div>
    <div id="consequences">
     <xsl:choose>
      <xsl:when test="$useConditions='true'">
       <xsl:call-template name="conditions"/>
      </xsl:when>
      <xsl:otherwise>
       <xsl:call-template name="consequences"/>
      </xsl:otherwise>
     </xsl:choose>
    </div>
    <hr />
    <div id="notes">
    <xsl:apply-templates select="notes"/>
    </div>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>
