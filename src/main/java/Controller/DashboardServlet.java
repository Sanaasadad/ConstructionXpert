package Controller;

import Dao.projetDao;
import Dao.TachesDao;
import Model.Projets;
import Model.Taches;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Récupérer la liste des projets
            List<Projets> projetsList = projetDao.getAllProjet();

            // Créer une map pour stocker les tâches par projet
            Map<Projets, List<Taches>> tachesParProjet = new HashMap<>();

            // Pour chaque projet, récupérer les tâches associées
            for (Projets projet : projetsList) {
                List<Taches> taches = TachesDao.getTachesByProjetId(projet.getId());
                tachesParProjet.put(projet, taches);
            }

            // Transmettre les données à la JSP
            request.setAttribute("tachesParProjet", tachesParProjet);
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}