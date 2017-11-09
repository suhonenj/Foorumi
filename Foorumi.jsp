<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% HttpSession istunto = request.getSession();
    String nimi =(String)istunto.getAttribute("nimi");
%>
<head>
    <link rel="stylesheet" type="text/css" href="Tyylit.css">
    <title>Vauva24.fi</title>
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
<h1 id="otsikko">VAUVA24.FI</h1>
<h2>Foorumi</h2>
<%
    if (nimi!=null){
        out.println("Tervetuloa " + nimi +"!<br>");
    }
%>
<a href="HaeAlue?name=1">Yleinen keskustelu</a>
<%
    if (nimi!=null){
        out.print("<a href=\"HaeAlue?name=2\">Salainen keskustelu</a>\n");
    }
%>
<a href="HaeAlue?name=3">Erikoinen keskustelu</a>
<br>
<table>

    <tr><th class="foorumi"><a href="HaeAlue?name=1"> Yleinen keskustelu</a></th></tr>
    <% String yleinen = (String) request.getAttribute("yleinen");
    out.println(yleinen);
    %>
</table>
<br>

    <% String salainen = (String) request.getAttribute("salainen");
        if(nimi!=null){
            out.print("  <table>"+
                    "    <th class=\"foorumi\"><a href=\"HaeAlue?name=2\"> Salainen keskustelu</a></th></tr>");
            out.println(salainen);
            out.print("</table>");
        }
    %>
<br>
<table>
    <tr><th class="foorumi"><a href="HaeAlue?name=3"> Erikoinen keskustelu</a></th></tr>
    <% String erikoinen = (String) request.getAttribute("erikoinen");
        out.println(erikoinen);
    %>
</table>
</body>
</html>
