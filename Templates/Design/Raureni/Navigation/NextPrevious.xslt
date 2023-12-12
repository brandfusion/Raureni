<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

  <!--
  Description: ul/li based navigation. No features from admin implemented.
  Recommended settings:
  Fold out: True or False
  Upper menu: Dynamic or Static
  First level: > 0
  Last level: >= First level
  -->

  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"  encoding="utf-8" />
  <xsl:param name="html-content-type" />

  <xsl:template match="/NavigationTree">
    
  <xsl:if test="string-length(//Page[@Active='True']/preceding-sibling::* [1]/@MenuText)&gt;1">
    <a href="{//Page[@Active='True']/preceding-sibling::* [1]/@FriendlyHref}" title="{//Page[@Active='True']/preceding-sibling::* [1]/@MenuText}" class="prev-article pull-left">Articolul anterior</a>
  </xsl:if>

  <xsl:if test="string-length(//Page[@Active='True']/following-sibling::* [1]/@MenuText)&gt;1">
    <a href="{//Page[@Active='True']/following-sibling::* [1]/@FriendlyHref}" title="{//Page[@Active='True']/following-sibling::* [1]/@MenuText}" class="next-article pull-right">Articolul urmator</a>
  </xsl:if>
  
  </xsl:template>
</xsl:stylesheet>
