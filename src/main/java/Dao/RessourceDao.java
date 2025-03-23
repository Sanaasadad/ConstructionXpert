package Dao;

import Configuration.DBConnection;
import Model.Ressource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RessourceDao {
 public void AjouterRessource(Ressource ressource) throws SQLException, ClassNotFoundException {
     String sql = "insert into Ressource(nom, description, quantite, cout, Taches_id) values(?,?,?,?,?)";
     Connection con = DBConnection.getConnection();
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, ressource.getNom());
     ps.setString(2, ressource.getDescription());
     ps.setInt(3, ressource.getQuantite());
     ps.setDouble(4, ressource.getCout());
     ps.setInt(5, ressource.getTaches_id());
     ps.executeUpdate();
 }

 public List<Ressource> ressourceList() throws SQLException, ClassNotFoundException {

 }

     }


