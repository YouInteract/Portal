using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Addadmin : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (!Global.IsLoggedIn(Request.Cookies["loginCook"]))
            Response.Redirect("/login.aspx", true);
        Global.ResetTimer();
    }

    protected void CheckPw(object source, ServerValidateEventArgs args)
    {
        args.IsValid = true;
    }

    protected void CheckUser(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Length >= 5;
    }

    protected void CheckPw2(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Length >= 6;
    }

    protected void CheckPw3(object source, ServerValidateEventArgs args)
    {
        args.IsValid = !args.Value.Contains(" ");
    }

    public void ButtonCHPW_Click(Object sender,
        EventArgs e)
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

        string newuser = newUser.Text;
        string newpw = newPW.Text;
        string adminpw = currPW.Text;

        try
        {
            //create a SqlCommand object for this connection
            Global.Conn.Open();

            SqlCommand command = Global.Conn.CreateCommand();
            command.CommandType = CommandType.Text;
            command.CommandText = "SELECT * FROM users;";
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string user = reader.GetValue(1).ToString();
                if (Global.CurrentUser.Equals(user))
                    break;
            }

            int id = Convert.ToInt32(reader.GetValue(0));
            object pw = reader.GetValue(2);
            if (id == 999)
            {
                writeWrongPW.InnerHtml = "<h6 style='color: red'>Sorry, maximum numbers of administrators reached!</h6>";
                Global.Conn.Close();
                return;
            }
            id++;
            if (!adminpw.Equals(pw))
            {
                writeWrongPW.InnerHtml = "<h6 style='color: red'>Sorry, administrator password invalid</h6>";
                Global.Conn.Close();
                return;
            }

            //Insert data to the db

            string text = "exec InsertUser '" + id + "','" + newuser + "'," + "'" + newpw + "'," + "'0';";
            //"INSERT INTO users (id_user,login_user,pass_user,admin_user) VALUES ('" + id.ToString() + "','" + newuser + "','" + newpw + "','0');";

            command.CommandText = text;
            reader.Close();
            command.ExecuteNonQuery();


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

        Response.Redirect("/index.aspx", true);
    }

    protected void ButtonLogout(object sender, EventArgs e)
    {
        Global.LogOut();
        Response.Redirect("/login.aspx", true);
    }
}