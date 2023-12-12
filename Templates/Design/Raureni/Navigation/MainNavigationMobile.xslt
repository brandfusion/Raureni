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
    
    <xsl:if test="count(//Page) > 0">    
      <ul>   
        <xsl:apply-templates select="Page">
          <xsl:with-param name="depth" select="1"/>
        </xsl:apply-templates>
      </ul>            
    </xsl:if>
    
  </xsl:template>
  
  <xsl:template match="//Page">
    <xsl:param name="depth"/>
    <xsl:if test="position() &lt; 11">
    <li>
      
      <a>
        <xsl:attribute name="class">
          <xsl:if test="@InPath='True'">inpath </xsl:if>
          <xsl:if test="position() = 1">firstitem </xsl:if>
          <xsl:if test="position() = count(//Page)">lastitem </xsl:if>
          <xsl:if test="@Active='True'">activeitem</xsl:if>
        </xsl:attribute>        
        <xsl:attribute name="href"><xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/></xsl:attribute>       
        <xsl:value-of select="@MenuText" disable-output-escaping="yes"/>  
        <xsl:if test="@ChildCount > 0">
           <span class="pull-right"><i class="fa fa-caret-right"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></i></span>
        </xsl:if>
      </a>
      
      <a class="fly-mask"><xsl:text disable-output-escaping="yes"><![CDATA[ ]]></xsl:text></a>
      <xsl:if test="count(Page)">
        <ul class="M{@AbsoluteLevel}" role="menu">
          <xsl:apply-templates select="Page">
            <xsl:with-param name="depth" select="$depth+1"/>
            <xsl:sort select="@Sort" order="descending" data-type="number" />
          </xsl:apply-templates>          
        </ul>
      </xsl:if>
    </li>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>