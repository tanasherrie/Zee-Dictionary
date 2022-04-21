<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hearingusers.aspx.cs" Inherits="ZeeFSLDictionary.Pages.Admin.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"/>
    <link href="../../css/adduser.css" rel="stylesheet"/>

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
          
            <div class="col-3" style="margin-left:15%; margin-top:1%;">
                 <h2 >Hearing Users</h2>
                 <h4 >Total Number of Users: </h4>          
            </div>
            <div class="col-3" style="margin-left:10%; margin-top:4%;">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#form">Add User</button>
                   


                <div class="modal fade" id="form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header border-bottom-0">
                        <h5 class="modal-title" id="exampleModalLabel">Add New User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <form>
                        <div class="modal-body">
                      
                          <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter name"/>
                          </div>
                          <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="username" placeholder="Enter username"/>
                          </div>

                           <div class="form-group">
                            <label for="name">Age</label>
                            <input type="text" class="form-control" id="age" placeholder="Enter age"/>
                          </div>

                            <div class="input-group mb-3">
                                <label for="name">User type:</label>&nbsp &nbsp
                                <asp:DropDownList ID="DropDownList" runat="server">
                                    <asp:ListItem Value="Select a user type"></asp:ListItem>
                                    <asp:ListItem Value="Deaf"></asp:ListItem>
                                    <asp:ListItem Value="Hearing"></asp:ListItem>
                                    <asp:ListItem Value="Admin"></asp:ListItem>
                                </asp:DropDownList>
	                        </div>

                            <div class="form-group">
                            <label for="name">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Enter password"/>
                          </div>
                           
                        </div>

                        <div class="modal-footer border-top-0 d-flex justify-content-center">
                          <button type="submit" class="btn btn-success">Add User</button>
                          <button type="submit" class="btn btn-danger">Cancel</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
            </div>
        </div>
            
       


        <div class="sidenav"><br /><br />
            <h5>User Management</h5>
            <asp:LinkButton ID="LinkButton2" runat="server" style="color:white" href="adminusers.aspx">Admin</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton3" runat="server" style="color:white" href="deafusers.aspx">Deaf Users</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton4" runat="server" style="color:white" href="hearingusers.aspx">Hearing Users</asp:LinkButton>
            
            <h5 style="margin-top:20%">FSL Management</h5>
            <asp:LinkButton ID="LinkButton5" runat="server" style="color:white" href="addfsl.aspx">Alphabets</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton6" runat="server" style="color:white">Family</asp:LinkButton>
        </div>

        <br />
        <table class="table">
           <thead>
              <tr>
                <th width="6%">Name</th>
                <th width="6%">Username</th>
                <th width="6%">Age</th>
                <th width="10%">Action</th>
              </tr>
            </thead>
        </table>

       
    </form>
   
</body>
</html>


