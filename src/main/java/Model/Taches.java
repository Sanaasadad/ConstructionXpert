package Model;


import java.sql.Date;

public class Taches {

        private String description;
        private Date dateDebut;
        private Date dateFin;
        private int projet_id;
        private int id;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public int getProjet_id() {
        return projet_id;
    }

    public void setProjet_id(int projet_id) {
        this.projet_id = projet_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
