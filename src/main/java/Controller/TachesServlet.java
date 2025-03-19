package Controller;

import Dao.TachesDao;
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
        if (action == null) {
            action = "afficherTaches";
        }
        switch (action){
            case "afficherTaches":
                try {
                    afficherTaches(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "ajouterTaches":
               req.getRequestDispatcher("ajouterTache.jsp").forward(req, resp);
             break;
        }
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    try {
        switch (action) {
            case "ajouterTaches":
                ajouterTaches(request, response);
                break;
        }
    } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

}
    public void afficherTaches(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        List<Taches> TachesListe = TachesDao.getAllTaches();
        request.setAttribute("TachesListe", TachesListe);
        request.getRequestDispatcher("TachesList.jsp").forward(request, response);

    }
public void ajouterTaches(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String description = request.getParameter("description");
        String dateDebut = request.getParameter("dateDebut");
        String dateFin = request.getParameter("dateFin");
        Taches taches = new Taches();
        taches.setDescription(description);
        taches.setDateDebut(Date.valueOf(dateDebut));
        taches.setDateFin(Date.valueOf(dateFin));
        TachesDao.CreeTache(taches);
        response.sendRedirect("Taches?action=afficherTaches");
}

}
