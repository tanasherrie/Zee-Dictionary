<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="favorites.aspx.cs" Inherits="ZeeFSLDictionary.Pages.WebForm10" %>

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
        <h1>Favorites</h1>
     </div>

        <div class="row" style="margin-top:2%; margin-left:33%">
            <div class="col-sm-3">
                <button class="favbutton" >Learn</button>
            </div>
           <div class="col-sm-3">
                <button class="favbutton" >Grammar</button>
            </div>
        </div><br />
    <h2 class="addedfavs">RECENTLY ADDED</h2>
    <div class="favword"  style="margin-left:30%;">
        <button class="favbutton" style="border-style:none">1</button>
        <button style="float:right"><i class="fa-solid fa-star" style="border-radius:4px;"></i></button>
    </div>

    <div class="favword" style="margin-left:30%;">
        <button class="favbutton" style="border-style:none">hi hello</button>
        <button style="float:right"><i class="fa-solid fa-star" style="border-radius:10px;"></i></button>
    </div>
</body>
</html>
