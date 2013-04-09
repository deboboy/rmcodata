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
<div class="entry" style="padding: 10px; font-family:Segoe UI, Verdana, Arial;">
<div style="float:left;margin-right: 6px;">
<a href="{a:content/m:properties/d:Url}" style="text-decoration:none; color:Black;">
<img src="{a:content/m:properties/d:Thumbnail}"  style="width:114px; height:86px;"/>
</a>
</div>
<br></br>
<div style="float:left;margin-right: 6px;vertical-align:text-top;">
TODO: add FB like button, comment box
</div>
</div>
</xsl:template>
</xsl:stylesheet>
