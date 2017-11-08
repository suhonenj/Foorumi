<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 7.11.2017
  Time: 14.11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<a href="index.jsp">Etusivu</a>
<a href="HaeKeskustelu">Foorumi</a>
<a href="Rek.jsp">Rekisteroidy</a>
<a href="Kirjaudu.jsp">Kirjaudu</a>
<head>
    <title>Rekisteroidy</title>
</head>
<body>
<br><br>
<br><br>

<h2> Rekisteröidy</h2>
<form action="Rekisteroidy" method="post">

    <p>Tällä sivulle voit rekisteröityä käyttäjäksi</p>
    <br><br>
    Käyttäjätunnus: <input type="text" name="nimi"><br>
    <br><br>
    Salasana: <input type="password" name="salasana"><br>
    <br><br>
    Salasana uudestaan: <input type="password" name="salasanab"><br>

    <input type="submit" value="Lähetä">

</form><br>
</body>
</html>
