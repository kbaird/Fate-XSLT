<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>

 <xsl:template name="skills-without-modes">
  <tr><th colspan="6" class="sectionheader">Skills</th></tr>
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
 </xsl:template>

</xsl:stylesheet>
