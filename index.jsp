<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<nav>
  <a href="index.jsp">Etusivu</a>
  <a href="Rek.jsp">Rekisteroidy</a>
  <a href="Kirjaudu.jsp">Kirjaudu</a>

</nav>
  <head>
</head>
<body>
<br><br>
<br><br>


<form action="KirjoitaViesti" method="post">
  <h3>Otsikko: </h3>
  <input type="text" name="otsikko"><br>


  <br>
  <h3>Kirjoita viesti: </h3>
   <input type="text" name="viesti"><br>
  <br>
  <input type="submit" value="Lähetä">
  <input type="reset" value="Peruuta">
</form><br>



</body>
</html>