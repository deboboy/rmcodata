<%@ Page Language="C#" %>

<script runat="server">
    void Page_Load(object sender, EventArgs args)
    {
        // http://odata.research.microsoft.com/odata.svc/Videos/?search=%22Environmental%22&$top=10
        Response.ContentType = "text/xml";
        var wc = new System.Net.WebClient();
        var xml = wc.DownloadString("http://odata.research.microsoft.com/odata.svc/Videos/?search=%22Environmental%22&$top=10");
        var start = xml.IndexOf("<feed");
        Response.Write(xml.Substring(0, start) + "<?xml-stylesheet type=\"text/xsl\" href=\"odTransform.xsl\" ?>" + xml.Substring(start));
    }

</script>
