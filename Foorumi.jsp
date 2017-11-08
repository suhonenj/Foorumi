<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<a href="HaeViestit">Etusivu</a>
<a href="HaeKeskustelu">Foorumi</a>
<a href="Rek.jsp">Rekisteroidy</a>
<a href="Kirjaudu.jsp">Kirjaudu</a>
<head>
    <link rel="stylesheet" type="text/css" href="Tyylit.css">

    <title>Keskustelufoorumi</title>
</head>
<body>
<table>
    <tr><th style='text-align:left';><a href="HaeAlue?name=1"> Yleinen keskustelu</a></th></tr>
    <% String yleinen = (String) request.getAttribute("yleinen");
    out.println(yleinen);
    %>
    <th style='text-align:left'><a href="HaeAlue?name=2"> Salainen keskustelu</a></th></tr>
    <% String salainen = (String) request.getAttribute("salainen");
        out.println(salainen);
    %>
    <tr><th style='text-align:left'><a href="HaeAlue?name=3"> Erikoinen keskustelu</a></th></tr>
    <% String erikoinen = (String) request.getAttribute("erikoinen");
        out.println(erikoinen);
    %>
</table>
</body>
</html>
