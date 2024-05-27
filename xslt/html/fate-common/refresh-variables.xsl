<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:variable name="baseRefresh">
    <xsl:choose>
      <xsl:when test="/character/refresh/@base">
        <xsl:value-of select="/character/refresh/@base"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="3"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="freeStunts">
    <xsl:choose>
      <xsl:when test="/character/refresh/@free-stunts">
        <xsl:value-of select="/character/refresh/@free-stunts"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="3"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="extraCost">
    <xsl:variable name="rawExtraCost">
      <xsl:choose>
        <xsl:when test="/character/extras/extra/@cost">
          <xsl:value-of select="sum(/character/extras/extra/@cost)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="0"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$rawExtraCost &lt; 0">
        <xsl:value-of select="0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$rawExtraCost"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="gadgetCost">
    <xsl:variable name="rawGadgetCost">
      <xsl:choose>
        <xsl:when test="/character/extras/gadget/@cost">
          <xsl:value-of select="sum(/character/extras/gadget/@cost)"/>
        </xsl:when>
        <xsl:when test="/character/extras/gadget">
          <xsl:value-of select="sum(/character/extras/gadget/benefits/benefit/@cost) +
                                count(/character/extras/gadget/function) -
                                count(/character/extras/gadget/flaws/flaw)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="0"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$rawGadgetCost &lt; 0">
        <xsl:value-of select="0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$rawGadgetCost"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="stuntCost">
    <xsl:choose>
      <xsl:when test="$freeStunts &gt; count(/character/stunts/stunt)">
        <xsl:value-of select="0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(/character/stunts/stunt) - $freeStunts"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="currentRefresh">
    <xsl:choose>
      <xsl:when test="/character/refresh/@current">
        <xsl:value-of select="/character/refresh/@current"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$baseRefresh - $stuntCost - $extraCost - $gadgetCost"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="currentFatePoints">
    <xsl:choose>
      <xsl:when test="/character/refresh/@current">
        <xsl:value-of select="/character/refresh/@current"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$currentRefresh"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

</xsl:stylesheet>
