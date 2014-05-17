using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;

public partial class Login : Page
{
    private static readonly Random Random = new Random((int) DateTime.Now.Ticks);

    private void Page_Load(Object sender, EventArgs e)
    {
        if (IsPostBack) return;

        if (Global.IsLoggedIn(Request.Cookies["loginCook"]))
            Response.Redirect("/index.aspx", true);

        if (Request.Cookies["user"] == null || Request.Cookies["passwd"] == null) return;
        user.Text = Request.Cookies["user"].Value;
        passwd.Attributes["value"] = Request.Cookies["passwd"].Value;
    }

    public void Button1_Click(Object sender,
        EventArgs e)
    {
        string username = user.Text.Trim();
        string password = passwd.Text;

        bool found = false;

        try
        {
            Global.Conn.Open();

            // create a SqlCommand object for this connection
            SqlCommand command = Global.Conn.CreateCommand();
            command.CommandText = "Select * from users";
            command.CommandType = CommandType.Text;

            // execute the command that returns a SqlDataReader
            SqlDataReader reader = command.ExecuteReader();

            // the results
            while (reader.Read())
            {
                string res = reader.GetValue(1).ToString();
                if (!username.Equals(res)) continue;
                res = reader.GetValue(2).ToString();
                if (!password.Equals(res)) continue;
                found = true;

                Global.CurrentUser = username;
                Global.CurrentPassword = password;

                break;
            }

            // close the connection
            reader.Close();
            Global.Conn.Close();
        }
        catch (Exception)
        {
            writeWrongPW.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
            return;
        }

        if (!found)
        {
            writeWrongPW.InnerHtml = "<h6 style='color: red'>Sorry, wrong username/password</h6>";
            return;
        }

        HttpCookie loginCookie = Response.Cookies["loginCook"];
        if (loginCookie != null) loginCookie.Expires = DateTime.Now.AddDays(1);

        HttpCookie loginCookie1 = Response.Cookies["loginCook"];
        string temp = RandomString(32);
        if (loginCookie1 != null) loginCookie1.Value = temp;

        Global.CurrentCookieLoginValue = temp;

        if (rememberMe.Checked)
        {
            HttpCookie httpCookie = Response.Cookies["user"];
            if (httpCookie != null) httpCookie.Expires = DateTime.Now.AddDays(30);
            HttpCookie cookie = Response.Cookies["passwd"];
            if (cookie != null) cookie.Expires = DateTime.Now.AddDays(30);
        }
        else
        {
            HttpCookie httpCookie = Response.Cookies["user"];
            if (httpCookie != null) httpCookie.Expires = DateTime.Now.AddDays(-1);
            HttpCookie cookie = Response.Cookies["passwd"];
            if (cookie != null) cookie.Expires = DateTime.Now.AddDays(-1);
        }
        HttpCookie httpCookie1 = Response.Cookies["user"];
        if (httpCookie1 != null) httpCookie1.Value = user.Text.Trim();
        HttpCookie cookie1 = Response.Cookies["passwd"];
        if (cookie1 != null) cookie1.Value = passwd.Text.Trim();

        Global.StartTimer();

        Response.Redirect("/index.aspx", true);
    }

    private static string RandomString(int size)
    {
        var builder = new StringBuilder();
        for (int i = 0; i < size; i++)
        {
            char ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26*Random.NextDouble() + 65)));
            builder.Append(ch);
        }

        return builder.ToString();
    }
}