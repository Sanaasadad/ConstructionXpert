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
            taches.setDateDebut(rs.getDate("dateDebut"));
            taches.setDateFin(rs.getDate("dateFin"));
            taches.setProjet_id(rs.getInt("projet_id"));
            tachesList.add(taches);
        }


        return tachesList;
    }


    public static void CreeTache(Taches taches) throws SQLException, ClassNotFoundException {
        String sql = "insert into Taches (description,dateDebut,dateFin,projet_id ) values (?,?,?,?)";
        Connection connection = DBConnection.getConnection();
        PreparedStatement Statement = connection.prepareStatement(sql);
        Statement.setString(1, taches.getDescription());
        Statement.setDate(2, taches.getDateDebut());
        Statement.setDate(3, taches.getDateFin());
        Statement.setInt(4, taches.getProjet_id());
        Statement.executeUpdate();
    }

    public static Taches gettachesById(int id ) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM TACHES WHERE id= ?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement Statement = connection.prepareStatement(sql);
        Statement.setInt(1, id);
        ResultSet rs = Statement.executeQuery();
        Taches taches = null;
        while (rs.next()) {
            taches = new Taches();
            taches.setId(rs.getInt("id"));
            taches.setDescription(rs.getString("description"));
            taches.setDateDebut(rs.getDate("dateDebut"));
            taches.setDateFin(rs.getDate("dateFin"));
            taches.setProjet_id(rs.getInt("projet_id"));

        }
        return taches;
    }

    public static void editTache(Taches tache) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE taches SET description = ?, dateDebut = ?, dateFin = ?, projet_id = ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, tache.getDescription());
            ps.setDate(2, tache.getDateDebut());
            ps.setDate(3, tache.getDateFin());
            ps.setInt(4, tache.getProjet_id());
            ps.setInt(5, tache.getId()); // Assurez-vous que l'ID est bien défini
            ps.executeUpdate();
        }
    }


    public static void deleteTache(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM taches WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    public static List<Taches> getTachesByProjetId(int projetId) throws SQLException, ClassNotFoundException {
            String sql = "SELECT * FROM Taches WHERE projet_id = ?";
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, projetId);
            ResultSet rs = statement.executeQuery();

            List<Taches> tachesList = new ArrayList<>();
            while (rs.next()) {
                Taches tache = new Taches();
                tache.setId(rs.getInt("id"));
                tache.setDescription(rs.getString("description"));
                tache.setDateDebut(rs.getDate("dateDebut"));
                tache.setDateFin(rs.getDate("dateFin"));
                tache.setProjet_id(rs.getInt("projet_id"));
                tachesList.add(tache);
            }
            return tachesList;
        }
    }

