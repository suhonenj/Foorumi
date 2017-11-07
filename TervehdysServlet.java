package foorumi;

import javax.servlet.RequestDispatcher;
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

@WebServlet(name = "TervehdysServlet"  , urlPatterns = {"/Kirjautumissivu"})
public class TervehdysServlet extends HttpServlet {
    String kayttaja = "Sonja";
    String salasana = "testi";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String haeKayttaja = request.getParameter("user");
        String haeSalasana = request.getParameter("salasana");


        if (kayttaja.equals(haeKayttaja) && salasana.equals(haeSalasana)) {
            Cookie kirjauduKeksi = new Cookie("user", haeKayttaja);
            kirjauduKeksi.setMaxAge(10 * 60);
            response.addCookie(kirjauduKeksi);
            response.sendRedirect("/Foorumi/Istuntosivu");
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Istuntosivu");
            PrintWriter ulos = response.getWriter();
            ulos.println("Käyttäjänimi tai salasana väärin!");
            rd.include(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

