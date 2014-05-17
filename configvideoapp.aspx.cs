using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Configvideoapp : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (!Global.IsLoggedIn(Request.Cookies["loginCook"]))
            Response.Redirect("/login.aspx", true);
        Global.ResetTimer();
    }

    protected void Button1_Click(object sender, EventArgs e)
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

        string vname1 = ListBox1.Items[ListBox1.SelectedIndex].ToString();
        string query = "UPDATE dbo.videos SET active_video=1 WHERE name_video=" + "'" + vname1 + "';";
        SqlDataSource1.UpdateCommand = query;
        SqlDataSource1.Update();


        RefreshListBox1And2();
    }

    protected void Button2_Click(object sender, EventArgs e)
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


        string vname2 = ListBox2.Items[ListBox2.SelectedIndex].ToString();
        string query = "UPDATE dbo.videos SET active_video=0 WHERE name_video=" + "'" + vname2 + "';";
        SqlDataSource2.UpdateCommand = query;
        SqlDataSource2.Update();

        RefreshListBox1And2();
    }


    private void RefreshListBox1And2()
    {
        SqlDataSource2.SelectCommand = "SELECT name_video FROM videos WHERE active_video=1";
        SqlDataSource1.SelectCommand = "SELECT name_video FROM videos WHERE active_video=0";

        ListBox1.DataBind();
        ListBox2.DataBind();
    }

    protected void SubmitVideo_Click(object sender, EventArgs e)
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

        string videoname = vname.Text;
        string videopath = vpath.Text;
        string description = vdescription.Text;

        try
        {
            Global.Conn.Open();

            SqlCommand command = Global.Conn.CreateCommand();

            command.CommandType = CommandType.Text;
            command.CommandText =
                "INSERT INTO videos (name_video,path_video,active_video,description_video) VALUES ('" + videoname +
                "','" + videopath + "','" + false + "','" + description + "');";
            command.ExecuteNonQuery();


            Global.Conn.Close();

            RefreshListBox1And2();
        }
        catch (DataException)
        {
            sqlerror.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
        }
        //Ver campos da base de dados
    }

    protected void List1_addContent(object sender, EventArgs e)
    {
        try
        {
            Global.Conn.Open();
            SqlCommand command = Global.Conn.CreateCommand();

            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT name_video FROM  dbo.videos WHERE active_video=0;";
            //var reader = command.ExecuteReader();

            /* while (reader.Read())
            {
                var vname = reader.GetValue(0).ToString();
                ListBox1.Items.Add(vname);
            }*/
            var datadapter = new SqlDataAdapter(command);
            var dt = new DataTable();
            datadapter.Fill(dt);

            ListBox1.DataSource = dt;
            ListBox1.DataValueField = "name_video";
            ListBox1.DataBind();

            // reader.Close();
            Global.Conn.Close();
        }
        catch (DataException)
        {
            sqlerror.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
        }
    }

    protected void List2_addContent(object sender, EventArgs e)
    {
        try
        {
            Global.Conn.Open();
            SqlCommand command = Global.Conn.CreateCommand();

            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT name_video FROM dbo.videos WHERE active_video=1;";
            //var reader = command.ExecuteReader();

            /* while (reader.Read())
             {
                 var vname = reader.GetValue(0).ToString();
                 ListBox1.Items.Add(vname);
             }*/
            var datadapter = new SqlDataAdapter(command);
            var dt = new DataTable();
            datadapter.Fill(dt);

            ListBox2.DataSource = dt;
            ListBox2.DataValueField = "name_video";
            ListBox2.DataBind();

            // reader.Close();
            Global.Conn.Close();
        }
        catch (DataException)
        {
            sqlerror.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
        }
    }

    protected void ButtonLogout(object sender, EventArgs e)
    {
        Global.LogOut();
        Response.Redirect("/login.aspx", true);
    }
}