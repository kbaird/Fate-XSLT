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
              <td>
                <dl>
                  <dt>Refresh:</dt>
                  <dd class="box"><xsl:value-of select="refresh"/></dd>
                </dl>
              </td>
              <td>
                <dl>
                  <dt>Current <acronym title="Fate Points">FP</acronym>:</dt>
                  <dd class="box"><xsl:value-of select="current_fate_points"/></dd>
                </dl>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

    <hr />

    <table>
      <tr>
        <td width="70%"><xsl:apply-templates select="aspects"/></td>
        <td width="30%"><xsl:apply-templates select="approaches"/></td>
      </tr>
    </table>

    <hr />

    <table>
      <tr>
        <td width="100%"><xsl:apply-templates select="stunts"/></td>
      </tr>
    </table>

    <hr />

    <table>
      <tr>
        <td width="35%">
          <xsl:call-template name="stress"/>
        </td>
        <td width="65%">
          <xsl:call-template name="consequences"/>
        </td>
      </tr>
    </table>

<xsl:apply-templates select="notes"/>
<xsl:call-template name="copyright"/>

  </body>
</html>
</xsl:template>

</xsl:stylesheet>
