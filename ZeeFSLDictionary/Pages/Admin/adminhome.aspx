<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="ZeeFSLDictionary.Pages.Admin.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"/>
    <link href="../../css/adminhome.css" rel="stylesheet"/>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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
    <form id="form1" runat="server">
         <div class="header">
            <h5 class="welcome">Welcome back, </h5>
            <div class="logout"><button type="button" class="btn btn-info">Logout</button> </div>
         </div>

        
        <div class="row">
          
            <div class="col-3" style="margin-left:20%; margin-top:1%; color: #5181a2;">
                 <h2 >DASHBOARD</h2>
                         
            </div>
           
        <div class="sidenav">
            <h5 style="margin-top:45%">User Management</h5>
            
            <asp:LinkButton ID="LinkButton2" runat="server" style="color:white" href="adminusers.aspx">Admin</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton3" runat="server" style="color:white" href="deafusers.aspx">Deaf Users</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton4" runat="server" style="color:white" href="hearingusers.aspx">Hearing Users</asp:LinkButton>
            
            <h4 style="margin-top:30%">FSL Management</h4>
            <asp:LinkButton ID="LinkButton5" runat="server" style="color:white">Alphabets</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton6" runat="server" style="color:white">Family</asp:LinkButton>
        </div>

        </div>

        <br />

        <div class="row" style="color: #5181a2;">
          
            <div class="col-3" style="margin-left:20%; border-radius: 10px;outline: 4px solid #A4D9F6;  ">
                 <h4 >Total Number of Users:</h4>
                  <h6>Deaf-Mute Users:</h6>
                  <h6>Hearing Users:</h6>
                
            </div>

            <div class="col-3" style="margin-left:10% ; border-radius: 10px;outline: 4px solid #A4D9F6;">
                 <h4 >Total Number of Signs:</h4>
                 <h6>Alphabet:</h6>
                 <h6>Family & Relatives:</h6>        
            </div>
        </div>

       
    </form>
   
</body>
</html>
