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
    <div>  
      <ul>   
        <xsl:apply-templates select="Page">
          <xsl:with-param name="depth" select="1"/>
        </xsl:apply-templates>
      </ul> 
    </div>
    </xsl:if>
    
  </xsl:template>
  
  <xsl:template match="//Page">
    <xsl:param name="depth"/>
    
    <li>
        <xsl:attribute name="class"><xsl:if test="(count(Page) > 0) and (@Hide_ChildrenInMenu != 'True')">dropdown</xsl:if> level-<xsl:value-of select="@AbsoluteLevel"/></xsl:attribute>
                         
        <a>
          <xsl:attribute name="class">
            <xsl:if test="@InPath='True'">inpath </xsl:if>
            <xsl:if test="position() = 1">firstitem </xsl:if>
            <xsl:if test="position() = count(//Page)">lastitem </xsl:if>
            <xsl:if test="@Active='True'">active</xsl:if>
           </xsl:attribute>        
                      
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="@Allowclick='True'">
                  <xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/>
                </xsl:when>
                <xsl:otherwise>#</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>   
          <xsl:value-of select="@MenuText" disable-output-escaping="yes"/>      
        </a>
           
        
      
      <xsl:if test="count(Page) and @Hide_ChildrenInMenu !='True'">
        <ul class="dropdown-menu M{@AbsoluteLevel} " role="menu">
          <xsl:for-each select="Page">
          
          <li class="level-2">
            <a>
              <xsl:attribute name="class">
                <xsl:if test="@InPath='True'">inpath </xsl:if>
                <xsl:if test="position() = 1">firstitem </xsl:if>
                <xsl:if test="position() = count(//Page)">lastitem </xsl:if>
                <xsl:if test="@Active='True'">activeitem</xsl:if></xsl:attribute>        
              <xsl:attribute name="href"><xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/></xsl:attribute>    
              <xsl:value-of select="@MenuText" disable-output-escaping="yes"/>
            </a>
              <xsl:if test="count(Page) and @Hide_ChildrenInMenu !='True'">
                  <ul>
                    <xsl:for-each select="Page">
                    <li class="level-3">
                      <a>
                        <xsl:attribute name="href"><xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/></xsl:attribute>
                        <xsl:value-of select="@MenuText" disable-output-escaping="yes"/>
                      </a>
                    </li>
                    </xsl:for-each>
                   </ul>
                 </xsl:if>
            </li> 
          
          </xsl:for-each>
        </ul>
      </xsl:if>
    </li>
    
  </xsl:template>
  
</xsl:stylesheet>