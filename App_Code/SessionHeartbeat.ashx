<%@ WebHandler Language="C#" Class="SessionHeartbeat" %>

using System;
using System.Web;
using System.Web.SessionState;

public class SessionHeartbeat : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Session["Heartbeat"] = DateTime.Now;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}