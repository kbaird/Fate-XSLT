<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="base-stress-boxes">
  <xsl:param name="current"/>
  <xsl:param name="max"/>
  <td>
   <xsl:value-of select="$current"/>
  </td>
  <xsl:if test="$current &lt; $max">
   <xsl:call-template name="base-stress-boxes">
    <xsl:with-param name="current">
     <xsl:value-of select="$current + 1"/>
    </xsl:with-param>
    <xsl:with-param name="max">
     <xsl:value-of select="$max"/>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>
 <xsl:template name="pre-core-stress">
  <xsl:param name="baseCount"/>
  <xsl:param name="colSpan"/>
  <xsl:param name="headerName"/>
  <xsl:param name="skillName"/>
  <tr>
   <th class="sectionheader">
    <xsl:attribute name="colspan">
     <xsl:value-of select="$colSpan"/>
    </xsl:attribute>
    <xsl:value-of select="$headerName"/>
   </th>
  </tr>
  <tr>
   <xsl:call-template name="base-stress-boxes">
    <xsl:with-param name="current">1</xsl:with-param>
    <xsl:with-param name="max">
     <xsl:value-of select="$baseCount"/>
    </xsl:with-param>
   </xsl:call-template>
   <xsl:if test="/character/skills/skill[@name=$skillName]/@rating &gt; 0">
    <td>
     <xsl:value-of select="$baseCount + 1"/>
    </td>
   </xsl:if>
   <xsl:if test="/character/skills/skill[@name=$skillName]/@rating &gt; 2">
    <td>
     <xsl:value-of select="$baseCount + 2"/>
    </td>
   </xsl:if>
   <xsl:if test="/character/skills/skill[@name=$skillName]/@rating &gt; 4">
    <td>
     <xsl:value-of select="$colSpan + 3"/>
    </td>
   </xsl:if>
  </tr>
 </xsl:template>
</xsl:stylesheet>
