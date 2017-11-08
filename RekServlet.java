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
import java.sql.*;
/**
 * Created by Tuukka on 7.11.2017.
 */
@WebServlet(name = "RekServlet", urlPatterns = "/Rekisteroidy")
public class RekServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession istunto = request.getSession(false);
//        Integer kayttaja = Integer.parseInt(request.getParameter("kayttaja"));
        String nimi = request.getParameter("nimi");
        String salasana = request.getParameter("salasana");
        String salasanab= request.getParameter("salasanab");
        if (!salasana.equals(salasanab)){
            System.out.println("Salasana ei täsmää");
            response.sendRedirect("Rek.jsp");

        }
//        istunto.setAttribute("kayttaja", kayttaja);
//        istunto.setAttribute("otsikko", otsikko);
//        istunto.setAttribute("viesti", viesti);
        try {
            Connection con = ds.getConnection();
            String sql = "Select nimi from henkilo where nimi = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1,nimi);
            ResultSet rs =stmt.executeQuery();
            if (rs.next()) {
                System.out.println("Nimimerkki varattu");
                response.sendRedirect("Rek.jsp");

            } else {
                String sql1 = "Insert into henkilo (nimi, salasana) values(?,?)";
                PreparedStatement prep = con.prepareStatement(sql1);
                prep.setString(1, nimi);
                prep.setString(2, salasana);
                prep.execute();
                response.sendRedirect("index.jsp");

            }
            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! "+ e.getMessage());
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}