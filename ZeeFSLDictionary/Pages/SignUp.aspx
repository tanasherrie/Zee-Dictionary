<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ZeeFSLDictionary.Pages.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <%--bootstrap css--%>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../css/login.css" rel="stylesheet"/>

    <%--fontawesome css--%>
    <link href="fontawesome/css/all.css" rel="stylesheet" />

    <%--jquery--%>
    <script src="bootstrap/js/jquery-3.6.0.min.js"></script>
    <%--popper js--%>
    <script src="bootstrap/js/popper.min.js"></script>
    <%--bootstrap js--%>
    <script src="bootstrap/js/bootstrap.min.js"></script>

    
</head>
<body>
    <form id="login" runat="server">
        <div  class="container jumbotron bg-light" id="login_id" style="width:35%">
            
               
		        <h2 id="login_header">Sign Up</h2>
	     
	        <div class="form-group" >
		        <label class="text-dark" for="emailLabel">Email Address</label>
	            <div class="input-group mb-2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
	            </div>
             </div>

            <div class="form-group" >
		        <label class="text-dark" for="passwordLabel">Username</label>
	            <div class="input-group mb-2">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
	            </div>
             </div>

            <div class="form-group" >
		        <label class="text-dark" for="passwordLabel">Select user type:</label>
	            <div class="input-group mb-2">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="Select a user type"></asp:ListItem>
                        <asp:ListItem Value="Deaf"></asp:ListItem>
                        <asp:ListItem Value="Hearing"></asp:ListItem>
                    </asp:DropDownList>
	            </div>
             </div>

            <div class="form-group" >
		        <label class="text-dark" for="passwordLabel">Password</label>
	            <div class="input-group mb-2">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
	            </div>
             </div>

            <div class="form-group" >
		        <label class="text-dark" for="passwordLabel">Confirm Password</label>
	            <div class="input-group mb-2">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
	            </div>
             </div>

            <div align="center">
                <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="btn btn-primary"/>
            </div>
            <br />
            <div align="center">
                <asp:LinkButton ID="LinkButton1" runat="server" href="Login.aspx" CssClass="btn btn-link">Have an account? Login</asp:LinkButton>
            </div>
        </div>
    </form>             
</body>
</html>


