<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
<xsl:output method="html"/>

<xsl:template match="fae">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
    <title><xsl:value-of select="charname"/></title>
    <style type="text/css">@import url(./fate.css);</style>
  </head>

  <body>
    <h1><xsl:value-of select="charname"/></h1>

    <table>
      <tr>
        <td width="70%"><xsl:apply-templates select="id"/></td>
        <td width="30%" id="fae">
          <span id="fate">Fate</span><br />
          <span id="accelerated">Accelerated</span>
          <table>
            <tr>
              <td width="50%">Refresh: <xsl:value-of select="refresh"/></td>
              <td width="50%">Current Fate Pts: <xsl:value-of select="current_fate_points"/></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

    <table>
      <tr>
        <td width="70%"><xsl:apply-templates select="aspects"/></td>
        <td width="30%"><xsl:apply-templates select="approaches"/></td>
      </tr>
    </table>

    <table>
      <tr>
        <td width="100%"><xsl:apply-templates select="stunts"/></td>
      </tr>
    </table>

    <table>
      <tr>
        <td width="35%"><xsl:apply-templates select="stress"/></td>
        <td width="65%"><xsl:apply-templates select="consequences"/></td>
      </tr>
    </table>

<xsl:apply-templates select="notes"/>

  </body>
</html>
</xsl:template>

</xsl:stylesheet>
