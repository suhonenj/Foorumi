package foorumi;

import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Tuukka on 7.11.2017.
 */
@WebServlet(name = "HaeViestitServlet", urlPatterns = "/HaeViestit")
public class HaeViestitServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        String tulos=null;
        try {
            Connection con = ds.getConnection();
            String sql = "Select otsikko, viesti from viesti order by id desc";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String otsikko = rs.getString("otsikko");
                String viesti = rs.getString("viesti");
                sb.append(otsikko + "<br>");
                sb.append(viesti + "<br>");
            }
            tulos = sb.toString();
            request.setAttribute("tulos",tulos);
            request.getRequestDispatcher("index.jsp").forward(request,response);

            System.out.println("Yhteys saatiin!");
            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! " + e.getMessage());
        }
    }
}
