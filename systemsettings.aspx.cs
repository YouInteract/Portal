using System;
using System.Web.UI;

public partial class Systemsettings : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (!Global.IsLoggedIn(Request.Cookies["loginCook"]))
            Response.Redirect("/login.aspx", true);
        Global.ResetTimer();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid)
            return;

        if (!Global.IsLoggedIn(Request.Cookies["loginCook"]))
        {
            Response.Redirect("/login.aspx", true);
            return;
        }
        Global.ResetTimer();

        if (ListBox1.SelectedIndex < 0) return;

        string vname = ListBox1.Items[ListBox1.SelectedIndex].ToString();
        string query = "UPDATE dbo.apps SET active=1 WHERE apps_name=" + "'" + vname + "';";
        SqlDataSource1.UpdateCommand = query;
        SqlDataSource1.Update();

        SqlDataSource1.SelectCommand = "SELECT apps_name FROM apps WHERE active = 0";
        SqlDataSource2.SelectCommand = "SELECT apps_name FROM apps WHERE active = 1";

        ListBox1.DataBind();
        ListBox2.DataBind();
    }

    protected void Button2_Click2(object sender, EventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid)
            return;

        if (!Global.IsLoggedIn(Request.Cookies["loginCook"]))
        {
            Response.Redirect("/login.aspx", true);
            return;
        }
        Global.ResetTimer();

        if (ListBox2.SelectedIndex < 0) return;


        string vname = ListBox2.Items[ListBox2.SelectedIndex].ToString();
        string query = "UPDATE dbo.apps SET active=0 WHERE apps_name=" + "'" + vname + "';";
        SqlDataSource2.UpdateCommand = query;
        SqlDataSource2.Update();

        SqlDataSource2.SelectCommand = "SELECT apps_name FROM apps WHERE active = 1";
        SqlDataSource1.SelectCommand = "SELECT apps_name FROM apps WHERE active = 0";

        ListBox1.DataBind();
        ListBox2.DataBind();
    }

    protected void ButtonLogout(object sender, EventArgs e)
    {
        Global.LogOut();
        Response.Redirect("/login.aspx", true);
    }
}