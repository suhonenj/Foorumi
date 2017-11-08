<%--
  Created by IntelliJ IDEA.
  User: Tuukka
  Date: 8.11.2017
  Time: 11.45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<a href="HaeViestit">Etusivu</a>
<a href="HaeKeskustelu">Foorumi</a>
<a href="Rek.jsp">Rekisteroidy</a>
<a href="Kirjaudu.jsp">Kirjaudu</a>
<head>
    <link rel="stylesheet" type="text/css" href="Tyylit.css">
    <title>Erikoinen keskustelu</title>
</head>
<body>
<h1>Erikoinen keskustelu</h1>
<a href="HaeAlue?name=1">Yleinen keskustelu</a>
<a href="HaeAlue?name=2">Salainen keskustelu</a>
<a href="HaeAlue?name=3">Erikoinen keskustelu</a>
<%
    String tavara =(String)request.getAttribute("tavara");
    out.print(tavara);
%>
<form action="KirjoitaViesti?name=3" accept-charset="UTF-8" method="post">
    Kirjoita otsikko:<input type="text", name="otsikko", value="Otsikko"><br>
    Kirjoita viesti:<input type="text", name="viesti", style="height: 200px;">
    <input type="submit", value="Lähetä">
</form>
</body>
</html>
