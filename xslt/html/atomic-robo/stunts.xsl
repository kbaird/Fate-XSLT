<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template match="stunts">
  <table>
   <xsl:call-template name="stunts-header">
    <xsl:with-param name="label">Stunts</xsl:with-param>
   </xsl:call-template>
   <xsl:apply-templates select="stunt"/>
  </table>
 </xsl:template>
 <xsl:template match="stunts" mode="atomic-robo">
  <table>
   <xsl:call-template name="stunts-header">
    <xsl:with-param name="label">Stunts &amp; Mega-Stunts</xsl:with-param>
   </xsl:call-template>
   <xsl:apply-templates select="stunt"/>
   <xsl:apply-templates select="hardware"/>
  </table>
 </xsl:template>

 <xsl:template match="stunt">
  <tr>
   <td>
    <fieldset class="stunt">
     <legend>
      <span><xsl:value-of select="@name"/></span>
     </legend>
     <xsl:value-of select="."/>
    </fieldset>
   </td>
  </tr>
 </xsl:template>

 <xsl:template match="hardware">
  <tr>
   <td>
    <fieldset class="stunt">
     <legend>
      <span><xsl:value-of select="@name"/></span>
     </legend>
     <dl class="hardware">
     <xsl:if test="@function">
      <dt id="function">Function:</dt>
      <dd><xsl:value-of select="@function"/></dd>
     </xsl:if>
     <xsl:if test="@flaw">
      <dt id="flaw">Flaw:</dt>
      <dd><xsl:value-of select="@flaw"/></dd>
     </xsl:if>
     <xsl:apply-templates select="benefits"/>
     </dl>
    </fieldset>
   </td>
  </tr>
 </xsl:template>

 <xsl:template match="benefits">
  <xsl:apply-templates select="benefit"/>
 </xsl:template>

 <xsl:template match="benefit">
  <dt>
   <xsl:value-of select="@name"/>
   <xsl:text> [</xsl:text>
   <xsl:value-of select="@cost"/>
   <xsl:text>]: </xsl:text>
  </dt>
  <dd><xsl:value-of select="."/></dd>
 </xsl:template>

 <xsl:template name="stunts-header">
  <xsl:param name="label"/>
  <tr>
   <th colspan="2" class="sectionheader">
    <xsl:value-of select="$label"/>
   </th>
  </tr>
 </xsl:template>
</xsl:stylesheet>
