<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 8.11.2017
  Time: 11.11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Etsi</title>
</head>
<body>
<h1>Etsi Viestejä</h1>
<p>Voit etsiä viestejä otsikon ja viestin sisällön perusteella.</p>
</form>
<form action="EtsiViesteja" method="get">
    Kirjoita otsikko: <input type="text", name="etsiotsikko"><br><br>
    Kirjoita viesti: <input type="text", name="etsiviesti"> <br><br>
    <input type="submit", value="Etsi">
</form>
<%
    String b=(String)request.getAttribute("tulos2");
    if(b!=null){
        out.println(b);
    }
%>
</body>
</html>
