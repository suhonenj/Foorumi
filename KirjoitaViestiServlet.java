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
@WebServlet(name = "foorumi.KirjoitaViestiServlet", urlPatterns = "/KirjoitaViesti")
public class KirjoitaViestiServlet extends HttpServlet {
    @Resource(name="jdbc/Foorumi")
    DataSource ds;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession istunto = request.getSession();
        int hloid=(int)istunto.getAttribute("hloid");
        request.setCharacterEncoding("UTF-8");
        String otsikko = request.getParameter("otsikko");
        String viesti = request.getParameter("viesti");
        Integer alueid= Integer.parseInt(request.getParameter("name"));
//        istunto.setAttribute("kayttaja", kayttaja);
//        istunto.setAttribute("otsikko", otsikko);
//        istunto.setAttribute("viesti", viesti);
            try {
                Connection con = ds.getConnection();
                String sql = "Insert into viesti (alueid,otsikko,viesti, kirjoittaja) values (?,?,?,?)";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1,alueid);
                stmt.setString(2,otsikko);
                stmt.setString(3,viesti);
                stmt.setInt(4,hloid);
                stmt.execute();

                System.out.println("Yhteys!");
                //tähän kohtaan vaihtoehdot
            } catch (SQLException e) {
                System.err.println("Yhteys epäonnistui! "+ e.getMessage());
            }
            request.setAttribute("alueid",alueid);
            if(alueid==1){
                request.getRequestDispatcher("/HaeAlue").forward(request,response);
            } else if (alueid==2){
                request.getRequestDispatcher("/HaeAlue").forward(request,response);
            } else if (alueid==3){
                request.getRequestDispatcher("/HaeAlue").forward(request,response);
            }
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }
}
