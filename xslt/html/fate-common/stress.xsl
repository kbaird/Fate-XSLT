<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="base-stress-boxes">
  <xsl:param name="current"/>
  <xsl:param name="max"/>
  <td><xsl:value-of select="$current"/></td>
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
 <xsl:template name="generic-stress">
  <xsl:param name="baseCount"/>
  <xsl:param name="maxCount" select="$baseCount + 2"/>
  <xsl:param name="headerName"/>
  <xsl:param name="skillName"/>
  <tr>
   <th class="sectionheader">
    <xsl:attribute name="colspan">
     <xsl:value-of select="$maxCount"/>
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
   <xsl:call-template name="more-stress-boxes">
    <xsl:with-param name="baseCount">
     <xsl:value-of select="$baseCount"/>
    </xsl:with-param>
    <xsl:with-param name="maxCount">
     <xsl:value-of select="$maxCount"/>
    </xsl:with-param>
    <xsl:with-param name="skillRating">
     <!--
     <xsl:choose>
      <xsl:when test="$useSkillModes='true'">
       <xsl:call-template name="skill-rating-by-name">
        <xsl:with-param name="skillName">
         <xsl:value-of select="$skillName"/>
        </xsl:with-param>
       </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
     -->
       <xsl:value-of select="/character/skills/skill[@name=$skillName]/@rating"/>
     <!--
      </xsl:otherwise>
     </xsl:choose>
     -->
    </xsl:with-param>
   </xsl:call-template>
  </tr>
 </xsl:template>
 <xsl:template name="more-stress-boxes">
  <xsl:param name="baseCount"/>
  <xsl:param name="maxCount"/>
  <xsl:param name="skillRating"/>
  <xsl:if test="$baseCount &lt; $maxCount">
   <xsl:if test="$skillRating &gt; 0">
    <td><xsl:value-of select="$baseCount + 1"/></td>
   </xsl:if>
  </xsl:if>
  <xsl:if test="$baseCount + 1 &lt; $maxCount">
   <xsl:if test="$skillRating &gt; 2">
    <td><xsl:value-of select="$baseCount + 2"/></td>
   </xsl:if>
  </xsl:if>
  <xsl:if test="$baseCount + 2 &lt; $maxCount">
   <xsl:if test="$skillRating &gt; 4">
    <td><xsl:value-of select="$baseCount + 3"/></td>
   </xsl:if>
  </xsl:if>
 </xsl:template>
</xsl:stylesheet>
