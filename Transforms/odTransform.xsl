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
        <!--<video poster="{a:content/m:properties/d:Thumbnail}">
          <source src="{a:content/m:properties/d:Url}" type="video/mp4" />
        </video>-->
        <a href="{a:content/m:properties/d:Url}" style="text-decoration:none; color:Black;">
          <img src="{a:content/m:properties/d:Thumbnail}"  style="width:250px; height:188px;"/>
        </a>
        <br></br>
        <div>
        Duration: <xsl:variable name="hours" select="floor(number(a:content/m:properties/d:Duration) div 60 div 60)"/>
        <xsl:variable name="minutes" select="floor(number(a:content/m:properties/d:Duration) div 60) - (number($hours)*60)"/>
        <xsl:variable name="seconds" select="floor(a:content/m:properties/d:Duration) - (((number($hours)*60)+number($minutes))*60)"/>
        <xsl:value-of select="format-number($hours,'00')"/>:<xsl:value-of select="format-number($minutes,'00')"/>:<xsl:value-of select="format-number($seconds,'00')"/>
        </div>
        Recorded: <xsl:value-of select="a:content/m:properties/d:DateRecorded" disable-output-escaping= "yes"/>
        <br></br>
        Views: <xsl:value-of select="a:content/m:properties/d:Views"/>
        <xsl:apply-templates select="a:link[@title='Speakers']"/><br></br>
      </div>
    </div>
    <p></p>
  </xsl:template>
  
  <xsl:template match="a:link">
    <p></p>
    <a href="http://odata.research.microsoft.com/odata.svc/{@href}">Speakers</a>
  </xsl:template>
</xsl:stylesheet>