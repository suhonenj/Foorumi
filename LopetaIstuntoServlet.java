package foorumi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Tuukka on 7.11.2017.
 */

@WebServlet(name = "LopetaIstuntoServlet" , urlPatterns = {"/Lopetus"})
public class LopetaIstuntoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Cookie keksiKirjaudu = null;
        Cookie[] keksit = request.getCookies();
        if (keksit != null) {
            for (Cookie keksi : keksit) {
                if (keksi.getName().equals("user")) {
                    keksiKirjaudu = keksi;
                    break;
                }
            }
        }
        if (keksiKirjaudu != null) {
            keksiKirjaudu.setMaxAge(0);
            response.addCookie(keksiKirjaudu);
            response.sendRedirect("/Kirjautumissivu");

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}