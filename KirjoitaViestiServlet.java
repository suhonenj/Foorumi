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
@WebServlet(name = "KirjoitaViestiServlet", urlPatterns = "/KirjoitaViesti")
public class KirjoitaViestiServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession istunto = request.getSession(false);
//        Integer kayttaja = Integer.parseInt(request.getParameter("kayttaja"));
        String otsikko = request.getParameter("otsikko");
        String viesti = request.getParameter("viesti");
//        istunto.setAttribute("kayttaja", kayttaja);
//        istunto.setAttribute("otsikko", otsikko);
//        istunto.setAttribute("viesti", viesti);
        try {
            Connection con = ds.getConnection();
            String sql = "Insert into viesti (otsikko,viesti) values (?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1,otsikko);
            stmt.setString(2,viesti);
            stmt.execute();
            System.out.println("Yhteys saatiin!");
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