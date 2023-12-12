<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="urn:my-scripts">
	<xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="utf-8" />
	<xsl:param name="html-content-type" />
<msxsl:script language="C#" implements-prefix="user">
    <msxsl:assembly name="Dynamicweb" />
    <![CDATA[
public string GetItemType(string id) {
  var pageId = 0;
  if (int.TryParse(id, out pageId)) {
    var pageView = Dynamicweb.Frontend.PageView.Current();
    if (pageView != null && pageView.PageCollection.ContainsKey(pageId)) {
      var page = pageView.PageCollection[pageId] as Dynamicweb.Frontend.Page;
      return page.Values["pageitemtype"] as string;
    }
  }
  return string.Empty;
}
]]>
  </msxsl:script>
	<xsl:template match="/NavigationTree">                
      <xsl:apply-templates select="Page">
          <xsl:with-param name="depth" select="1"/>
      </xsl:apply-templates>      
	</xsl:template>

	<xsl:variable name="imageWidth" select="225"/>
	<xsl:variable name="imageHeight" select="150"/>

  <xsl:template match="//Page">
		<xsl:param name="depth"/>
		<xsl:variable name="eComPageShow" select="//NavigationTree/Settings/LayoutNavigationSettings/@eComPageShow = 'true'"/>
    	<xsl:variable name="itemType" select="user:GetItemType(@ID)"/>
		<xsl:choose>
			<xsl:when test="string($itemType)='Catalog_Section'">
						<!--<xsl:for-each select="Page">-->
							<xsl:variable name="dropdown-target">
								<xsl:text>dropdown-</xsl:text>
								<xsl:number level="any"/>
							</xsl:variable>
							<li>
								<xsl:attribute name="class">
									<xsl:if test="@Active='True' or @InPath='True'">active </xsl:if>
									<!--<xsl:if test="count(child::Page) &gt;0">drop-list-li-<xsl:value-of select="position()"/></xsl:if>-->
								</xsl:attribute>
								<a>
									<!--<xsl:if test="Page">
										<xsl:attribute name="class">dropdown-toggle</xsl:attribute>
										<xsl:attribute name="data-toggle">dropdown</xsl:attribute>
										<xsl:attribute name="data-target">#<xsl:value-of select="$dropdown-target"/></xsl:attribute>
									</xsl:if>  -->         
                                      <xsl:attribute name="href">
                                        <xsl:choose>
                                          <xsl:when test="@Allowclick='True'">
                                          	<xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/>
                                          </xsl:when>
                                          <xsl:otherwise>#</xsl:otherwise>
                                        </xsl:choose>
                                      </xsl:attribute>
									<xsl:value-of select="@MenuText" disable-output-escaping="yes"/> <xsl:if test="count(child::Page) &gt;0"><i class="icon-caret-down"><text> </text></i></xsl:if>
								</a>
								<xsl:if test="Page">
									<div>
                                      <ul>
										<xsl:for-each select="Page">
											<li>
												<a class="mainCategory">
													<xsl:attribute name="href">
														<xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/>
													</xsl:attribute>
													<!--<xsl:if test="string-length(normalize-space(@Page_Image)) > 1">
														<img class="nav-item-img" width="{$imageWidth}" height="{$imageHeight}" alt="">
															<xsl:attribute name="src"><xsl:value-of select="@Page_Image" /></xsl:attribute>
														</img>
													</xsl:if>-->
													<xsl:value-of select="@MenuText" disable-output-escaping="yes"/>
                                                    <!--<p class="categoryDescrption"><xsl:value-of select="@Menu_Subtitle" disable-output-escaping="yes"/></p>-->
												</a>
                                          </li>
										</xsl:for-each>
                                      </ul>
									</div>
								</xsl:if>
							</li>
						<!--</xsl:for-each>-->
			</xsl:when>
         
			<xsl:otherwise>
				<xsl:variable name="dropdown-target">
					<xsl:text>dropdown-</xsl:text>
					<xsl:number level="any"/>
				</xsl:variable>
				<li>
					<xsl:attribute name="class">
						<xsl:if test="@Active='True' or @InPath='True'">active </xsl:if>
						<xsl:if test="count(child::Page) &gt;0">dropdown</xsl:if>
					</xsl:attribute>
					<a>
						<xsl:if test="Page">
							<xsl:attribute name="class">dropdown-toggle</xsl:attribute>
							<xsl:attribute name="data-toggle">dropdown</xsl:attribute>
							<xsl:attribute name="data-target">#<xsl:value-of select="$dropdown-target"/></xsl:attribute>
						</xsl:if>
						<xsl:attribute name="data-mobile-nav">
                           <xsl:if test="@Allowclick='False'">noclick</xsl:if>
                        </xsl:attribute>    
                        <xsl:if test="@Allowclick='True'">
                            <xsl:attribute name="href"><xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/></xsl:attribute> 
                        </xsl:if>
                        <xsl:if test="count(child::Page) &gt;0"><xsl:text>+ </xsl:text></xsl:if>
						<xsl:value-of select="@MenuText" disable-output-escaping="yes"/>
					</a>
					<xsl:if test="Page">
                      <xsl:choose>
                        <xsl:when test="Page[ $itemType='Catalog_Section']">
                        </xsl:when>
                      <xsl:otherwise>
						<ul class="dropdown-menu" id="{$dropdown-target}">
							<xsl:for-each select="Page">
								<li>
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="@FriendlyHref" disable-output-escaping="yes"/>
										</xsl:attribute>
										<xsl:value-of select="@MenuText" disable-output-escaping="yes"/>
                                      <xsl:value-of select="$itemType" disable-output-escaping="yes"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
                        </xsl:otherwise>
                      </xsl:choose>
					</xsl:if>
				</li>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
