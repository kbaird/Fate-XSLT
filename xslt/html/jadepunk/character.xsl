<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="character">
  <html>
   <xsl:call-template name="head">
    <xsl:with-param name="baseCSS">jadepunk</xsl:with-param>
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
       <span id="fate"><img src="./jadepunk.jpg"/></span>
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
      <td width="70%">
       <xsl:apply-templates select="aspects"/>
      </td>
      <td width="30%">
       <xsl:apply-templates select="professions"/>
      </td>
     </tr>
    </table>
    <hr />
    <table>
     <tr>
      <td width="100%">
       <xsl:apply-templates select="assets"/>
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
       <xsl:call-template name="consequences"/>
      </td>
     </tr>
    </table>
    <xsl:apply-templates select="notes"/>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>
