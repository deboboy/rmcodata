<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns:a="http://www.w3.org/2005/Atom">
<xsl:output indent="no" method="html" omit-xml-declaration="yes"/>
<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>
<xsl:template match="a:feed">
	<xsl:apply-templates select="a:entry"/>
</xsl:template>
<xsl:template match="a:entry">
  <xsl:variable name="MAS" select="a:content/m:properties/d:MasAuthorId"  />
  <xsl:variable name="PersonName" select="a:content/m:properties/d:Name" />
     <div class="entry" style="background-color: white; color: Black; border-style:solid; border-color: #EB3C00; padding: 10px; font-family:Segoe UI, Verdana, Arial; ">
      <div class="odata">
        <b><xsl:value-of select="a:title"/></b>
        <p></p>
        <img src="{a:content/m:properties/d:Picture}" style="width:144px; height:144px; filter: grayscale(100%);" onerror="this.src='http://research.microsoft.com/apps/dp/i/no_port.gif';"/>
        <br/>
        <xsl:value-of select="a:content/m:properties/d:Title"/><p/>
        <xsl:value-of select="a:content/m:properties/d:ResearchAreas"/><br/>
       <!--<a href="{concat('http://academic.research.microsoft.com/Author/', $MAS)}">Academic Search profile</a><br/>-->
        See more at <a href="{concat('http://research.microsoft.com/apps/mobile/search.aspx?q=%22', $PersonName,'%22')}" style="color:Black; text-decoration: underline;">research.microsoft.com</a><br/>
       <!--TODO: add graph of the person's site stats or MAS widget--> 
      </div>
    </div>
    <p></p>
  </xsl:template>
 </xsl:stylesheet>
