old	new	
...	...	@@ -1,23 +0,0 @@
1		-<?xml version="1.0" encoding="utf-8" ?>
2		-<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns:a="http://www.w3.org/2005/Atom">
3		-<xsl:output indent="no" method="html" omit-xml-declaration="yes"/>
4		-<xsl:template match="/">
5		-	<xsl:apply-templates/>
6		-</xsl:template>
7		-<xsl:template match="a:feed">
8		-	<xsl:apply-templates select="a:entry"/>
9		-</xsl:template>
10		-<xsl:template match="a:entry">
11		-  <div class="entry" style="padding: 10px; font-family:Segoe UI, Verdana, Arial;">
12		-      <div style="float:left;margin-right: 6px;">
13		-            <a href="{a:content/m:properties/d:Url}" style="text-decoration:none; color:Black;">
14		-              <img src="{a:content/m:properties/d:Thumbnail}"  style="width:114px; height:86px;"/>
15		-            </a>
16		-      </div>
17		-      <br></br>
18		-      <div style="float:left;margin-right: 6px;vertical-align:text-top;">
19		-        TODO: add FB like button, comment box
20		-      </div>
21		-  </div>
22		-  </xsl:template>
23		-</xsl:stylesheet>
24	1	\ No newline at end of file
