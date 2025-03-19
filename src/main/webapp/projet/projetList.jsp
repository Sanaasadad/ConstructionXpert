
<html>
<head>
  <title>Liste des Projets</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center">Liste des Projets</h2>
  <a href="projet?action=add" class="btn btn-primary mb-3">Ajouter un projet</a>
  <table class="table table-bordered table-hover">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Nom</th>
      <th>Description</th>
      <th>Date Debut</th>
      <th>Date Fin</th>
      <th>Budget</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Model.Projets projet : (java.util.List<Model.Projets>) request.getAttribute("projetList")) { %>
    <tr>
      <td><%= projet.getId() %></td>
      <td><%= projet.getNom() %></td>
      <td><%= projet.getDescription() %></td>
      <td><%= projet.getDateDebut() %></td>
      <td><%= projet.getDateFin() %></td>
      <td><%= projet.getBudget() %> DH</td>
      <td>
        <a href="projet?action=update&id=<%= projet.getId() %>" class="btn btn-warning">Modifier</a>
        <a href="projet?action=delete&id=<%= projet.getId() %>" class="btn btn-danger" onclick="return confirm('Confirmer la suppression ?')">Supprimer</a>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>