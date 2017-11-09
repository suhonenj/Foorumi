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
<a href="Rek.jsp">Rekisteroidy</a>
<a href="Kirjaudu.jsp">Kirjaudu</a>
<head>
    <title>Profiili</title>
</head>
<body>
<br><br>
<br><br>

<h2> Profiili</h2>
<form action="Profiili" method="post">

    <p>Muokkaa profiiliasi</p>
    <br><br>
    Käyttäjätunnus: <input type="text" name="nimi" value=<%=session.getAttribute("nimi")%>><br>

    Kuvaus käyttäjästä: <input type="text" name="kuvaus" value=<%=session.getAttribute("kuvaus")%>><br>


    <input type="submit" value="Lähetä">

    <%=session.getAttribute("nimi")%>

</form><br>
</body>
</html>