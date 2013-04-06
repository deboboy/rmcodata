<%@ WebHandler Language="C#" Class="DataProxy" %>

using System;
using System.Web;
using System.Threading;
using System.IO;
using System.Xml;
using System.Xml.Xsl;

public class DataProxy : IHttpAsyncHandler
{

	public bool IsReusable { get { return false; } }

	public DataProxy() { }

	public IAsyncResult BeginProcessRequest(HttpContext context, AsyncCallback cb, object extraData)
	{
		var async = new AsyncOperation(cb, context, extraData);
		async.StartAsyncWork();
		return async;
	}

	public void EndProcessRequest(IAsyncResult result) { }

	public void ProcessRequest(HttpContext context)
	{
		throw new NotImplementedException();
	}
}

public class AsyncOperation : IAsyncResult
{
	private bool completed;
	private object state;
	private AsyncCallback callback;
	private HttpContext context;

	public object AsyncState { get { return this.state; } }
	public WaitHandle AsyncWaitHandle { get { return null; } }
	public bool CompletedSynchronously { get { return false; } }
	public bool IsCompleted { get { return this.completed; } }

	public AsyncOperation(AsyncCallback callback, HttpContext context, object state)
	{
		this.callback = callback;
		this.context = context;
		this.state = state;
		this.completed = false;
	}

	//public void StartAsyncWork() { ThreadPool.QueueUserWorkItem(new WaitCallback(StartAsyncTask), null); }

	public void StartAsyncWork()
	{
		var q = this.context.Request.QueryString;
		//var assetType = q["at"];
		//var amount = q["a"];
        //var search = q["s"];
        var lab = q["l"];
        var related = q["r"];

        //var path = CreateNewestOdataPath(assetType, amount, search);
        var path = CreateNewestOdataPath(lab, related);

		var xmlString = GetHttpData(path);
		if (q["f"] != "j")
		{
			this.context.Response.ContentType = "application/xml";
			this.context.Response.Write(xmlString);
		}
		else
		{
			//this.context.Response.ContentType = "application/json";
			var xsl = new XslCompiledTransform(true);
			xsl.Load(this.context.Server.MapPath("json.xsl"));

			var args = new XsltArgumentList();
			//args.AddParam("assetType", string.Empty, assetType);
            args.AddParam("lab", string.Empty, lab);

			xmlString = xmlString.Replace(Environment.NewLine, string.Empty).Replace("&#xD;",string.Empty).Replace('\r',' ').Replace('\n',' ');
			using (var reader = XmlReader.Create(new StringReader(xmlString)))
			{
				using (var ms = new MemoryStream())
				{
					xsl.Transform(reader, args, ms);
					using (var sr = new StreamReader(ms))
					{
						ms.Position = 0;
						this.context.Response.Write(sr.ReadToEnd());
					}
				}
			}
		}


		this.completed = true;
		this.callback(this);
	}

	//private string CreateNewestOdataPath(string assetType, string amount, string search)
	//{
    //    return string.Format("http://odata.research.microsoft.com/odata.svc/{0}/?search={2}&$top={1}", assetType, amount, search);
	//}
    
    private string  CreateNewestOdataPath(string lab, string related)
    {
        return string.Format("http://odata.research.microsoft.com/odata.svc/{0}/{1}", lab, related);
    }

	private string GetHttpData(string address)
	{
		using (var wc = new System.Net.WebClient())
		{
			//wc.Proxy = new System.Net.WebProxy("itgproxy", 80);
			var s = wc.DownloadString(address);
			return s;
		}
	}
}
