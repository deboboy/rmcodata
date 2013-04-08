<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
                xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" 
                xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" 
                xmlns:a="http://www.w3.org/2005/Atom"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:output indent="no" method="html" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="a:feed">
    <xsl:apply-templates select="a:entry"/>
  </xsl:template>
  <xsl:template match="a:entry">
    <div class="entry" style="background-color: White; color: Black; border-style:solid; border-color: #7FBA00; padding: 5px; font-family:Segoe UI, Verdana, Arial;">
      <div>
        <b>
          <xsl:value-of select="a:title"/>
        </b><br/>
        <xsl:value-of select="a:author"/></br>
        <xsl:value-of select="substring(a:published, 1, 10)"/><br/>
        <xsl:value-of disable-output-escaping="yes" select="substring(a:summary, 1, 200)"/>...
        <br/>
        <xsl:if test="a:content/m:properties/d:FileName != ''">
          <a href="{a:content/m:properties/d:FileName}" style="color:Black; text-decoration: underline;">PDF</a>
          <br/>
        </xsl:if>
        <xsl:value-of disable-output-escaping="yes" select="a:content/m:properties/d:Citation"/><br/>
        see more at <a href="{a:content/m:properties/d:Url}" style="color:Black; text-decoration: underline;">research.microsoft.com"</a>
      </div>
      <!--<xsl:apply-templates select="a:link[@title='Authors']"/>-->
    </div>
    <p></p>
  </xsl:template>
</xsl:stylesheet>


