﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alphabet.aspx.cs" Inherits="ZeeFSLDictionary.Pages.WebForm4" %>

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
        <h1>Learn</h1>
        <a href="progress.aspx" style="transform: translate(400px, -60px);" class="btn btn-primary btn-md active" role="button" aria-pressed="true">Progress</a>
    </div>

    <div style="margin-top:2%">
        <h1 style="margin-left:43.5%">Alphabet</h1>
        <img src="../assets/img/learn1.png" style=" margin-left:40%; height:300px; width:300px;" />
        <br />
        <button type="submit" class="btn btn-success" style="margin-left:45%; font-size:50px">Start</button>
    </div>
</body>
</html>