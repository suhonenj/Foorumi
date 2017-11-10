package foorumi;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;

/**
 * Created by Tuukka on 8.11.2017.
 */
@WebServlet(name = "HaeAlueServlet", urlPatterns = "/HaeAlue")
public class HaeAlueServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            StringBuilder sb = new StringBuilder();
            Connection con = ds.getConnection();
            Integer a = Integer.parseInt(request.getParameter("name"));
            String sql = " Select viesti.otsikko, viesti.viesti, viesti.kirjoitettu, henkilo.nimi, alue.nimi, alue.alueid from alue inner join viesti on alue.alueid=viesti.alueid inner join henkilo on kirjoittaja=hloid where alue.alueid=? order by viesti.id DESC ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,a);
            ResultSet rs = stmt.executeQuery();
            sb.append("<table>");
            while (rs.next()) {
                String otsikko = rs.getString("otsikko");
                String viesti = rs.getString("viesti");
                Date aika=rs.getDate(3);
                String nimi = rs.getString(4);
                String alue = rs.getString(5);
                int alueid = rs.getInt(6);
                Time klo = rs.getTime(3);
                sb.append("<tr><th class='vasen'>"+otsikko+"</th><th>" + nimi+
                        "</th><th><a href='HaeAlue?name="+alueid+"'>" + alue +
                        " keskustelu</a></th><th class='oikea'>Lähetetty: "+aika+"<br>klo " +klo+"</th></tr>");
                sb.append("<tr><td colspan='4'>"+viesti+"</td></tr>");
            }
            sb.append("</table>");
            String tavara = sb.toString();
            request.setAttribute("tavara", tavara);
            if(a==1){
                request.getRequestDispatcher("Yleinen.jsp").forward(request,response);
            } else if (a==2){
                request.getRequestDispatcher("Salainen.jsp").forward(request,response);
            } else if (a==3){
                request.getRequestDispatcher("Erikoinen.jsp").forward(request,response);
            }

            System.out.println("Yhteys saatiin!");
            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! " + e.getMessage());
        }
    }
}
