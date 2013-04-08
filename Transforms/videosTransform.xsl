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
  <xsl:variable name="id" select="a:content/m:properties/d:Id"/>
     <div class="entry" style="background-color: white; color: Black; border-style:solid; border-color: #FFB900; padding: 10px; font-family:Segoe UI, Verdana, Arial;">
      <div>
        <b><xsl:value-of select="a:title"/></b>
        <p></p>
        <xsl:variable name="path">
          <xsl:value-of select="concat('http://msrvideo.vo.msecnd.net/rmcvideos/',$id,'/dl/',$id,'.mp4')" />
        </xsl:variable>
	<xsl:variable name="FFpath">
	  <xsl:value-of select="concat('http//msrvideo.vo.msecnd.net/rmcvideos/',$id,'/$id/',$id,'.asf')" />
	</xsl:variable>
        <div id="videoContainer" style="position: relative; padding-top: 50%;">  
        <video controls="controls"  poster="{a:content/m:properties/d:Thumbnail}" 
               style="position: absolute; top: 0; left: 0; width: 100%; height: 100;">
          <source src="{$path}" type="video/mp4" />
          <a href="{$path}" alt="play video">
            <img src="{a:content/m:properties/d:Thumbnail}" />
          </a>
        </video>
	<br/>
	<object>
		<param value="false" name="autoStart">
		<param value="full" name="uimode">
		<param value="{$FFpath}" name="url">
		<param value="true" name="stretchtofit">
		<embed width="320" height="314" autostart="false" showcontrols="true" name="mediaPlayer" 
		pluginspage="http://microsoft.com/windows/mediaplayer/en/download/" 
		type="application/x-mplayer2" 
		src="{$FFpath}">
	  </object>
        </div>      
        <br/>
        <div>
        Duration: <xsl:variable name="hours" select="floor(number(a:content/m:properties/d:Duration) div 60 div 60)"/>
        <xsl:variable name="minutes" select="floor(number(a:content/m:properties/d:Duration) div 60) - (number($hours)*60)"/>
        <xsl:variable name="seconds" select="floor(a:content/m:properties/d:Duration) - (((number($hours)*60)+number($minutes))*60)"/>
        <xsl:value-of select="format-number($hours,'00')"/>:<xsl:value-of select="format-number($minutes,'00')"/>:<xsl:value-of select="format-number($seconds,'00')"/>
        </div>
        Recorded: <xsl:value-of select="substring(a:content/m:properties/d:DateRecorded, 1, 10)" disable-output-escaping= "yes" />
        <br/>
        Speaker: 
        Host: <xsl:value-of select="a:content/m:properties/d:MicrosoftHost"/><br/>
        Views: <xsl:value-of select="a:content/m:properties/d:Views"/><br/>
        see more at <a href="{a:content/m:properties/d:Url}" style="color:Black; text-decoration: underline;">research.microsoft.com</a><br/>
      </div>
    </div>
    <p></p>
  </xsl:template>
</xsl:stylesheet>
