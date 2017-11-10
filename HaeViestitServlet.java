package foorumi;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

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
        HttpSession istunto = request.getSession();
        String kjanimi =(String)istunto.getAttribute("nimi");
        try {
            Connection con = ds.getConnection();
            String sql=null;
            if (kjanimi!=null){
                sql = " Select viesti.otsikko, viesti.viesti, viesti.kirjoitettu, henkilo.nimi, alue.nimi, alue.alueid from alue inner join viesti on alue.alueid=viesti.alueid inner join henkilo on kirjoittaja=hloid order by viesti.id DESC limit 10";

            } else {
                sql = " Select viesti.otsikko, viesti.viesti, viesti.kirjoitettu, henkilo.nimi, alue.nimi, alue.alueid from alue inner join viesti on alue.alueid=viesti.alueid inner join henkilo on kirjoittaja=hloid where alue.alueid!=2 order by viesti.id DESC limit 10";
            }
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            sb.append("<table>");

            while (rs.next()) {
                String otsikko = rs.getString("otsikko");
                String viesti = rs.getString("viesti");
                Date aika=rs.getDate(3);
                String nimi = rs.getString(4);
                String alue = rs.getString(5);
                Time klo = rs.getTime(3);
                int alueid = rs.getInt(6);
                sb.append("<tr><th style='text-align:left'>"+otsikko+"</th><th>" + nimi+ "</th><th><a href='HaeAlue?name="+alueid+"'>" + alue +" keskustelu</a></th><th style='text-align:right'>Lähetetty: "+aika+"<br>klo " +klo+"</th></tr>");
                sb.append("<tr><td colspan='4'>"+viesti+"</td></tr>");
            }
            sb.append("</table>");

            tulos = sb.toString();
            request.setAttribute("tulos",tulos);
            if(tulos.isEmpty())
                request.setAttribute("tulos","");
            request.getRequestDispatcher("index.jsp").forward(request,response);

            System.out.println("Yhteys saatiin!");
            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! " + e.getMessage());
        }
    }
}
