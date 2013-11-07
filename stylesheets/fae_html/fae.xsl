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
<style type="text/css">
@import url(./fate.css);
.alt { background-color:#ddd; color:#000; }
.altc { background-color:#ddd; color:#000; text-align: center; }
.approach_name { text-transform: uppercase; font-weight: bolder }
.center { text-align: center; }
.full { width:100%; }
.wide { width:20%; }
.place { border:0; padding:1em; text-align:center; width:100%; }
.section { padding:0.2em; text-align:center; }
cite {  font-style: italic; text-decoration: underline; }
em { font-style: italic; }
table { border:2px; padding: 0.3em; text-align:center; width:100%; }
th { border:1px; text-align:center; }
#fate { }
#accelerated { }
</style>
</head>
<body>
<h1 style="display: none;"><xsl:value-of select="charname"/></h1>

<table>
<tr><td width="60%">
<xsl:apply-templates select="id"/>
</td>
<td width="40%" id="fae">
<span id="fate">FATE</span><br />
<span id="accelerated">Accelerated</span>
<table>
<tr><td width="50%">
Refresh:
<xsl:value-of select="refresh"/>
</td>
<td width="50%">
Current Fate Pts:
<xsl:value-of select="current_fate_points"/>
</td>
</tr>
</table>
</td>
</tr>
</table>

<hr/>

<table>
<tr><td width="50%">
<xsl:apply-templates select="aspects"/>
</td>
<td width="50%">
<xsl:apply-templates select="approaches"/>
</td>
</tr>
</table>

<hr/>

<table>
<tr>
<td width="100%">
<xsl:apply-templates select="stunts"/>
</td>
</tr>
</table>

<hr/>

<table>
<tr><td width="35%">
<xsl:apply-templates select="stress"/>
</td>
<td width="65%">
<xsl:apply-templates select="consequences"/>
</td>
</tr>
</table>

<xsl:apply-templates select="notes"/>

</body>
</html>
</xsl:template>

</xsl:stylesheet>
