<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="character">
  <html>
   <xsl:call-template name="head">
    <xsl:with-param name="baseCSS">fcs</xsl:with-param>
    <xsl:with-param name="additionalCSS">diaspora</xsl:with-param>
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
       <span id="diaspora-logo">Diaspora</span>
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
      <td rowspan="2" width="40%">
       <xsl:apply-templates select="aspects"/>
      </td>
      <td width="60%">
       <xsl:apply-templates select="skills">
        <xsl:with-param name="rootElement">diaspora</xsl:with-param>
       </xsl:apply-templates>
      </td>
     </tr>
     <tr>
      <td width="60%">
       <xsl:apply-templates select="stunts"/>
      </td>
     </tr>
    </table>
    <hr />
    <table>
     <tr>
      <td width="50%">
       <xsl:call-template name="diaspora-stress"/>
      </td>
      <td width="50%">
       <xsl:call-template name="consequences"/>
      </td>
     </tr>
    </table>
    <xsl:apply-templates select="gear"/>
    <xsl:apply-templates select="notes"/>
    <xsl:call-template name="diaspora-copyright"/>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>
