using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Removeadmin : Page
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
        string currentPw = args.Value;
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
                if (Global.CurrentUser != null && !Global.CurrentUser.Equals(res)) continue;
                res = reader.GetValue(2).ToString();
                if (!currentPw.Equals(res)) continue;
                found = true;
                break;
            }

            // close the connection
            reader.Close();
            Global.Conn.Close();
        }
        catch (Exception)
        {
            writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
            return;
        }

        args.IsValid = found;
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

        string newUs = newUser.Text.Trim();

        try
        {
            Global.Conn.Open();

            // create a SqlCommand object for this connection
            SqlCommand command = Global.Conn.CreateCommand();
            command.CommandText = "exec dbo.deleteUser '', '" + newUs + "'";
            command.CommandType = CommandType.Text;

            // execute the command
            if (command.ExecuteNonQuery() == 0)
            {
                writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
                Global.Conn.Close();
                return;
            }

            // close the connection
            Global.Conn.Close();
        }
        catch (Exception)
        {
            writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
            return;
        }

        Response.Redirect("/index.aspx", true);
    }

    protected void CheckUserName(object source, ServerValidateEventArgs args)
    {
        string currentUsr = args.Value.Trim();

        try
        {
            Global.Conn.Open();

            // create a SqlCommand object for this connection
            SqlCommand command = Global.Conn.CreateCommand();
            command.CommandText = "Select * from users where login_user='" + currentUsr + "'";
            command.CommandType = CommandType.Text;

            // execute the command that returns a SqlDataReader
            SqlDataReader reader = command.ExecuteReader();

            // the results
            args.IsValid = reader.Read();

            // close the connection
            reader.Close();
            Global.Conn.Close();
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
        }
    }

    protected void CheckUserNameRemove(object source, ServerValidateEventArgs args)
    {
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
                if (!args.Value.Trim().Equals(res)) continue;
                var res2 = (bool) reader.GetValue(3);
                if (res2) continue;
                found = true;
                break;
            }

            // close the connection
            reader.Close();
            Global.Conn.Close();
        }
        catch (Exception)
        {
            writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
            return;
        }

        args.IsValid = found;
    }

    protected void CheckUserNameYourself(object source, ServerValidateEventArgs args)
    {
        args.IsValid = !Global.CurrentUser.Equals(newUser.Text.Trim());
    }

    protected void ButtonLogout(object sender, EventArgs e)
    {
        Global.LogOut();
        Response.Redirect("/login.aspx", true);
    }
}