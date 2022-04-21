<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assessmentquestions.aspx.cs" Inherits="ZeeFSLDictionary.Pages.WebForm7" %>

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
        <h1>Assessment</h1>
        <h3>Category</h3>
        <button type="submit" class="btn btn-primary" style="margin-top:-8%; margin-left:50%">Progress</button>
    </div>
    
    <div style="text-align:center">
        <button type="submit" class="btn btn-success" style="margin-top:2%; margin-left:50%">Next</button>
        <h2>Question 1:</h2>
        <h4>She ____________ hungry</h4>
        <button type="submit" class="btn btn-primary" style="margin-top:2%;">choice 1</button><br />
        <button type="submit" class="btn btn-primary" style="margin-top:2%;">choice 2</button><br />
        <button type="submit" class="btn btn-primary" style="margin-top:2%;">choice 3</button><br />
        <button type="submit" class="btn btn-primary" style="margin-top:2%;">choice 4</button><br />
    </div>
</body>
</html>
