<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns:a="http://www.w3.org/2005/Atom">

	<xsl:output indent="no" method="html" omit-xml-declaration="yes"/>


	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="a:feed">
		<h2><xsl:value-of select="a:title"/></h2>
    http://odata.research.microsoft.com/odata.svc/Videos/?search=%22university%20of%20washington%22<br></br>
    [Updated <xsl:value-of select="a:updated"/>]
    <p></p>
		<xsl:apply-templates select="a:entry"/>
 	</xsl:template>

	<xsl:template match="a:entry">
		<div class="entry">
			<div>
        <b>
          <xsl:value-of select="a:title"/></b><br></br>
				url: <xsl:value-of select="a:content/m:properties/d:Url" disable-output-escaping="yes"/><br></br>
        seconds: <xsl:value-of select="a:content/m:properties/d:Duration" disable-output-escaping="yes"/><br></br>
        date recorded: <xsl:value-of select="a:content/m:properties/d:DateRecorded" disable-output-escaping= "yes"/>
        <p></p>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>