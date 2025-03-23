package Dao;

import Configuration.DBConnection;
import Model.Projets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class projetDao {
    public static void ajouterProjet(Projets projet) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO Projets(nom,description,dateDebut,dateFin,budget) VALUES (?,?,?,?,?)";
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, projet.getNom());
        ps.setString(2, projet.getDescription());
        ps.setDate(3, projet.getDateDebut());
        ps.setDate(4, projet.getDateFin());
        ps.setDouble(5, projet.getBudget());
        ps.executeUpdate();
    }

    public static List<Projets> getAllProjet() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Projets";
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<Projets> projetList = new ArrayList<>();
        while ((rs.next())){
            Projets projet = new Projets();
            projet.setId(rs.getInt("id"));
            projet.setNom(rs.getString("nom"));
            projet.setDateFin(rs.getDate("dateFin"));
            projet.setDateDebut(rs.getDate("dateDebut"));
            projet.setDescription(rs.getString("description"));
            projet.setBudget(rs.getDouble("budget"));
            projetList.add(projet);
        }
        return projetList;
    }

    public static Projets getProjetById(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Projets WHERE id = ?";
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Projets projet = new Projets();
        if ((rs.next())){
            projet.setId(rs.getInt("id"));
            projet.setNom(rs.getString("nom"));
            projet.setDateFin(rs.getDate("dateFin"));
            projet.setDateDebut(rs.getDate("dateDebut"));
            projet.setDescription(rs.getString("description"));
            projet.setBudget(rs.getDouble("budget"));
        }
        return projet;
    }

    public static void modifierProjet(Projets projet) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE Projets SET nom = ? ,description = ?,dateDebut=?,dateFin=?,budget=? WHERE id=?";
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, projet.getNom());
        ps.setString(2, projet.getDescription());
        ps.setDate(3, projet.getDateDebut());
        ps.setDate(4, projet.getDateFin());
        ps.setDouble(5, projet.getBudget());
        ps.setInt(6, projet.getId());
        ps.executeUpdate();
    }

    public static void suprimerProjet(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM projets WHERE id = ?";
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }
    public static List<Projets> ListerProjets() throws SQLException, ClassNotFoundException {
        List<Projets> projets = new ArrayList<>();
        String sql = "SELECT id, nom FROM projets"; // Assurez-vous que la table s'appelle "projets"

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Projets projet = new Projets();
                projet.setId(rs.getInt("id"));
                projet.setNom(rs.getString("nom"));
                projets.add(projet);
            }
        }
        return projets;
    }
}