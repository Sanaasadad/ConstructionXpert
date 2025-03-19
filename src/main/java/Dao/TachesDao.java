package Dao;

import Configuration.DBConnection;
import Model.Taches;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TachesDao {

    public static List<Taches> getAllTaches() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM TACHES";
        Connection connection = DBConnection.getConnection();
        PreparedStatement st = connection.prepareStatement(sql);
        List<Taches> tachesList = new ArrayList<>();
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Taches taches = new Taches();
            taches.setId(rs.getInt("id"));
            taches.setDescription(rs.getString("description"));
            taches.setDateDebut(rs.getDate("date_debut"));
            taches.setDateFin(rs.getDate("date_fin"));
            taches.setProjet_id(rs.getInt("projet_id"));
            tachesList.add(taches);
        }


        return tachesList;
    }


    public static void CreeTache(Taches taches) throws SQLException, ClassNotFoundException {
       String sql ="insert into Taches (description,dateDebut,dateFin,projet_id ) values (?,?,?,?)";
        Connection connection= DBConnection.getConnection();
        PreparedStatement Statement = connection.prepareStatement(sql);
        Statement.setString(1, taches.getDescription());
        Statement.setDate(2, taches.getDateDebut());
        Statement.setDate(3, taches.getDateFin());
        Statement.setInt(4, taches.getProjet_id());
        Statement.executeUpdate();
    }
}
