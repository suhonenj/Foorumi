package foorumi;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
/**
 * Created by Ville on 7.11.2017.
 */
@WebServlet(name = "KirjauduServlet", urlPatterns = "/Kirjaudu")
public class KirjauduServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nimi = request.getParameter("nimi");
        String salasana = request.getParameter("salasana");

        try {
            Connection con = ds.getConnection();
            String sql = "Select nimi, salasana, kuvaus, hloid from henkilo where nimi =? and salasana=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, nimi);
            stmt.setString(2, salasana);
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {

                HttpSession session = request.getSession();

                session.invalidate();
                request.setAttribute("errorMessage", "Käyttäjätunnus tai salasana on väärä!");
                RequestDispatcher rd = request.getRequestDispatcher("Kirjaudu.jsp");
                rd.forward(request, response);
            } else {
                HttpSession istunto = request.getSession(true);
                String kjanimi = request.getParameter("nimi");
                String salasana1 = request.getParameter("salasana");
                int hloid = rs.getInt(4);

                String kuvaus1 = rs.getString("kuvaus");
                istunto.setAttribute("nimi", kjanimi);
                istunto.setAttribute("salasana", salasana1);
                istunto.setAttribute("kuvaus", kuvaus1);
                istunto.setAttribute("hloid",hloid);
                response.sendRedirect("HaeKeskustelu");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}