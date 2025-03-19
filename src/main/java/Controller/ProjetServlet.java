package Controller;


import Dao.projetDao;
import Model.Projets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/projet")
public class ProjetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty())
            action="list";

            switch (action){
                case "list":
                    try {
                        afficherProjetList(request,response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "add":
                    request.getRequestDispatcher("/projet/ajoutProjet.jsp").forward(request,response);
                    break;
                case "update":
                    int id = Integer.parseInt(request.getParameter("id"));
                    Projets projet = null;
                    try {
                        projet = projetDao.getProjetById(id);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    request.setAttribute("projet", projet);
                    request.getRequestDispatcher("/projet/modifierProjet.jsp").forward(request,response);
                    break;
                case "delete":
                    try {
                        suprimerProjet(request, response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    break;
            }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    ajoutProjet(request, response);
                    break;
                case "update":
                    modifierProjet(request, response);
                    break;

            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }


    private void afficherProjetList(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException {
        List<Projets> projetList =projetDao.getAllProjet();
        req.setAttribute("projetList", projetList);
        req.getRequestDispatcher("/projet/projetList.jsp").forward(req,resp);
    }

    private void ajoutProjet(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ClassNotFoundException {
        String nom = req.getParameter("nom");
        String description = req.getParameter("description");
        String dateDebut = req.getParameter("dateDebut");
        String dateFin = req.getParameter("dateFin");
        Double budget = Double.valueOf(req.getParameter("budget"));
        Projets projet = new Projets();
        projet.setNom(nom);
        projet.setDescription(description);
        projet.setDateDebut(Date.valueOf(dateDebut));
        projet.setDateFin(Date.valueOf(dateFin));
        projet.setBudget(budget);
        projetDao.ajouterProjet(projet);
        resp.sendRedirect("projet?action=list");
    }
    private void modifierProjet(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(req.getParameter("id"));
        String nom = req.getParameter("nom");
        String description = req.getParameter("description");
        String dateDebut = req.getParameter("dateDebut");
        String dateFin = req.getParameter("dateFin");
        Double budget = Double.valueOf(req.getParameter("budget"));
        Projets projet = new Projets();
        projet.setId(id);
        projet.setNom(nom);
        projet.setDescription(description);
        projet.setDateDebut(Date.valueOf(dateDebut));
        projet.setDateFin(Date.valueOf(dateFin));
        projet.setBudget(budget);
        projetDao.modifierProjet(projet);
        resp.sendRedirect("projet?action=list");
    }
    private void suprimerProjet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(req.getParameter("id"));
        projetDao.suprimerProjet(id);
        resp.sendRedirect("projet?action=list");
    }
}