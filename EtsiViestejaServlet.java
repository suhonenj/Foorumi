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


@WebServlet(name = "EtsiViestejaServlet", urlPatterns = "/EtsiViesteja")
public class EtsiViestejaServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        String tulos2=null;
        String etsittava = request.getParameter("etsiotsikko");
        String viesti2 = request.getParameter("etsiviesti");
        try {
            Connection con = ds.getConnection();
            String sql = "Select otsikko, viesti from viesti where otsikko like ? and viesti like ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1,"%"+ etsittava +"%");
            stmt.setString(2, "%" + viesti2 +"%");
            //stmt.setString(2,viesti);
            ResultSet rs = stmt.executeQuery();

          if (!rs.next()) {
              sb.append("ei tuloksia");
          } else
            do {
                if (etsittava.isEmpty() && viesti2.isEmpty()) {
                    sb.append("ei tuloksia");
                    break;
                } else {
                    String otsikko = rs.getString("otsikko");
                    String viesti = rs.getString("viesti");
                    sb.append(otsikko + "<br>");
                    sb.append(viesti + "<br>");

                }
            } while (rs.next());

            tulos2 = sb.toString();
            request.setAttribute("tulos2",tulos2);
            request.getRequestDispatcher("Etsi.jsp").forward(request,response);

            System.out.println("Yhteys saatiin!");
            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! " + e.getMessage());
        }
    }
}