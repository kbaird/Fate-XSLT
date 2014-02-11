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
    <xsl:with-param name="additionalCSS">atomic-robo</xsl:with-param>
   </xsl:call-template>
   <body>
    <h1>
     <xsl:value-of select="id/charname"/>
    </h1>
    <table>
     <tr>
      <td width="70%">
       <xsl:apply-templates select="id"/>
      </td>
      <td width="30%" id="fate-logo">
       <span id="atomic-robo-logo">
        <img alt="Atomic Robo" src="robo_logo.gif"/>
       </span>
       <table>
        <tr>
         <xsl:call-template name="refresh"/>
         <xsl:call-template name="current-fate-points"/>
        </tr>
       </table>
      </td>
     </tr>
    </table>
    <hr />
    <table>
     <tr>
      <td width="40%">
       <xsl:apply-templates select="aspects"/>
      </td>
      <td width="60%">
       <xsl:apply-templates select="skills">
        <xsl:with-param name="useSkillModes">
         <xsl:value-of select="$useSkillModes"/>
        </xsl:with-param>
       </xsl:apply-templates>
      </td>
     </tr>
    </table>
    <hr />
    <table>
     <tr>
      <td width="100%">
       <xsl:apply-templates select="stunts"/>
      </td>
     </tr>
    </table>
    <hr />
    <table>
     <tr>
      <td width="35%">
       <xsl:call-template name="stress"/>
      </td>
      <td width="65%">
       <xsl:choose>
        <xsl:when test="$useConditions='true'">
         <xsl:call-template name="conditions"/>
        </xsl:when>
        <xsl:otherwise>
         <xsl:call-template name="consequences"/>
        </xsl:otherwise>
       </xsl:choose>
      </td>
     </tr>
    </table>
    <xsl:apply-templates select="notes"/>
    <xsl:call-template name="atomic-robo-copyright"/>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>
