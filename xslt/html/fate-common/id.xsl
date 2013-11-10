<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="id">

<table border="1">
  <tr>
    <th colspan="2" class="sectionheader">ID</th>
  </tr>
  <tr>
    <td>
      <fieldset>
    <xsl:choose>
      <xsl:when test="charname/@nickname">
        <legend>Name (<q><xsl:value-of select="charname/@nickname"/></q>)</legend>
      </xsl:when>
      <xsl:otherwise>
        <legend>Name</legend>
      </xsl:otherwise>
    </xsl:choose>
        <xsl:value-of select="charname"/>
      </fieldset>
    </td>
  </tr>
  <tr>
    <td>
      <fieldset>
        <legend>Description</legend>
        <xsl:value-of select="description"/>
      </fieldset>
    </td>
  </tr>
</table>

</xsl:template>

</xsl:stylesheet>
