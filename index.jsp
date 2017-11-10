
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
                    "                    <input type=\"checkbox\" checked=\"checked\"> Hyväksyn käyttöehdot\n" +
                    "                    <p>Rekisteröitymällä hyväksyt käyttöehdot <a href=\"KayttoEhdot.jsp\">Käyttäjäehdot</a></p>\n" +
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
<p><img src="kuutamolla.fi.png" width="600px" align="left"><br></p>

<%
    if (nimi!=null){
        out.println("<br><p style=\"clear: both;\">Tervetuloa " + nimi +"!</p>");
    } else {
        out.println("<br><p style=\"clear: both;\">Tervetuloa Kuutamolla.fi-keskustelupalstalle! Kirjaudu sisään osallistuaksesi keskusteluun</p>");
    }
%>
<p></p>
<h2 style="clear: both;">Uusimmat viestit</h2>
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