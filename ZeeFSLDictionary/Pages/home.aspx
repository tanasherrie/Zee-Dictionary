<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ZeeFSLDictionary.Pages.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <link href="../css/home.css" rel="stylesheet"/>

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
    <div class="header">
        <button type="submit" class="btn btn-primary" style="margin-top:-8%; margin-left:45%">Progress</button>
    </div>

    <h1 class="dashboard">DASHBOARD</h1>
    <div class="row" style="margin-left:10%">
      <div class="col-sm-2" id="module1" style="background-color: #ffcbc1;">
          <img src="../assets/img/learn.png" style="height:125px; width:125px;"/><br />
          <a style="text-decoration:none; color:black" href="learn.aspx">Learn</a>
      </div>

      <div class="col-sm-2" id="module2" style="background-color: #bffcc6;">
          <img src="../assets/img/grammar_hearing.png" style="height:125px; width:125px;"/><br />
          <a style="text-decoration:none; color:black" href="grammar.aspx">Grammar</a>
      </div>
    </div>

    <div class="row" style="margin-left:10%">
      <div class="col-sm-2" id="module3" style="background-color: #ffffd1;">
          <img src="../assets/img/favorites.png" style="height:125px; width:125px;"/><br />
          <a style="text-decoration:none; color:black" href="favorites.aspx">Favorites</a>
      </div>

      <div class="col-sm-2" id="module4" style="background-color: #c4faf8;">
          <img src="../assets/img/info.png" style="height:125px; width:125px;"/><br />
          <a style="text-decoration:none; color:black">Info</a>
      </div>
    </div>

</body>
</html>
