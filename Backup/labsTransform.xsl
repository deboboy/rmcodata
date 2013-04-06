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
    <div class="entry" style="background-color:White; color: Black; padding: 5px; font-family:Segoe UI, Verdana, Arial;">
      <div>
        <b>
          <xsl:value-of select="a:title"/>
        </b><br/>
        Updated: <xsl:value-of select="a:updated"/><br/>
        <a href="http://odata.research.microsoft.com/odata.svc/Projects({a:content/m:properties/d:Id})/Users/?expand=Users" style="color:Black;">Project Team</a>
        <br></br>
        <xsl:value-of select="a:summary" disable-output-escaping= "yes"/><br/>
        Tags: <xsl:value-of select="a:content/m:properties/d:Tags"/><br/>
        <a href="{a:content/m:properties/d:Url}" style="color:Black;">see more on research.microsoft.com</a><br/>
        
      </div>
      <!--<xsl:apply-templates select="a:link[@title='Authors']"/>-->
    </div>
  <p></p>
  </xsl:template>
</xsl:stylesheet>