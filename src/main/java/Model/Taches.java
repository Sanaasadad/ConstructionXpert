package Model;


import java.sql.Date;

public class Taches {

    String description;
    Date dateDebut;
    Date dateFin;
   int projet_id, id;

    public String getDescription() {
        return description;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public int getProjet_id() {
        return projet_id;
    }

    public int getId() {
        return id;
    }

    public void setProjet_id(int projet_id) {
        this.projet_id = projet_id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }
    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }
}
