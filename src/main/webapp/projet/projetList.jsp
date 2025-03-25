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
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #f5f7fa, #c3cfe2),
      url('construction-silhouette.jpg') no-repeat center center fixed;
      background-size: cover;
      color: #2d3748;
      margin: 0;
      padding: 0;
      overflow-x: hidden;
    }

    /* Barre de navigation (inchangée) */
    .navbar {
      background: rgba(255, 255, 255, 0.98); /* Fond blanc semi-transparent */
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      padding: 0.75rem 2rem;
      position: sticky;
      top: 0;
      z-index: 1000;
      backdrop-filter: blur(5px);
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.5rem;
      color: #1a3c6e; /* Bleu foncé pour le texte */
      display: flex;
      align-items: center;
      transition: transform 0.3s ease;
    }

    .navbar-brand:hover {
      transform: scale(1.05);
    }

    .navbar-brand img {
      height: 45px;
      margin-right: 15px;
      transition: transform 0.3s ease;
    }

    .navbar-brand:hover img {
      transform: rotate(15deg);
    }

    .btn-custom {
      background: #1e90ff; /* Bleu pour les boutons */
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 25px;
      font-size: 1rem;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .btn-custom:hover {
      background: #00b4d8; /* Bleu plus clair au survol */
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(30, 144, 255, 0.3);
    }

    .dropdown-menu {
      background: rgba(255, 255, 255, 0.98); /* Fond blanc semi-transparent pour le menu déroulant */
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      border: none;
      padding: 8px 0;
    }

    .dropdown-item {
      padding: 8px 16px;
      transition: background 0.2s ease;
    }

    .dropdown-item:hover {
      background: #e8f1ff; /* Bleu clair au survol des items */
      color: #1e90ff;
    }

    /* Contenu principal */
    .container {
      max-width: 1200px; /* Augmenté pour un tableau plus large */
      margin: 80px auto;
      background: rgba(255, 255, 255, 0.98);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
      backdrop-filter: blur(8px);
    }

    h2 {
      color: #1a3c6e;
      font-weight: 700;
      font-size: 2rem;
      margin-bottom: 40px;
      text-align: center;
      position: relative;
    }

    h2::after {
      content: '';
      width: 60px;
      height: 4px;
      background: #1e90ff; /* Bleu pour cohérence */
      position: absolute;
      bottom: -12px;
      left: 50%;
      transform: translateX(-50%);
      border-radius: 2px;
    }

    /* Tableau modernisé et agrandi */
    .table {
      background: #ffffff; /* Fond blanc pour le tableau */
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
      width: 100%; /* Tableau plus large */
      font-size: 1.1rem; /* Texte plus grand */
    }

    .table th {
      background: #1e90ff; /* Bleu pour les en-têtes */
      color: #000000; /* Texte noir */
      padding: 20px; /* Padding plus grand pour agrandir */
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .table td {
      padding: 20px; /* Padding plus grand pour agrandir */
      border-bottom: 1px solid #6c757d; /* Gris foncé moyen pour les bordures */
      color: #000000; /* Texte noir */
      transition: background 0.2s ease;
    }

    .table-hover tbody tr:hover {
      background: rgba(108, 117, 125, 0.2); /* Gris foncé moyen en survol */
    }

    /* Boutons modernes */
    .btn-primary, .btn-warning, .btn-danger {
      padding: 12px 24px;
      border-radius: 50px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .btn-primary {
      background: #1e90ff; /* Bleu */
      border: none;
      color: #000000; /* Texte noir */
    }

    .btn-primary:hover {
      background: #00b4d8;
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(30, 144, 255, 0.3);
    }

    .btn-warning {
      background: #1e90ff; /* Bleu (remplacement de jaune pour respecter le thème) */
      border: none;
      color: #000000; /* Texte noir */
    }

    .btn-warning:hover {
      background: #00b4d8;
      transform: translateY(-2px);
    }

    .btn-danger {
      background: #1e90ff; /* Bleu (remplacement de rouge pour respecter le thème) */
      border: none;
      color: #000000; /* Texte noir */
    }

    .btn-danger:hover {
      background: #00b4d8;
      transform: translateY(-2px);
    }

    /* Responsive */
    @media (max-width: 768px) {
      .container {
        margin: 40px 20px;
        padding: 20px;
      }

      .navbar {
        padding: 1rem;
      }

      .btn-custom {
        padding: 8px 16px;
        font-size: 0.9rem;
      }

      .table th, .table td {
        padding: 12px;
        font-size: 0.9rem;
      }
    }
  </style>
</head>
<body>
<!-- Barre de navigation (inchangée) -->
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="ConstructionXpert-removebg-preview.png" alt="Logo">
      ConstructionXpert
    </a>
    <div class="d-flex">
      <button class="btn btn-custom me-2" onclick="window.location.href='informations'">
        📋 Informations
      </button>
      <div class="dropdown">
        <button class="btn btn-custom dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
          ⚙️ Actions
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <li><a class="dropdown-item" href="projet?action=add">➕ Ajouter un Projet</a></li>
          <li><a class="dropdown-item" href="projet?action=list">📜 Afficher les Projets</a></li>
          <li><a class="dropdown-item" href="Taches?action=add">➕ Ajouter une Tâche</a></li>
          <li><a class="dropdown-item" href="Taches?action=list">📋 Afficher les Tâches</a></li>
          <li><a class="dropdown-item" href="Ressource?action=ajouterRessource">➕ Ajouter une Ressource</a></li>
          <li><a class="dropdown-item" href="Ressource?action=ListRessource">📜 Afficher les Ressources</a></li>
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
    <thead>
    <tr>
      <th>ID</th>
      <th>Nom</th>
      <th>Description</th>
      <th>Date Début</th>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>