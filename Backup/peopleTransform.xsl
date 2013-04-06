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
     <div class="entry" style="background-color: white; color: Black; padding: 10px; font-family:Segoe UI, Verdana, Arial;">
      <div>
        <b><xsl:value-of select="a:title"/></b>
        <p></p>
        <img src="{a:content/m:properties/d:Picture}" style="width:72px; height:72px;" />
        <br/>
        <xsl:value-of select="a:content/m:properties/d:Title"/><br></br>
        Research areas: <xsl:value-of select="a:content/m:properties/d:ResearchAreas"/><br/>
        TODO: add links to RMC mobile search for each research area string
        <a href="{concat('http://academic.research.microsoft.com/Author/', ./a:content/m:properties/d:MasAuthorID)}">Academic Search profile</a>
      </div>
    </div>
    <p></p>
  </xsl:template>
 </xsl:stylesheet>