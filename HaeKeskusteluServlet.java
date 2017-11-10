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
import java.sql.*;

/**
 * Created by Tuukka on 8.11.2017.
 */
@WebServlet(name = "HaeKeskusteluServlet", urlPatterns = "/HaeKeskustelu")
public class HaeKeskusteluServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession istunto = request.getSession();
        StringBuilder sb = new StringBuilder();
        StringBuilder yleinen = new StringBuilder();
        StringBuilder erikoinen = new StringBuilder();
        StringBuilder salainen = new StringBuilder();
        try {
            Connection con = ds.getConnection();
            String a;
            String b;
            String c;

            String juttu = "Select DISTINCT alueid from viesti";
            PreparedStatement lause = con.prepareStatement(juttu);
            ResultSet set = lause.executeQuery();
            while (set.next()) {
                int alueid = set.getInt(1);
                if(alueid==1) {
                    String sql = " Select viesti.otsikko, viesti.viesti, viesti.kirjoitettu, henkilo.nimi, alue.nimi, alue.alueid from alue inner join viesti on alue.alueid=viesti.alueid inner join henkilo on kirjoittaja=hloid where alue.alueid=? order by viesti.id DESC limit 2";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, alueid);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        String otsikko = rs.getString("otsikko");
                        String viesti = rs.getString("viesti");
                        Date aika=rs.getDate(3);
                        String nimi = rs.getString(4);
                        String alue = rs.getString(5);
                        int aluetunnus = rs.getInt(6);
                        Time klo = rs.getTime(3);
                        yleinen.append("<tr class='tr'><th class='vasen'>"+otsikko+"</th><th>" + nimi+
                                "</th><th><a href='HaeAlue?name="+alueid+"'>" + alue +
                                " keskustelu</a></th><th class='oikea'>Lähetetty: "+aika+"<br>klo " +klo+"</th></tr>");
                        yleinen.append("<tr><td colspan='4'>"+viesti+"</td></tr>");
                    }
                } else if (alueid==2){
                    String sql = " Select viesti.otsikko, viesti.viesti, viesti.kirjoitettu, henkilo.nimi, alue.nimi, alue.alueid from alue inner join viesti on alue.alueid=viesti.alueid inner join henkilo on kirjoittaja=hloid where alue.alueid=? order by viesti.id DESC limit 2";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, alueid);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        String otsikko = rs.getString("otsikko");
                        String viesti = rs.getString("viesti");
                        Date aika=rs.getDate(3);
                        String nimi = rs.getString(4);
                        String alue = rs.getString(5);
                        int aluetunnus = rs.getInt(6);
                        Time klo = rs.getTime(3);
                        salainen.append("<tr class='tr'><th class='vasen'>"+otsikko+"</th><th>" + nimi+
                                "</th><th><a href='HaeAlue?name="+alueid+"'>" + alue +
                                " keskustelu</a></th><th class='oikea'>Lähetetty: "+aika+", klo " +klo+"</th></tr>");
                        salainen.append("<tr><td colspan='4'>"+viesti+"</td></tr>");
                    }
                } else if (alueid==3){
                    String sql = " Select viesti.otsikko, viesti.viesti, viesti.kirjoitettu, henkilo.nimi, alue.nimi, alue.alueid from alue inner join viesti on alue.alueid=viesti.alueid inner join henkilo on kirjoittaja=hloid where alue.alueid=? order by viesti.id DESC limit 2";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, alueid);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        String otsikko = rs.getString("otsikko");
                        String viesti = rs.getString("viesti");
                        Date aika=rs.getDate(3);
                        String nimi = rs.getString(4);
                        String alue = rs.getString(5);
                        int aluetunnus = rs.getInt(6);
                        Time klo = rs.getTime(3);
                        erikoinen.append("<tr class='tr'><th class='vasen'>"+otsikko+"</th><th>" + nimi+
                                "</th><th><a href='HaeAlue?name="+alueid+"'>" + alue +
                                " keskustelu</a></th><th class='oikea'>Lähetetty: "+aika+", klo " +klo+"</th></tr>");
                        erikoinen.append("<tr><td colspan='4'>"+viesti+"</td></tr>");
                    }
                }

            }
            c=erikoinen.toString();
            b=salainen.toString();
            a = yleinen.toString();
            request.setAttribute("yleinen", a);
            request.setAttribute("salainen",b);
            request.setAttribute("erikoinen",c);
            request.getRequestDispatcher("Foorumi.jsp").forward(request, response);
            System.out.println("Yhteys saatiin!");


            //tähän kohtaan vaihtoehdot
        } catch (SQLException e) {
            System.err.println("Yhteys epäonnistui! " + e.getMessage());
        }
    }
}
