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
@WebServlet(name = "HaeKeskusteluServlet", urlPatterns = "/HaeKeskustelu")
public class HaeKeskusteluServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                    String sql = "Select alueid, aihe, otsikko, viesti from viesti where alueid=? order by id desc limit 2";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, alueid);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        yleinen.append("<tr><th colspan=2>" + rs.getString("otsikko") + "</th><tr>");
                        yleinen.append("<tr><td>" + rs.getString("viesti") + "</td></tr>");
                    }
                } else if (alueid==2){
                    String sql = "Select alueid, aihe, otsikko, viesti from viesti where alueid=? order by id desc limit 2";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, alueid);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        salainen.append("<tr><th colspan=2>" + rs.getString("otsikko") + "</th><tr>");
                        salainen.append("<tr><td>" + rs.getString("viesti") + "</td></tr>");
                    }
                } else if (alueid==3){
                    String sql = "Select alueid, aihe, otsikko, viesti from viesti where alueid=? order by id desc limit 2";
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setInt(1, alueid);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        erikoinen.append("<tr><th colspan=2>" + rs.getString("otsikko") + "</th><tr>");
                        erikoinen.append("<tr><td>" + rs.getString("viesti") + "</td></tr>");
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
