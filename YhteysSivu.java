package foorumi;


import java.sql.*;

/**
 * Created by Tuukka on 7.11.2017.
 */
public class YhteysSivu {

    public static void main(String[] args) throws SQLException {
        avaaYhteys();
    }
    static boolean avaaYhteys() { //avataan yhteys tietokantaan
        boolean ok = true;
        try {
            String url = "jdbc:mysql://localhost:3306/foorumi?useSSL=false"; // asetetaan urli
            try {
                Connection con = null;
                con = DriverManager.getConnection(url, "root", "salasana");
                String sql = "select alueid,nimi,kuvaus from alue";
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    System.out.println(rs.getString(1));
                    System.out.printf(rs.getString(2));
                    System.out.printf(rs.getString(3    ));
                }
                System.out.println("Yhteys saatiin!");
                System.out.println("Tervetuloa muokkaamaan oppilaiden tietoja! Valitse alta toimenpide ja paina Enter");
                //tähän kohtaan vaihtoehdot
            } catch (SQLException e) {
                System.err.println("Yhteys epäonnistui! ");
                ok = false;
            }
        } catch (Exception e) { //heittää pikkeuksen miäli yhteys ei toimi
            System.err.println("Epäonnistui!");
            ok = false;
        } finally {
            return ok;
        }
    }
}
