<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 7.11.2017
  Time: 14.14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="Tyylit.css">
    <title>Vauva24.fi</title>
</head>
<ul class="topnav">
    <li><a class="active" href="HaeViestit">Etusivu</a></li>
    <li><a href="HaeKeskustelu">Foorumi</a></li>
    <li><a href="Rek.jsp">Rekisteröidy</a></li>
    <li><a href="Kirjaudu.jsp">Kirjaudu</a></li>
</ul>
<head>
    <title>Kirjaudu</title>
</head>
<body>
<h1>Kirjaudu sisään</h1>

<form action="Kirjaudu" method="post">

    <p>Tällä sivulle voit rekisteröityä käyttäjäksi</p>
    <br><br>
    Käyttäjätunnus: <input type="text" name="nimi"><br>
    <br><br>
    Salasana: <input type="password" name="salasana"><br>
    <br><br>

    <input type="submit" value="Kirjaudu">

    <%
        if(null!=request.getAttribute("errorMessage"))
        {
            out.println(request.getAttribute("errorMessage"));
        }
    %>

</form><br>
</body>
</html>