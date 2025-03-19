
<html>
<head>
  <title>Modifier un Projet</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center">Modifier un Projet</h2>
  <form action="projet?action=update" method="post" class="border p-4 rounded shadow">
    <input type="hidden" name="id" value="<%= ((Model.Projets) request.getAttribute("projet")).getId() %>">
    <div class="mb-3">
      <label class="form-label">Nom du projet</label>
      <input type="text" name="nom" class="form-control" value="<%= ((Model.Projets) request.getAttribute("projet")).getNom() %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea name="description" class="form-control" required><%= ((Model.Projets) request.getAttribute("projet")).getDescription() %></textarea>
    </div>
    <div class="mb-3">
      <label class="form-label">Date Début</label>
      <input type="date" name="dateDebut" class="form-control" value="<%= ((Model.Projets) request.getAttribute("projet")).getDateDebut() %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Date Fin</label>
      <input type="date" name="dateFin" class="form-control" value="<%= ((Model.Projets) request.getAttribute("projet")).getDateFin() %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Budget (DH)</label>
      <input type="number" name="budget" class="form-control" value="<%= ((Model.Projets) request.getAttribute("projet")).getBudget() %>" required>
    </div>
    <button type="submit" class="btn btn-primary">Modifier</button>
    <a href="projet?action=list" class="btn btn-secondary">Annuler</a>
  </form>
</div>
</body>
</html>