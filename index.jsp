
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8"%>

<html>
<% HttpSession istunto = request.getSession();
    String nimi =(String)istunto.getAttribute("nimi");
%>
<head>
    <link rel="stylesheet" type="text/css" href="Tyylit.css">
    <link rel="stylesheet" type="text/css" href="popupit.css">
    <title>vaavi.fi</title>
</head>
<ul class="topnav">
    <li id="nappi1" ><button id="etu"> <a href="HaeViestit">Etusivu</a></button></li>
    <li id="nappi2" ><button id="forum"> <a href="HaeKeskustelu">Foorumi</a></button></li>
    <%
        if(nimi==null){
            out.print("<li id=\"nappi3\"><button  onclick=\"document.getElementById('kirjautua').style.display='block'\">Kirjaudu sisään </button>\n" +
                    "        <div id=\"kirjautua\" class=\"modal\">\n" +
                    "            <span onclick=\"document.getElementById('kirjautua').style.display='none'\" class=\"close\" title=\"Sulje\">&times;</span>\n" +
                    "            <form class=\"modal-content animate\" action=\"Kirjaudu\" method=\"POST\">\n" +
                    "                <div class=\"container\">\n" +
                    "                    <label><b>Käyttäjätunnus</b></label>\n" +
                    "                    <input type=\"text\" placeholder=\"Syötä nimimerkki\" name=\"nimi\" required>\n" +
                    "                    <label><b>Salasana</b></label>\n" +
                    "                    <input id=\"salasanavaarin\" type=\"password\" placeholder=\"Syötä salasana\" name=\"salasana\" required>\n" +
                    "                    <div class=\"clearfix\">\n" +
                    "                        <button type=\"button\" onclick=\"document.getElementById('kirjautua').style.display='none'\" class=\"cancelbtn\">Peruuta</button>\n" +
                    "                        <button type=\"submit\" class=\"signupbtn\">Kirjaudu</button>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </form>\n" +
                    "        </div>\n" +
                    "    </li>");
        }
    %>
    <%
        if(nimi==null){
            out.print("<li id=\"nappi4\"><button onclick=\"document.getElementById('rekisteroidy').style.display='block'\">Rekisteröidy </button>\n" +
                    "        <div id=\"rekisteroidy\" class=\"modal\">\n" +
                    "            <span onclick=\"document.getElementById('rekisteroidy').style.display='none'\" class=\"close\" title=\"Sulje\">&times;</span>\n" +
                    "            <form class=\"modal-content animate\" action=\"Rekisteroidy\" method=\"POST\">\n" +
                    "                <div class=\"container\">\n" +
                    "                    <label><b>Syötä uusi käyttäjätunnus</b></label>\n" +
                    "                    <input type=\"text\" placeholder=\"Syötä nimimerkki\" name=\"nimi\" required>\n" +
                    "                    <label><b>Syötä uusi salasana</b></label>\n" +
                    "                    <input type=\"password\" placeholder=\"Syötä salasana\" name=\"salasana\" required>\n" +
                    "                    <label><b>Syötä salasana uudelleen</b></label>\n" +
                    "                    <input type=\"password\" placeholder=\"Syötä salasana\" name=\"salasanab\" required>\n" +
                    "                    <input type=\"checkbox\" checked=\"checked\"> Muista minut\n" +
                    "                    <p>Rekisteröitymällä hyväksyt käyttöehdot <a href=\"#\">Käyttäjäehdot</a>.</p>\n" +
                    "                    <div class=\"clearfix\">\n" +
                    "                        <button type=\"button\" onclick=\"document.getElementById('rekisteroidy').style.display='none'\" class=\"cancelbtn\">Peruuta</button>\n" +
                    "                        <button type=\"submit\" class=\"signupbtn\">Rekisteröidy</button>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </form>\n" +
                    "\n" +
                    "        </div>\n" +
                    "    </li>");
        }
    %>
    <%
        if (nimi!=null){
            out.print("<li><button><a href=\"/Profiili.jsp\">Profiili</a></button></li>\n");
            out.print("<li><button><a href=\"/UlosServlet\">Kirjaudu ulos</a></button></li>\n");
        }
    %>
    <li class="hakupalkki">
        <form id="x" action="EtsiViesteja" method="get">
            <input type="submit" class="hae" value="Hae"><p>   </p>
        <input type="text" name="etsiviesti" placeholder="Etsi.."></form>
    </li>
</ul>
<body>
<h1>VAUVA24.FI</h1>
  <h2>Uusimmat viestit</h2>
<%--<form action="KirjoitaViesti" accept-charset="UTF-8" method="post">--%>
  <%--&lt;%&ndash;<input type="text", name="kayttaja">&ndash;%&gt;--%>
  <%--Kirjoita otsikko:<input type="text", name="otsikko", value="Otsikko"><br>--%>
  <%--Kirjoita viesti:<input type="text", name="viesti", style="height: 200px;">--%>
  <%--<input type="submit", value="Lähetä">--%>
<%--</form>--%>
<%--<form action="HaeViestit" method="get">--%>
  <%--<input type="submit" value="Hae Viestit">--%>
<%--</form>--%>
  <%
    String a=(String)request.getAttribute("tulos");
    if(a!=null){
        out.println(a);
    }
  %>
  </body>
<script>
    var x = document.getElementById('kirjautua');
    window.onclick = function(event) {
        if (event.target == x) {
            x.style.display = "none";
        }
    }
    var y = document.getElementById('rekisteroidy');
    window.onclick = function(event) {
        if (event.target == y) {
            y.style.display = "none";
        }
    }
</script>
</html>