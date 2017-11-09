package foorumi;

import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
/**
 * Created by Ville on 7.11.2017.
 */
@WebServlet(name = "ProfiiliServlet", urlPatterns = "/Profiili")
public class ProfiiliServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession s = request.getSession();
        String nimi = (String) s.getAttribute("nimi");
        String uusinimi = request.getParameter("nimi");
        String salasana = request.getParameter("salasana");
        String kuvaus = request.getParameter("kuvaus");
        String kuvaus2 = (String) s.getAttribute("kuvaus");

        try {
            Connection con = ds.getConnection();

            String sql = "Update henkilo set kuvaus='" + kuvaus + "', nimi='" + uusinimi +"' WHERE nimi='" + nimi + "'";
            PreparedStatement stmt = con.prepareStatement(sql);


            stmt.executeUpdate(sql);
            stmt.execute();
            System.out.println("Yhteys saatiin!");
            System.out.println(nimi);
            s.setAttribute("nimi", uusinimi);
            s.setAttribute("kuvaus", kuvaus);
            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! "+ e.getMessage());
        }
        response.sendRedirect("index.jsp");

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
