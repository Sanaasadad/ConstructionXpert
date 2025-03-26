package Controller;

import Dao.RessourceDao;
import Dao.TachesDao;
import Model.Ressource;
import Model.Taches;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Ressource")
public class RessourceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "ListRessource";
        }

        try {
            switch (action) {
                case "ListRessource":
                    afficherRessource(req, resp);
                    break;
                case "ajouterRessource":
                    try {
                        List<Taches> tachesDisponibles = TachesDao.getAllTaches();
                        req.setAttribute("tachesDisponibles", tachesDisponibles);
                        req.getRequestDispatcher("/Ressource/AjouterRessource.jsp").forward(req, resp);
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new ServletException(e);
                    }
                    break;
                case "modifierRessource":
                    int id = Integer.parseInt(req.getParameter("id"));
                    Ressource ressource = RessourceDao.getRessourceById(id);

                    req.setAttribute("ressource", ressource);
                    req.getRequestDispatcher("/Ressource/modifierRessource.jsp").forward(req, resp);
                    break;
                case "supprimerRessources":
                    SupprimerRessource(req, resp);
                    break;
                default:
                    afficherRessource(req, resp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Erreur lors du traitement: " + e.getMessage(), e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            resp.sendRedirect("Ressource?action=ListRessource");
            return;
        }

        try {
            switch (action) {
                case "ajouterRessource":
                    AjouterRessource(req, resp);
                    break;
                case "modifierRessource":
                    ModifierRessource(req, resp);
                    break;
                default:
                    resp.sendRedirect("Ressource?action=ListRessource");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Erreur lors du traitement: " + e.getMessage(), e);
        }
    }

    private void AjouterRessource(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ClassNotFoundException, IOException {
        // Récupération des paramètres
        String nom = req.getParameter("nom");
        String type = req.getParameter("type");
        String nom_fournisseur = req.getParameter("nom_fournisseur");
        int quantite = Integer.parseInt(req.getParameter("quantite"));
        int tache_id = Integer.parseInt(req.getParameter("tache_id"));

        // Création et sauvegarde de la ressource
        Ressource ressource = new Ressource();
        ressource.setNom(nom);
        ressource.setType(type);
        ressource.setNom_fournisseur(nom_fournisseur);
        ressource.setQuantite(quantite);
        ressource.setTaches_id(tache_id);

        RessourceDao.AjouterRessource(ressource);

        // Redirection vers la liste
        resp.sendRedirect(req.getContextPath() + "/Ressource?action=ListRessource");
    }

    private void afficherRessource(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Ressource> RessourceList = RessourceDao.getAllRessources();
        req.setAttribute("RessourceList", RessourceList);
        req.getRequestDispatcher("Ressource/ListRessource.jsp").forward(req,resp);

    }
    private void ModifierRessource(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, IOException {
        int id = Integer.valueOf(req.getParameter("id"));
        String nom = req.getParameter("nom");
        String type = req.getParameter("type");
        String nom_fournisseur = req.getParameter("nom_fournisseur");
        int quantite = Integer.valueOf(req.getParameter("quantite"));
        int tache_id = Integer.valueOf(req.getParameter("tache_id"));
        Ressource ressource = new Ressource();
        ressource.setId(id);
        ressource.setNom(nom);
        ressource.setType(type);
        ressource.setNom_fournisseur(nom_fournisseur);
        ressource.setQuantite(quantite);
        ressource.setTaches_id(tache_id);
        RessourceDao.editRessource(ressource);
        resp.sendRedirect("modifierRessource.jsp");
    }
    private void SupprimerRessource(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        RessourceDao.deleteRessource(id);
        resp.sendRedirect("Ressource?action=ListRessource");
    }
}

