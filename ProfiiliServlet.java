package foorumi;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Tuukka on 9.11.2017.
 */
@WebServlet(name = "ProfiiliServlet", urlPatterns = "/Profiili")
public class ProfiiliServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
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