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


@WebServlet(name = "HaeProfiilitServlet", urlPatterns = "/HaeProfiileja")
public class HaeProfiilitServlet extends HttpServlet {
    @Resource(name = "jdbc/Foorumi")
    DataSource ds;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        String profiilit = null;
        String etsittava = request.getParameter("etsiprofiili");
        try {
            Connection con = ds.getConnection();
            String sql = "Select nimi, kuvaus from henkilo where nimi like ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, "%" + etsittava + "%");

            //stmt.setString(2,viesti);
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                sb.append("ei tuloksia");
            } else
                do {
                    if (etsittava.isEmpty()) {
                        sb.append("ei tuloksia");
                        break;
                    } else {

                        String nimi = rs.getString("nimi");
                        String kuvaus =rs.getString("kuvaus");

                        sb.append(nimi + "<br>");
                        sb.append(kuvaus + "<br>");

                    }
                } while (rs.next());

            profiilit = sb.toString();
            request.setAttribute("profiilit", profiilit);
            request.getRequestDispatcher("HaeProfiilit.jsp").forward(request, response);

            System.out.println("Yhteys saatiin!");
            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! " + e.getMessage());
        }
    }
}
