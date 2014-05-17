<%@ Page Language="C#" AutoEventWireup="true" CodeFile="systemsettings.aspx.cs" Inherits="Systemsettings" %>

<!DOCTYPE html>

<html lang="en">

<link rel="stylesheet" href="http://localhost:52068/netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="http://localhost:52068/netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
<script language="javascript" src="/js/HeartBeatJS.js" ></script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home - DETI Interact</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/mycss.css">
    <link href="css/signin.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding: 0px; margin: 0px">
    <form id="form1" runat="server">
        <div id="container" style="width: 100%;">

            <div id="header" style="width: 100%;">
                <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">YouInteract</a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li><a href="about.aspx">About</a></li>

                                <!--
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                                -->
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administration<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="addadmin.aspx">Add Administrator</a></li>
                                        <li><a href="removeadmin.aspx">Remove Administrator</a></li>
                                        <li><a href="changepassword.aspx">Change Password</a></li>
                                        <li class="divider"></li>
                                        <li><a href="help.aspx">Help</a></li>
                                    </ul>
                                </li>
                                <li><a href="login.aspx" runat="server" OnServerClick="ButtonLogout">Logout</a></li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->
                </nav>
            </div>

            <div id="body" style="width: 1000px; margin: 0 auto; margin-top: 120px;">

                <div id="side bar" style="width: 150px; float: left;">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="index.aspx">Home</a></li>
                        <br />
                        <li><a href="applications.aspx">
                            <asp:Label ID="Label1" runat="server" CssClass="nav nav-pills nav-stacked" Text="Applications"></asp:Label></a></li>
                        <li><a href="themes.aspx">
                            <asp:Label ID="Label2" runat="server" CssClass="nav nav-pills nav-stacked" Text="Themes"></asp:Label></a></li>
                        <li class="active"><a href="systemsettings.aspx">
                            <asp:Label ID="Label3" runat="server" CssClass="nav nav-pills nav-stacked" Text="System Settings"></asp:Label></a></li>
                        <br />
                    </ul>
                </div>

                <div id="content" style="width: 800px; height: 500px; border: 1px solid #d3d6db; float: left; padding:50px; padding-bottom: 50px; background-color: #FFFFFF; border-radius: 5px; margin-left: 10px;">
                    <h1 style="text-align: center">System Settings</h1>

              

                    <div id="contentbody" style="text-align: left">

                        <div id="selectvisibleapps">
                        <h3>Visible Applications:</h3>
                        <div style="float: left; text-align:center">
                            <h6>Non-visible</h6>
                            <asp:ListBox ID="ListBox1" runat="server" Width="200px" Height="200px" DataSourceID="SqlDataSource1" DataTextField="apps_name" DataValueField="apps_name">
                                <asp:ListItem>Aplications</asp:ListItem>
                                <asp:ListItem>Weather</asp:ListItem>
                                <asp:ListItem>Timetable</asp:ListItem>
                                <asp:ListItem>Pong</asp:ListItem>
                            </asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YouInteractConnString %>" SelectCommand="SELECT apps_name FROM apps WHERE active = 0"></asp:SqlDataSource>
                            <br />
                            <asp:Button ID="Button1" Width=100px runat="server" Text=">>>" OnClick="Button1_Click1" />
                        </div>


                        <div style="float: left; text-align:center">
                            <h6>Visible</h6>
                            <asp:ListBox ID="ListBox2" runat="server" Width="200px" Height="200px" DataSourceID="SqlDataSource2" DataTextField="apps_name" DataValueField="apps_name"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YouInteractConnString %>" SelectCommand="SELECT apps_name FROM apps WHERE active = 1"></asp:SqlDataSource>
                            <br />
                            <asp:Button ID="Button2" Width=100px runat="server" Text="<<<" OnClick="Button2_Click2" />
                        </div>
                    </div>



                    </div>
                </div>

                <div id="footer" style="clear: both; text-align: center; margin-top: 50px">
                    <br />
                    <h5>DETI Interact © 2014</h5>
                    <h6>Minimum resolution: 1024x768</h6>
                </div>


            </div>
        </div>


    </form>
</body>
</html>
