package foorumi;

import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


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
        request.setCharacterEncoding("UTF-8");
        try {
            Connection con = ds.getConnection();
            String sql = "select viesti.otsikko, viesti.viesti, henkilo.nimi, viesti.kirjoitettu, alue.nimi, alue.alueid from alue inner join viesti on alue.alueid=viesti.alueid inner join henkilo on kirjoittaja=hloid where viesti like ?";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, "%" + viesti2 +"%");
            //stmt.setString(2,viesti);
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                sb.append("ei tuloksia");
            } else
                do {
                    if (viesti2.isEmpty()) {
                        sb.append("ei tuloksia");
                        break;
                    } else {
                        String otsikko = rs.getString(1);
                        String viesti = rs.getString(2);
                        Date aika=rs.getDate(4);
                        String nimi = rs.getString(3);
                        String alue = rs.getString(5);
                        int alueid = rs.getInt(6);
                        Time klo = rs.getTime(4);
                        sb.append("<tr class='tr'><th class='vasen'>"+otsikko+"</th><th>" + nimi+
                                "</th><th><a href='HaeAlue?name="+alueid+"'>" + alue +
                                " keskustelu</a></th><th class='oikea'>Lähetetty: "+aika+", klo " +klo+"</th></tr>");
                        sb.append("<tr><td colspan='4'>"+viesti+"</td></tr>");

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