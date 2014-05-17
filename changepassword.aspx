<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="Changepassword" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Change Password - YouInteract</title>
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

    <link rel="stylesheet" href="http://localhost:52068/netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="http://localhost:52068/netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script language="javascript" src="/js/HeartBeatJS.js" ></script>
</head>
<body style="margin: 0; padding: 0;">
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

            <div id="body" style="margin: 0 auto; margin-top: 120px; width: 1000px;">

                <div id="side bar" style="width: 150px; float: left;">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="index.aspx">
                            <asp:Label ID="Label4" runat="server" CssClass="nav nav-pills nav-stacked" Text="Home"></asp:Label></a></li>
                        <br />
                        <li><a href="applications.aspx">
                            <asp:Label ID="Label1" runat="server" CssClass="nav nav-pills nav-stacked" Text="Applications"></asp:Label></a></li>
                        <li><a href="themes.aspx">
                            <asp:Label ID="Label2" runat="server" CssClass="nav nav-pills nav-stacked" Text="Themes"></asp:Label></a></li>
                        <li><a href="systemsettings.aspx">
                            <asp:Label ID="Label3" runat="server" CssClass="nav nav-pills nav-stacked" Text="System Settings"></asp:Label></a></li>
                        <br />
                        <li class="active"><a href="changepassword.aspx">
                            <asp:Label ID="Label5" runat="server" CssClass="nav nav-pills nav-stacked" Text="Change Password"></asp:Label></a></li>
                    </ul>
                </div>

                <div id="content" style="background-color: #FFFFFF; border: 1px solid #D3D6DB; border-radius: 5px; float: left; height: auto; margin-left: 10px; overflow: auto; padding: 0 15px 15px 15px; position: relative; width: 800px;">
                    <h1 class="form-signin-heading" style="text-align: center">Password Change</h1>

                    <br />

                    <div id="contentbody" style="text-align: left">
                        <h5>Current password:</h5>
                        <asp:TextBox ID="currPW" TextMode="Password" class="form-control" placeholder="Current password" autofocus="" runat="server" Width="300px" />

                        <asp:CustomValidator ID="check1" runat="server"
                            ControlToValidate="currPW"
                            ErrorMessage="Invalid password.<br />"
                            OnServerValidate="CheckPw"
                            Display="Dynamic" />

                        <asp:RequiredFieldValidator
                            ID="Value1RequiredValidator"
                            ControlToValidate="currPW"
                            ErrorMessage="Please enter your current password.<br />"
                            Display="Dynamic"
                            runat="server" />


                        <br />

                        <h5>New password:</h5>
                        <asp:TextBox ID="newPW" TextMode="password" class="form-control" placeholder="New password" runat="server" Width="300px" />

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            ControlToValidate="newPW"
                            ErrorMessage="Please enter the new password.<br />"
                            Display="Dynamic"
                            runat="server" />

                        <asp:CustomValidator ID="check2" runat="server"
                            ControlToValidate="newPW"
                            ErrorMessage="Password must be at least 6 characters long.<br />"
                            OnServerValidate="CheckPw2"
                            Display="Dynamic"
                            ClientValidationFunction="CheckPW2J" />

                        <script type="text/javascript">
                            function CheckPW2J(source, args) {
                                args.IsValid = args.Value.length >= 6;
                            }

                            function CheckPW3J(source, args) {
                                args.IsValid = args.Value.indexOf(" ") == -1;
                            }
                        </script>

                        <asp:CustomValidator ID="check3" runat="server"
                            ControlToValidate="newPW"
                            ErrorMessage="Password cannot contain spaces.<br />"
                            OnServerValidate="CheckPw3"
                            Display="Dynamic"
                            ClientValidationFunction="CheckPW3J" />

                        <h5>Repeat password:</h5>
                        <asp:TextBox ID="repPW" TextMode="password" class="form-control" placeholder="Repeat password" runat="server" Width="300px" />

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            ControlToValidate="repPW"
                            ErrorMessage="Please re-enter the password.<br />"
                            Display="Dynamic"
                            runat="server" />

                        <asp:CompareValidator runat="server"
                            ControlToValidate="repPW"
                            ControlToCompare="newPW"
                            ErrorMessage="Passwords do not match.<br />"
                            Display="Dynamic" />

                        <div>
                            <br />
                            <asp:Button ID="Submit" ToolTip="Change the password!" runat="server" CssClass="btn btn-lg btn-primary btn-block" Font-Bold="False" Font-Size="Medium" Height="39px" OnClick="ButtonCHPW_Click" Text="Submit" Width="200px" />
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
