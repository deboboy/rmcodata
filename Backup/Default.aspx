<%@ Page Title="Microsoft Research OData Sampler" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebRole1._Default" %>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<!DOCTYPE html>
<html>
<head>
	<title>RMC OData Sampler</title>
    <style type="text/css">
    body {background:black; font-family:Segoe UI, Verdana, Arial; 
              color:white}
    h2 {font-size: 20px; padding-bottom:0px;}
    a:link {color:White; text-decoration:underline;}
    a:visited {color:White; text-decoration:none;}
    #header {font-size:medium; font-weight:bold; padding-bottom:10px;}
    #overview {background-color:White; color: Black; padding-left:10px;}
    #footer {background-color:Black; color:White; font-size:x-small;}
    </style>
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<div id="header">
Microsoft Research OData Sampler
</div>
<div id="overview">
   <h2>Filter by:<br/>
      videos that contain 'environmental'<br />
    <a href="http://odata.research.microsoft.com/odata.svc/Videos/?search=%22environmental%22"
         style="text-decoration:underline; color:Black;">
        OData Query
    </a>
   </h2>
</div>
<div id="RMCODataOutput" runat="server"></div>
<div id="footer">
<a href="http://mid.live.com/terms.aspx?mkt=en-us">Terms of Use</a> |
<a href="http://m.microsoft.com/en-us/about/trademarks/trademarks.mspx">Trademarks</a> |
<a href="http://m.microsoft.com/en-us/about/privacy/default.mspx">Privacy</a> <br />
&#0169; 2012 Microsoft Corporation 
</div>
</body>
</html>
</asp:Content>
