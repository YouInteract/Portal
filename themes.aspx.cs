using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Themes : Page
{
    public static int ThemeCurrentId;
    public static List<int> ThemeAvailableId;

    protected void Page_Load(object sender, EventArgs e)
    {
        ThemeCurrentId = -1;
        ThemeAvailableId = new List<int>();

        try
        {
            Global.Conn.Open();

            // create a SqlCommand object for this connection
            SqlCommand command = Global.Conn.CreateCommand();
            command.CommandText = "Select * from [deti- youinteract].dbo.themes";
            command.CommandType = CommandType.Text;

            // execute the command that returns a SqlDataReader
            SqlDataReader reader = command.ExecuteReader();

            bool activePrinted = false;
            // the results
            while (reader.Read())
            {
                object themeId = reader.GetValue(0);
                var themeIdT = (int)themeId;

                object themeName = reader.GetValue(1);
                string themeNameT = themeName == DBNull.Value ? "N/A" : themeName.ToString();

                object themeActive = reader.GetValue(2);
                bool themeActiveT = themeActive != DBNull.Value && (bool)themeActive;

                object themeFont = reader.GetValue(3);
                string themeFontT = themeFont == DBNull.Value ? "N/A" : themeFont.ToString();

                if (themeActiveT && !activePrinted)
                {
                    ThemeCurrentId = themeIdT;
                    var radioCurrent = new RadioButton
                    {
                        ID = Convert.ToString(themeIdT),
                        GroupName = "Theme",
                        Checked = true
                    };

                    var cellRadioCurrent = new TableCell
                    {
                        Width = new Unit("10%"),
                        Height = new Unit("120px")
                    };
                    cellRadioCurrent.Controls.Add(radioCurrent);

                    var cellNameCurrent = new TableCell
                    {
                        Width = new Unit("20%"),
                        Height = new Unit("120px"),
                        Text = themeNameT
                    };

                    var cellFontCurrent = new TableCell
                    {
                        Width = new Unit("20%"),
                        Height = new Unit("120px"),
                        Text = "<div style='font-family: " + themeFontT + "'>" + themeFontT + "</div>"
                    };

                    var imageCurrent = new Image
                    {
                        Width = new Unit("200px"),
                        Height = new Unit("113px"),
                        ImageUrl = "/images/" + themeNameT + "/Background/screenshot.jpg"
                    };

                    var cellImageCurrent = new TableCell();
                    cellImageCurrent.Controls.Add(imageCurrent);

                    currentRow.Cells.Add(cellRadioCurrent);
                    currentRow.Cells.Add(cellNameCurrent);
                    currentRow.Cells.Add(cellFontCurrent);
                    currentRow.Cells.Add(cellImageCurrent);
                    activePrinted = true;
                }
                else
                {
                    ThemeAvailableId.Add(themeIdT);
                    var radioAvailable = new RadioButton
                    {
                        ID = Convert.ToString(themeIdT),
                        GroupName = "Theme",
                        Checked = false
                    };

                    var cellRadioAvailable = new TableCell
                    {
                        Width = new Unit("10%"),
                        Height = new Unit("120px")
                    };
                    cellRadioAvailable.Controls.Add(radioAvailable);

                    var cellNameAvailable = new TableCell
                    {
                        Width = new Unit("20%"),
                        Height = new Unit("120px"),
                        Text = themeNameT
                    };

                    var cellFontAvailable = new TableCell
                    {
                        Width = new Unit("20%"),
                        Height = new Unit("120px"),
                        Text = "<div style='font-family: " + themeFontT + "'>" + themeFontT + "</div>"
                    };

                    var imageAvailable = new Image
                    {
                        Width = new Unit("200px"),
                        Height = new Unit("113px"),
                        ImageUrl = "/images/" + themeNameT + "/Background/screenshot.jpg"
                    };

                    var cellImageAvailable = new TableCell();
                    cellImageAvailable.Controls.Add(imageAvailable);

                    var availableRow = new TableRow
                    {
                        HorizontalAlign = HorizontalAlign.Center,
                        ID = "RowAvailable" + themeIdT
                    };

                    availableRow.Cells.Add(cellRadioAvailable);
                    availableRow.Cells.Add(cellNameAvailable);
                    availableRow.Cells.Add(cellFontAvailable);
                    availableRow.Cells.Add(cellImageAvailable);

                    availableTable.Rows.Add(availableRow);
                }
            }

            // close the connection
            reader.Close();
            Global.Conn.Close();
        }
        catch (Exception)
        {
            writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
        }

        if (IsPostBack) return;
        if (!Global.IsLoggedIn(Request.Cookies["loginCook"]))
            Response.Redirect("/login.aspx", true);
        Global.ResetTimer();
    }

    protected void SubmitClick(object sender, EventArgs e)
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

        bool valid = false;

        var theRadioButton = Page.FindControl(ThemeCurrentId.ToString(CultureInfo.InvariantCulture)) as RadioButton;
        if (theRadioButton != null && theRadioButton.Checked)
        {
            valid = ChangeDbActiveTheme(Convert.ToInt32(theRadioButton.ID));
        }
        else
        {
            foreach (int themeAvailableId in ThemeAvailableId)
            {
                theRadioButton = Page.FindControl(themeAvailableId.ToString(CultureInfo.InvariantCulture)) as RadioButton;
                if (theRadioButton == null || !theRadioButton.Checked) continue;
                valid = ChangeDbActiveTheme(Convert.ToInt32(theRadioButton.ID));
                break;
            }
        }

        if (!valid)
            writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, the selection is not Valid!</h6>";
        Response.Redirect("/themes.aspx", true);
    }

    private bool ChangeDbActiveTheme(int themeAvailableId)
    {
        try
        {
            Global.Conn.Open();

            // create a SqlCommand object for this connection
            SqlCommand command = Global.Conn.CreateCommand();
            command.CommandText = "Update [deti- youinteract].[dbo].[themes] set active = 0";
            command.CommandType = CommandType.Text;

            // execute the command
            command.ExecuteNonQuery();

            command.CommandText = "Update [deti- youinteract].[dbo].[themes] set active = 1 where theme_id = " + themeAvailableId;
            command.CommandType = CommandType.Text;

            // execute the command
            if (command.ExecuteNonQuery() != 1)
            {
                Global.Conn.Close();
                return false;
            }

            // close the connection
            Global.Conn.Close();
        }
        catch (Exception)
        {
            writeWrong.InnerHtml = "<h6 style='color: red'>Sorry, an internal error ocurred!</h6>";
            Global.Conn.Close();
        }
        return true;
    }

    protected void ButtonLogout(object sender, EventArgs e)
    {
        Global.LogOut();
        Response.Redirect("/login.aspx", true);
    }
}