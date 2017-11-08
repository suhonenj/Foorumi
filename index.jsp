<%@ page import="foorumi.PrepStmt" %>
<%@ page import="foorumi.HaeViestitServlet" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<a href="index.jsp">Etusivu</a>
<a href="Rek.jsp">Rekisteroidy</a>
<a href="Kirjaudu.jsp">Kirjaudu</a>
  <head>
      <link rel="stylesheet" type="text/css" href="Tyylit.css">
    <title></title>
  </head>
  <body>
<h1>VAAVI.FI</h1>
<form action="KirjoitaViesti", method="post">
  <%--<input type="text", name="kayttaja">--%>
  Kirjoita otsikko:<input type="text", name="otsikko", value="Otsikko"><br>
  Kirjoita viesti:<input type="text", name="viesti", style="height: 200px;">
  <input type="submit", value="Lähetä">
</form>
<form action="HaeViestit" method="get">
  <input type="submit", value="Hae Viestit">
</form>
  <%
    String a=(String)request.getAttribute("tulos");
    if(a!=null){
        out.println(a);
    }
  %>
  </body>
</html>