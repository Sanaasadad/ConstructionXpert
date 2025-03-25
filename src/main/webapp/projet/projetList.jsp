<%@ page import="Model.Projets" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Liste des Projets</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Roboto', sans-serif;
      color: #333;
    }

    /* Style pour la navbar */
    .navbar {
      background-color: #ffffff; /* Fond blanc */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Ombre légère */
      padding: 0.5rem 1rem; /* Navbar plus compacte */
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.25rem; /* Taille de police réduite */
      color: #2c3e50; /* Texte gris foncé */
      display: flex;
      align-items: center;
    }

    .navbar-brand img {
      height: 40px; /* Taille du logo réduite */
      margin-right: 10px; /* Espacement réduit */
    }

    .btn-custom {
      background-color: #3498db; /* Bleu clair */
      color: white;
      border: none;
      padding: 8px 16px; /* Padding réduit */
      border-radius: 5px;
      font-size: 0.9rem; /* Taille de police réduite */
      transition: background-color 0.3s ease;
    }

    .btn-custom:hover {
      background-color: #2980b9; /* Bleu plus foncé au survol */
    }

    .dropdown-menu {
      font-size: 0.9rem; /* Taille de police réduite pour le menu déroulant */
    }

    /* Style pour le tableau */
    .container {
      max-width: 1200px;
      margin: 50px auto; /* Espacement depuis la navbar */
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2 {
      color: #2c3e50; /* Texte gris foncé */
      margin-bottom: 20px;
      font-weight: bold;
    }

    .table {
      background-color: white; /* Fond blanc */
      color: #333; /* Texte gris foncé */
      border-radius: 5px;
      border: 1px solid #e0e0e0; /* Bordure légère */
    }

    .table th {
      background-color: #3498db; /* Bleu clair pour les en-têtes */
      color: white; /* Texte blanc */
      border-bottom: 2px solid #2980b9; /* Bordure bleue plus foncée */
    }

    .table td {
      border-bottom: 1px solid #e0e0e0; /* Bordure légère pour les cellules */
    }

    .table-hover tbody tr:hover {
      background-color: rgba(52, 152, 219, 0.1); /* Effet de survol bleu léger */
    }

    .btn-primary {
      background-color: #3498db; /* Bleu clair */
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #2980b9; /* Bleu plus foncé au survol */
    }

    .btn-warning {
      background-color: #ffc107; /* Jaune */
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .btn-warning:hover {
      background-color: #e0a800; /* Jaune plus foncé au survol */
    }

    .btn-danger {
      background-color: #dc3545; /* Rouge */
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .btn-danger:hover {
      background-color: #c82333; /* Rouge plus foncé au survol */
    }

    .mb-3 {
      margin-bottom: 1.5rem;
    }

    .mt-5 {
      margin-top: 3rem;
    }

    .p-4 {
      padding: 1.5rem;
    }
  </style>
</head>
<body>
<!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="ConstructionXpert-removebg-preview.png" alt="Logo">
      ConstructionXpert
    </a>
    <div class="d-flex">
      <button class="btn btn-custom me-2" onclick="window.location.href='informations'">
        Informations sur l'entreprise
      </button>
      <div class="dropdown">
        <button class="btn btn-custom dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
          Actions
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <li><a class="dropdown-item" href="projet?action=add">Ajouter un Projet</a></li>
          <li><a class="dropdown-item" href="projet?action=list">Afficher les Projets</a></li>
          <li><a class="dropdown-item" href="Taches?action=add">Ajouter une Tâche</a></li>
          <li><a class="dropdown-item" href="Taches?action=list">Afficher les Tâches</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>

<!-- Contenu principal -->
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
    <% for (Projets projet : (List<Projets>) request.getAttribute("projetList")) { %>
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

<!-- Bootstrap JS (nécessaire pour le menu déroulant) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>