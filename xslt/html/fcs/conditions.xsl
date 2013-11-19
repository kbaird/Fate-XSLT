<?xml version="1.0" ?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 <xsl:output method="html"/>
 <xsl:template name="conditions">
  <table border="1" id="conditions">
   <tr>
    <th colspan="3" class="sectionheader">Conditions</th>
   </tr>
   <tr>
    <th class="condition-type">Fleeting</th>
    <th class="condition-type">Sticky</th>
    <th class="condition-type">Lasting</th>
   </tr>
   <tr>
    <td>
     <dl class="conditions">
      <xsl:call-template name="condition">
       <xsl:with-param name="label">Angry</xsl:with-param>
       <xsl:with-param name="severity">1</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="condition">
       <xsl:with-param name="label">Frightened</xsl:with-param>
       <xsl:with-param name="severity">1</xsl:with-param>
      </xsl:call-template>
     </dl>
     <p>Goes away when you get a chance to catch your breath and calm down.</p>
    </td>
    <td>
     <dl class="conditions">
      <xsl:call-template name="condition">
       <xsl:with-param name="label">Exhausted</xsl:with-param>
       <xsl:with-param name="severity">2</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="condition">
       <xsl:with-param name="label">Hungry</xsl:with-param>
       <xsl:with-param name="severity">2</xsl:with-param>
      </xsl:call-template>
     </dl>
     <p>Stays checked off until a specific event occurs (get sleep, eat food).</p>
    </td>
    <td>
     <dl class="conditions">
      <xsl:call-template name="condition">
       <xsl:with-param name="label">Injured</xsl:with-param>
       <xsl:with-param name="severity">4</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="condition">
       <xsl:with-param name="label">Broken</xsl:with-param>
       <xsl:with-param name="severity">4</xsl:with-param>
      </xsl:call-template>
     </dl>
     <p>Takes a recovery action to being removal. Second box may be checked only if the first isn't.</p>
    </td>
   </tr>
  </table>
 </xsl:template>
 <xsl:template name="condition">
  <xsl:param name="label"/>
  <xsl:param name="severity"/>
  <dt>
   <xsl:if test="$severity=4">
    <xsl:attribute name="class">severe</xsl:attribute>
   </xsl:if>
   <xsl:value-of select="$label"/>
  </dt>
  <dd class="box">
   <xsl:value-of select="$severity"/>
  </dd>
  <xsl:if test="$severity=4">
   <dd class="box additional">
    <xsl:value-of select="$severity"/>
   </dd>
  </xsl:if>
 </xsl:template>
</xsl:stylesheet>
