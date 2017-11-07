package foorumi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Tuukka on 7.11.2017.
 */

@WebServlet(name = "IstuntoServlet"  , urlPatterns = {"/Istuntosivu"})
public class IstuntoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String kayttajanimi = null;
        Cookie[] keksit = request.getCookies();
        if (keksit != null) {
            for (Cookie keksi : keksit) {
                if (keksi.getName().equals("user")) {
                    kayttajanimi = keksi.getValue();
                }
            }
            if (kayttajanimi == null) {
                response.sendRedirect("/kattiharjoitukset/Lopetus");
            }
        }
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html lang='fi'>");
            out.println("<head>");
            out.println("<meta charset='utf-8'/>");
            out.println("<title>IStuntosivu</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Kirjautumistiedot</h1>");
            out.println("<h3>Tervetuloa!</h3>");
            out.println(kayttajanimi);
            out.println("<h3>Kirjautuminen onnistui!</h3>");
            out.println("<br>");
            //out.println("<form action = '' method='POST'>");
            out.println("<a href='Lopetus'>Lopeta istunto</a>");
            // out.println("<input type ='submit' value ='Uloskirjaudu' ");
            //  out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
