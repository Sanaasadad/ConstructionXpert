package Controller;
import Dao.projetDao;
import Dao.TachesDao;
import Model.Projets;
import Model.Taches;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Taches")
public class TachesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list"; // Par défaut, afficher la liste des tâches
        }

        try {
            switch (action) {
                case "list":
                    afficherTaches(req, resp);
                    break;
                case "add":
                    // Récupérer la liste des projets et la passer à la JSP
                    List<Projets> listeProjets = projetDao.ListerProjets(); // Assurez-vous que cette méthode existe
                    System.out.println("Nombre de projets récupérés : " + listeProjets.size()); // Log pour vérifier
                    for (Projets projet : listeProjets) {
                        System.out.println("Projet : " + projet.getNom() + " (ID: " + projet.getId() + ")");
                    }
                    req.setAttribute("listeProjets", listeProjets);
                    req.getRequestDispatcher("/Taches/ajouterTache.jsp").forward(req, resp);
                    break;
                case "update":
                    int id = Integer.parseInt(req.getParameter("id"));
                    Taches tache = TachesDao.gettachesById(id); // Récupérer la tâche par son ID
                    if (tache != null) {
                        // Récupérer la liste des projets et la passer à la JSP
                        List<Projets> listeProjetsUpdate = projetDao.ListerProjets(); // Assurez-vous que cette méthode existe
                        System.out.println("Nombre de projets récupérés pour la mise à jour : " + listeProjetsUpdate.size()); // Log pour vérifier
                        req.setAttribute("listeProjets", listeProjetsUpdate);
                        req.setAttribute("tache", tache); // Définir l'attribut pour la JSP
                        req.getRequestDispatcher("/Taches/editTache.jsp").forward(req, resp);
                    } else {
                        req.setAttribute("errorMessage", "Tâche non trouvée.");
                        req.getRequestDispatcher("/Taches/TachesList.jsp").forward(req, resp);
                    }
                    break;
                case "delete":
                    deleteTachesByProjetId(req, resp);
                    break;
                default:
                    afficherTaches(req, resp);
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log l'erreur
            req.setAttribute("errorMessage", "Une erreur s'est produite. Veuillez réessayer.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp); // Rediriger vers une page d'erreur
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list"; // Par défaut, afficher la liste des tâches
        }

        try {
            switch (action) {
                case "add":
                    ajouterTaches(request, response);
                    break;
                case "update":
                    editTaches(request, response);
                    break;
                default:
                    afficherTaches(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


    private void afficherTaches(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        List<Taches> tachesList = TachesDao.getAllTaches(); // Récupérer la liste des tâches
        request.setAttribute("TachesList", tachesList); // Définir l'attribut pour la JSP
        request.getRequestDispatcher("/Taches/TachesList.jsp").forward(request, response); // Rediriger vers la JSP
    }

    private void ajouterTaches(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        // Validation des données
        String description = request.getParameter("description");
        String dateDebut = request.getParameter("dateDebut");
        String dateFin = request.getParameter("dateFin");
        String projetIdStr = request.getParameter("projetId"); // Récupérer le paramètre en tant que chaîne

        // Vérifier que tous les champs sont présents et non vides
        if (description == null || description.isEmpty() ||
                dateDebut == null || dateDebut.isEmpty() ||
                dateFin == null || dateFin.isEmpty() ||
                projetIdStr == null || projetIdStr.isEmpty()) {
            request.setAttribute("errorMessage", "Tous les champs sont obligatoires.");
            request.getRequestDispatcher("/Taches/ajouterTache.jsp").forward(request, response);
            return;
        }

        // Convertir projetId en entier
        int projetId;
        try {
            projetId = Integer.parseInt(projetIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "L'ID du projet est invalide.");
            request.getRequestDispatcher("/Taches/ajouterTache.jsp").forward(request, response);
            return;
        }

        // Créer la tâche
        Taches tache = new Taches();
        tache.setDescription(description);
        tache.setDateDebut(Date.valueOf(dateDebut));
        tache.setDateFin(Date.valueOf(dateFin));
        tache.setProjet_id(projetId);

        // Enregistrer la tâche dans la base de données
        TachesDao.CreeTache(tache);

        // Rediriger vers la liste des tâches
        response.sendRedirect("Taches?action=list");
    }
    private void editTaches(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        // Validation des données
        int id = Integer.parseInt(request.getParameter("id")); // Récupérer l'ID de la tâche
        String description = request.getParameter("description");
        String dateDebut = request.getParameter("dateDebut");
        String dateFin = request.getParameter("dateFin");
        int projetId = Integer.parseInt(request.getParameter("projetId"));

        if (description == null || description.isEmpty() || dateDebut == null || dateFin == null || projetId <= 0) {
            request.setAttribute("errorMessage", "Tous les champs sont obligatoires.");
            request.getRequestDispatcher("/Taches/editTache.jsp").forward(request, response);
            return;
        }

        // Créer l'objet Taches
        Taches tache = new Taches();
        tache.setId(id); // Définir l'ID de la tâche
        tache.setDescription(description);
        tache.setDateDebut(Date.valueOf(dateDebut));
        tache.setDateFin(Date.valueOf(dateFin));
        tache.setProjet_id(projetId);

        // Mettre à jour la tâche dans la base de données
        TachesDao.editTache(tache);

        // Rediriger vers la liste des tâches
        response.sendRedirect("Taches?action=list");
    }

    private void deleteTachesByProjetId(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(req.getParameter("id")); // Récupérer l'ID de la tâche
        TachesDao.deleteTache(id); // Supprimer la tâche
        resp.sendRedirect("Taches?action=list"); // Rediriger vers la liste des tâches
    }
}
