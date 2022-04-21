﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="ZeeFSLDictionary.Pages.Admin.WebForm1" %>

<html>
<head runat="server">
    <title></title>
    <%--bootstrap css--%>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../css/login.css" rel="stylesheet"/>

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
            
               
		        <h2 id="login_header">Admin Login</h2>
	     
	        <div class="form-group" >
		        <label class="text-dark" for="emailLabel">Email Address</label>
	            <div class="input-group mb-2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
	            </div>
             </div>

            <div class="form-group" >
		        <label class="text-dark" for="passwordLabel">Password</label>
	            <div class="input-group mb-2">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
	            </div>
             </div>

            <div align="center">
                <div class="form-control-plaintext">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck" name="customCheck" runat="server" />
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                    </div>
                </div>
            </div>
            <div align="center">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary"/>
            </div>
            <br />
            <div align="center">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-link">Forgot password?</asp:LinkButton>
                <br /><asp:LinkButton ID="LinkButton2" runat="server" href="adminsignup.aspx">New Account? Sign Up</asp:LinkButton>
            </div>
        </div>
    </form>             
</body>
</html>