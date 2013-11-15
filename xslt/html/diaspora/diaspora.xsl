<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="diaspora">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
    <title><xsl:value-of select="id/charname"/></title>
    <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"/>
    <style type="text/css">
      @import url(./css/fate.css);
      @import url(./css/fcs.css);
      @import url(./css/diaspora.css);
    <xsl:if test="$useConditions='true'">
      @import url(./css/conditions.css);
    </xsl:if>
    </style>
  </head>

  <body>
    <h1><xsl:value-of select="id/charname"/></h1>

    <table>
      <tr>
        <td width="70%"><xsl:apply-templates select="id"/></td>
        <td width="30%" id="fate-logo">
          <span id="fate">Fate</span><br />
          <span id="fate-subtitle">Core System</span>
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
        <td rowspan="2" width="40%"><xsl:apply-templates select="aspects"/></td>
        <td width="60%">
          <xsl:apply-templates select="skills">
            <xsl:with-param name="rootElement">diaspora</xsl:with-param>
          </xsl:apply-templates>
        </td>
      </tr>
      <tr>
        <td width="60%"><xsl:apply-templates select="stunts"/></td>
      </tr>
    </table>

    <hr />

    <table>
      <tr>
        <td width="50%">
          <xsl:call-template name="diaspora_stress"/>
        </td>
        <td width="50%">
          <xsl:choose>
            <xsl:when test="$useConditions='true'">
              <xsl:call-template name="conditions"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="consequences"/>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
    </table>

<xsl:apply-templates select="gear"/>
<xsl:apply-templates select="notes"/>
<xsl:call-template name="diaspora_copyright"/>

  </body>
</html>
</xsl:template>

</xsl:stylesheet>
