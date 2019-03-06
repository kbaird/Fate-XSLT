<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template name="skills-with-roles-header-row">
    <tr>
      <th colspan="5" class="sectionheader">Roles and Skills</th>
    </tr>
    <tr>
      <th>Roles:</th>
      <td id="list-of-roles" colspan="4">
        <ul>
          <xsl:for-each select="/character/skills/role">
            <li>
              <xsl:if test="@gonzo='true'">
                <xsl:attribute name="class">gonzo</xsl:attribute>
              </xsl:if>
              <xsl:value-of select="@name"/>
            </li>
          </xsl:for-each>
        </ul>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
