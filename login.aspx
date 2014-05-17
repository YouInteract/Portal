<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="en">
  
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>YouInteract Login Page</title>

    <!--Bootstrap 101 Template</title>

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

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script language="javascript" src="/js/HeartBeatJS.js" >
    </script>
  </head>
  <body>
      <div id="container" style="width:300px; margin:0 auto;">


     <div >
         <h1 style="color:darkblue; text-align:center"><b>YouInteract</b></h1>
         <h4 style="text-align:center">Configuration Portal</h4>
         
         <br /><br /><br />
         <form id="form1" runat="server">
        <h3 class="form-signin-heading">Please sign in</h3>
        <asp:TextBox id="user" class="form-control" placeholder="Username" required="" autofocus="" runat="server"/>
        <asp:TextBox id="passwd" textMode="password" class="form-control" placeholder="Password" required="" runat="server"/>
        <label id="writeWrongPW" runat="server">
             
        </label>
        <label class="checkbox">
          <asp:CheckBox ID="rememberMe" value="remember-me" runat="server" Text="Remember data" />
        </label>
             <asp:Button id="Button1" runat="server" CssClass="btn btn-lg btn-primary btn-block" Font-Bold="False" Font-Size="Medium" Height="39px" OnClick="Button1_Click" Text="Sign in" Width="220px" />

         </form>

     </div>


    <div id="footer" style="clear: both; text-align: center; margin-top: 50px">
        <br />
        <h5>YouInteract © 2014</h5>
        <h6>Minimum resolution: 1024x768</h6>
    </div>
  
    </div>  
    </body>
</html>