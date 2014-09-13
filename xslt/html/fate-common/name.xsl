<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="name">
  <fieldset id="name">
   <legend class="label">
    <span>Name</span>
   </legend>
   <xsl:value-of select="charname"/>
   <xsl:if test="charname/@nickname">
    <xsl:text> (</xsl:text>
     <q><xsl:value-of select="charname/@nickname"/></q>
    <xsl:text>)</xsl:text>
   </xsl:if>
  </fieldset>
 </xsl:template>
</xsl:stylesheet>
