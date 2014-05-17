<%@ Page Language="C#" AutoEventWireup="true" CodeFile="configvideoapp.aspx.cs" Inherits="Configvideoapp" %>

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
    <title>Configure Video App - YouInteract</title>
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
<body style="padding: 0; margin: 0">
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
                            <a class="navbar-brand" href="index.aspx">YouInteract</a>
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

            <div id="body" style="margin: 0 auto; margin-top: 120px; width: 1000px;">

                <div id="side bar" style="width: 150px; float: left;">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="index.aspx">Home</a></li>
                        <br />
                        <li class="active"><a href="applications.aspx">
                            <asp:Label ID="Label1" runat="server" CssClass="nav nav-pills nav-stacked" Text="Applications"></asp:Label></a></li>
                        <li><a href="themes.aspx">
                            <asp:Label ID="Label2" runat="server" CssClass="nav nav-pills nav-stacked" Text="Themes"></asp:Label></a></li>
                        <li><a href="systemsettings.aspx">
                            <asp:Label ID="Label3" runat="server" CssClass="nav nav-pills nav-stacked" Text="System Settings"></asp:Label></a></li>
                        <br />
                    </ul>
                </div>

                <div id="content" style="background-color: #FFFFFF; border: 1px solid #D3D6DB; border-radius: 5px; float: left; height: auto; margin-left: 10px; overflow: auto; padding: 0 15px 15px 15px; position: relative; width: 800px;">
                    <h1 class="form-signin-heading" style="text-align: center">Video App</h1>
                    <br />

                    <div id="contentbody" style="text-align: left">
                        <h4>Select Videos</h4>
                        <div style="float: left; text-align: center; margin-bottom: 10px">

                            <h6>Unselected Videos</h6>
                            <asp:ListBox ID="ListBox1" runat="server" Width="200px" Height="200px" DataSourceID="SqlDataSource1" DataTextField="name_video" DataValueField="name_video">
                            </asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings: YouInteractConnString %>" SelectCommand="SELECT name_video FROM videos WHERE active_video=0"></asp:SqlDataSource>
                            <br />
                            <asp:Button ID="Button1" Width="100px" runat="server" Text=">>>" OnClick="Button1_Click" />
                        </div>
                        <div style="float: left; text-align: center; margin-bottom: 10px">
                            <h6>Selected Videos</h6>
                            <asp:ListBox ID="ListBox2" runat="server" Width="200px" Height="200px" DataSourceID="SqlDataSource2" DataTextField="name_video" DataValueField="name_video">

                            </asp:ListBox>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings: YouInteractConnString %>" SelectCommand="select name_video from videos where active_video=1;"></asp:SqlDataSource>

                            <br />
                            <asp:Button ID="Button2" Width="100px" runat="server" Text="<<<" OnClick="Button2_Click" />
                        </div>

                        <div id="AddVideo" style="border-top: 1px solid #808080; clear: both; float: left; padding-top: 30px; width: 440px; height: auto;">
                            <h4>Add Video</h4>
                            Name
                        <asp:TextBox ID="vname" TextMode="SingleLine" class="form-control" placeholder="Name" runat="server" Width="300px" />
                            Path
                        <asp:TextBox ID="vpath" TextMode="SingleLine" class="form-control" placeholder="Path" runat="server" Width="300px" />
                            Description
                        <asp:TextBox ID="vdescription" TextMode="SingleLine" class="form-control" placeholder="Description" runat="server" Width="300px" Height="100px" />
                            <div id="Submit new video" style="float: right; position: relative; bottom: 150px">
                                <asp:Button ID="Button3" ToolTip="Insert path to new video!" runat="server" CssClass="btn btn-lg btn-primary btn-block" Font-Bold="False" Font-Size="Medium" Height="39px" OnClick="SubmitVideo_Click" Text="Submit" Width="100px" />
                            </div>
                        </div>
                        <label id="sqlerror" runat="server"></label>
                        <br />

                    </div>
                </div>

                <div id="footer" style="clear: both; margin-top: 50px; text-align: center;">
                    <br />
                    <h5>YouInteract © 2014</h5>
                    <h6>Minimum resolution: 1024x768</h6>
                </div>


            </div>
        </div>


    </form>
</body>
</html>

