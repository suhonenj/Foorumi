<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Etsi</title>
</head>
<body>
<h1>Etsi Profiileja</h1>
<p>Voit etsiä profiileja nimimerkin perusteella.</p>
</form>
<form action="HaeProfiileja" method="get">
    Nimimerkki : <input type="text", name="etsiprofiili"><br><br>

    <input type="submit", value="Etsi">
</form>
<%
    String b=(String)request.getAttribute("profiilit");
    if(b!=null){
        out.println(b);
    }
%>
</body>
</html>
