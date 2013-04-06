using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml;
using System.IO;
using System.Xml.Xsl;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace WebRole1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var wc = new WebClient();
            var result = wc.DownloadString(new Uri("http://odata.research.microsoft.com/odata.svc/Videos/?search=%22Environmental%22&$top=10", UriKind.Absolute));

            using (var sr = new StringReader(result))
            {
                using (var reader = XmlReader.Create(sr))
                {
                    var transform = new XslCompiledTransform();

                    //LocalResource LocalStorage1Storage = RoleEnvironment.GetLocalResource("LocalStorage1");
                    //string s = System.IO.File.ReadAllText(LocalStorage1Storage.RootPath + "odTransform.xsl");
                    
                    //string s = File.ReadAllText(Server.MapPath(odtransform.xsl));
                    //var xsl = XmlReader.Create(new StringReader(s));
                    transform.Load("http://rmc.cloudapp.net/odtransform.xsl");

                    var ms = new MemoryStream();
                    var sw = new StreamWriter(ms);
                    var writerSettings = new XmlWriterSettings();
                    writerSettings.ConformanceLevel = ConformanceLevel.Auto;
                    var writer = XmlWriter.Create(sw, writerSettings);
                    transform.Transform(reader, writer);
                    writer.Close();
                    var sreader = new StreamReader(ms);
                    ms.Position = 0;

                    var html = sreader.ReadToEnd();
                    sreader.Close();
                    RMCODataOutput.InnerHtml = html;
                }
            }
        }
    }
}
