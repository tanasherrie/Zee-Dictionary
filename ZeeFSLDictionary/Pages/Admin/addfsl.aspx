<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addfsl.aspx.cs" Inherits="ZeeFSLDictionary.Pages.Admin.WebForm5" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
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
                 <h2 >FSL Alphabet</h2>
                 <h4 >Total Number of Signs: </h4>          
            </div>
            <div class="col-3" style="margin-left:10%; margin-top:4%;">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#form">Add Sign</button>
                   


                <div class="modal fade" id="form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-header border-bottom-0">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Sign</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
      
                      
                        <div class="modal-body">
                          <div class="form-group">
                            <asp:Label Text="Name" runat="server"/>
                            <asp:TextBox ID="name" runat="server" placeholder="Enter sign name"></asp:TextBox>
                          </div>
                          <div class="form-group">
                            <asp:Label Text="Description" runat="server"/>
                            <asp:TextBox ID="description" runat="server" placeholder="Enter sign description"></asp:TextBox>
                          </div>
                            <div class="custom-file">
                                <asp:Label Text="Upload Sign" runat="server"/>
                                <asp:FileUpload ID="fslFile" runat="server" />=
                             </div>
                        </div>

                        <div class="modal-footer border-top-0 d-flex justify-content-center">
                          <asp:Button class="btn btn-success" ID="addSign" runat="server" Text="Add Sign" OnClick="addSign_Click"/>
                          <button type="submit" class="btn btn-danger">Cancel</button>
                        </div>
                   
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
            <asp:LinkButton ID="LinkButton5" runat="server" style="color:white">Alphabets</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButton6" runat="server" style="color:white">Family</asp:LinkButton>
        </div>

        <br />
        <!--
        <div class="col-lg-8" style="margin-top:1%">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Sign GIF"></asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField DataField="date_updated" HeaderText="Date Updated" />
                </Columns>
            </asp:GridView>
        </div>!-->

       
    </form>

       
    
   
</body>
</html>

