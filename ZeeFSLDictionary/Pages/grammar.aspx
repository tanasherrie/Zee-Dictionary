<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grammar.aspx.cs" Inherits="ZeeFSLDictionary.Pages.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <link href="../css/home.css" rel="stylesheet"/>

    <%--fontawesome css--%>
    <link href="../fontawesome/css/all.css" rel="stylesheet" />

    <%--jquery--%>
    <script src="bootstrap/js/jquery-3.6.0.min.js"></script>
    <%--popper js--%>
    <script src="bootstrap/js/popper.min.js"></script>
    <%--bootstrap js--%>
    <script src="bootstrap/js/bootstrap.min.js"></script>   
</head>
<body>
    <div class="header">
        <a href="home.aspx"><i class="fa-solid fa-circle-arrow-left" style="transform: translate(-550px, 53px);color:white"></i></a>
        <h1>Grammar</h1>
        
    </div>
    
    <div class="input-group rounded" style="width:50%; margin-top:2%; margin-left:25%">
      <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
      <span class="input-group-text border-0" id="search-addon">
        <i class="fas fa-search"></i>
      </span>
    </div>

    <div class="row" style="margin-left:13%; margin-top:4%">
        <div class="col-sm-3" style="border:1px solid #000; ">col-sm</div>
        <div class="col-sm-3" style="border:1px solid #000; margin-left:5%">col-sm</div>
        <div class="col-sm-3" style="border:1px solid #000; margin-left:5%">col-sm</div>
    </div>
</body>
</html>
