<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-modes-row">
    <xsl:param name="skillRating"/>
    <xsl:variable name="maxModeRating">3</xsl:variable>
    <xsl:variable name="medModeRating">2</xsl:variable>
    <xsl:variable name="minModeRating">1</xsl:variable>
    <tr>
      <th class="mode-rating">+<xsl:value-of select="$skillRating"/></th>
      <td>
        <xsl:choose>
          <xsl:when test="$skillRating &lt; $maxModeRating">
            <xsl:attribute name="class">unused</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="skill-mode-tds">
              <xsl:with-param name="modeRating" select="$maxModeRating"/>
              <xsl:with-param name="skillRating" select="$skillRating"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="$skillRating &lt; $medModeRating">
            <xsl:attribute name="class">unused</xsl:attribute>
          </xsl:when>
          <xsl:when test="$skillRating &gt; ($medModeRating + 2)">
            <xsl:attribute name="class">unused</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="skill-mode-tds">
              <xsl:with-param name="modeRating" select="$medModeRating"/>
              <xsl:with-param name="skillRating" select="$skillRating"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="$skillRating &gt; ($minModeRating + 2)">
            <xsl:attribute name="class">unused</xsl:attribute>
              <xsl:if test="$skillRating &gt; ($minModeRating + 3)">
        <ul id="skill-explanation">
          <li class="specialized">specialized</li>
          <li class="focused">focused</li>
          <li>trained</li>
        </ul>
              </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="skill-mode-tds">
              <xsl:with-param name="modeRating" select="$minModeRating"/>
              <xsl:with-param name="skillRating" select="$skillRating"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
