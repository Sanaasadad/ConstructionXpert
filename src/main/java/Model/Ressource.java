package Model;

public class Ressource {
    int id;
    String nom;
    String description;
    int quantite;
    Double cout;
    int Taches_id;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public Double getCout() {
        return cout;
    }

    public void setCout(Double cout) {
        this.cout = cout;
    }

    public int getTaches_id() {
        return Taches_id;
    }

    public void setTaches_id(int taches_id) {
        Taches_id = taches_id;
    }
}
