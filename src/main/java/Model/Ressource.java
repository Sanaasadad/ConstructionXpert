package Model;

public class Ressource {
    int id;
    String nom;
    String type;
    String nom_fournisseur ;
    int quantite;
    int taches_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getNom_fournisseur() {
        return nom_fournisseur;
    }

    public void setNom_fournisseur(String nom_fournisseur) {
        this.nom_fournisseur = nom_fournisseur;
    }

    public int getTaches_id() {
        return taches_id;
    }

    public void setTaches_id(int taches_id) {
        this.taches_id = taches_id;
    }
}
