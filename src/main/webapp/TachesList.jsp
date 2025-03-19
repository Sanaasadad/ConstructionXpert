
<%@ page import="Model.Taches" %>
<html>
<head>
    <title>Liste des Taches</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Liste des Taches</h2>
    <a href="Taches?action=ajouterTaches" class="btn btn-primary mb-3">Ajouter un Taches</a>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Date Debut</th>
            <th>Date Fin</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Taches taches : (java.util.List<Model.Taches>) request.getAttribute("tachesList")) { %>
        <tr>
            <td><%= taches.getId() %></td>
            <td><%= taches.getDescription() %></td>
            <td><%= taches.getDateDebut() %></td>
            <td><%= taches.getDateFin() %></td>

            <td>
                <a href="taches?action=update&id=<%= taches.getId() %>" class="btn btn-warning">Modifier</a>
                <a href="taches?action=delete&id=<%= taches.getId() %>" class="btn btn-danger" onclick="return confirm('Confirmer la suppression ?')">Supprimer</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>