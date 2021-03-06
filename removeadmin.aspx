﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="removeadmin.aspx.cs" Inherits="Removeadmin" %>

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
    <title>Remove Admin - YouInteract</title>
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
    <form id="form2" runat="server">
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
                                <li><a href="#">About</a></li>

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
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">System<b class="caret"></b></a>
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
                        <li><a href="systemsettings.aspx">
                            <asp:Label ID="Label3" runat="server" CssClass="nav nav-pills nav-stacked" Text="System Settings"></asp:Label></a></li>
                        <br />
                        <li class="active"><a href="removeadmin.aspx">
                            <asp:Label ID="Label5" runat="server" CssClass="nav nav-pills nav-stacked" Text="Remove Admin"></asp:Label></a></li>
                    </ul>
                </div>
                <div id="content" style="width: 800px; height: 500px; border: 1px solid #d3d6db; float: left; padding-bottom: 50px; background-color: #FFFFFF; border-radius: 5px; margin-left: 10px;">
                    <h1 style="text-align: center">Administrator</h1>
                    <br />
                    <div id="contentbody" style="text-align: left; padding-left: 20px" >
                        <h5>Admin username</h5>
                            <asp:TextBox id="newUser" autofocus="" TextMode="SingleLine" class="form-control" placeholder="Admin to remove" runat="server" Width ="300px" />

                            <asp:RequiredFieldValidator
                                ID ="RequiredFieldValidator3"
                                ControlToValidate="newUser"
                                ErrorMessage="Please enter the administrator's username to be removed"
                                Display="Dynamic" 
                                runat="server" />

                            <asp:CustomValidator ID="checkuname" runat=server
                                                 controltovalidate="newUser" 
                                                 errormessage="This admin does not exist.<br />" 
                                                 OnServerValidate="CheckUserName"
                                                 Display="Dynamic"/>

                            <asp:CustomValidator ID="checkunameCanRem" runat=server
                                                 controltovalidate="newUser" 
                                                 errormessage="This admin cannot be removed.<br />" 
                                                 OnServerValidate="CheckUserNameRemove"
                                                 Display="Dynamic"/>
                            <asp:CustomValidator ID="checkunameYourself" runat=server
                                                 controltovalidate="newUser" 
                                                 errormessage="You cannot delete yourself!<br />" 
                                                 OnServerValidate="CheckUserNameYourself"
                                                 Display="Dynamic"/>

                        <br/>
                        <h5>Your password:</h5>
                            <asp:TextBox id="currPW" textMode="Password" class="form-control" placeholder="Current password" runat="server" Width="300px"/>
                           
                            <asp:CustomValidator ID="check1" runat=server
                                                 controltovalidate="currPW" 
                                                 errormessage="Invalid password.<br />" 
                                                 OnServerValidate="CheckPw"
                                                 Display="Dynamic"/>

                            <asp:RequiredFieldValidator
                                ID="Value1RequiredValidator"
                                ControlToValidate="currPW"
                                ErrorMessage="Please enter your current password.<br />"
                                Display="Dynamic"
                                runat="server"/>
                        <div>
                            <br />
                            <br />
                            <asp:Button ID="Submit" ToolTip="Add an Administrator!" runat="server" CssClass="btn btn-lg btn-primary btn-block" Font-Bold="False" Font-Size="Medium" Height="39px" OnClick="ButtonCHPW_Click" Text="Submit" Width="200px" />
                            <label id="writeWrong" runat="server">
                                
                            </label>
                        </div>
                    </div>
                </div>

                <div id="footer" style="clear: both; text-align: center; margin-top: 50px">
                    <br />
                    <h5>YouInteract © 2014</h5>
                    <h6>Minimum resolution: 1024x768</h6>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
