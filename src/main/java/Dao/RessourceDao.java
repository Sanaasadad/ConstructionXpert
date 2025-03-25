package Dao;

import Configuration.DBConnection;
import Model.Ressource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RessourceDao {

        public static void AjouterRessource(Ressource ressource) throws SQLException, ClassNotFoundException {
            String sql = "INSERT INTO Ressource(nom, type, nom_fournisseur, quantite, Taches_id) VALUES (?, ?, ?, ?, ?)";
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, ressource.getNom());
                ps.setString(2, ressource.getNom_fournisseur());
                ps.setString(3, ressource.getType());
                ps.setInt(4, ressource.getQuantite());
                ps.setInt(5, ressource.getTaches_id());
                ps.executeUpdate();
            }
        }

        public static List<Ressource> getAllRessources() throws SQLException, ClassNotFoundException {
            String sql = "SELECT * FROM Ressource";
            List<Ressource> ressources = new ArrayList<>();

            try (Connection con = DBConnection.getConnection();
                 Statement st = con.createStatement();
                 ResultSet rs = st.executeQuery(sql)) {

                while (rs.next()) {
                    Ressource r = new Ressource();
                    r.setId(rs.getInt("id"));
                    r.setNom(rs.getString("nom"));
                    r.setNom_fournisseur(rs.getString("nom_fournisseur"));
                    r.setType(rs.getString("type"));
                    r.setQuantite(rs.getInt("quantite"));
                    r.setTaches_id(rs.getInt("Taches_id"));
                    ressources.add(r);
                }
            }
            return ressources;
        }
        public static void editRessource(Ressource ressource) throws SQLException, ClassNotFoundException {
            String sql = "UPDATE Ressource SET nom= ?, nom_fournisseur= ?, type= ?, quantite= ?, Taches_id= ? WHERE id=? ";
            try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, ressource.getNom());
                ps.setString(2, ressource.getNom_fournisseur());
                ps.setString(3, ressource.getType());
                ps.setInt(4, ressource.getQuantite());
                ps.setInt(5, ressource.getTaches_id());
                ps.setInt(6, ressource.getId());
                ps.executeUpdate();
            }
        }
        public static void deleteRessource(int id) throws SQLException, ClassNotFoundException {
            String sql = "DELETE FROM Ressource WHERE id=?";
            try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1,id);
                ps.executeUpdate();
            }
        }

    public static Ressource getRessourceById(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM Ressource WHERE id=?";
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Ressource re = new Ressource();
        if (rs.next()) {
            re.setId(rs.getInt("id"));
            re.setNom(rs.getString("nom"));
            re.setNom_fournisseur(rs.getString("nom_fournisseur"));
            re.setType(rs.getString("type"));
            re.setQuantite(rs.getInt("quantite"));
            re.setTaches_id(rs.getInt("Taches_id"));
        }


        return re;
    }
}

