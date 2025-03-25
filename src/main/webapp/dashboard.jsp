<%@ page import="java.util.Map" %>
<%@ page import="Model.Projets" %>
<%@ page import="Model.Taches" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tableau de Bord</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        .navbar {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 1rem;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.25rem;
            color: #2c3e50;
            display: flex;
            align-items: center;
        }

        .navbar-brand img {
            height: 40px;
            margin-right: 10px;
        }

        .btn-custom {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 0.9rem;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #2980b9;
        }

        .dropdown-menu {
            font-size: 0.9rem;
        }

        .main-content {
            display: flex;
            padding: 20px;
        }

        .image-column {
            flex: 1;
            background-image: url('architectural-plans-project-drawing-pen.jpg');
            background-size: cover;
            background-position: center;
            border-radius: 10px;
            margin-right: 20px;
        }

        .content-column {
            flex: 2;
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card {
            background-color: white;
            border: none;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #ecf0f1;
            color: #2c3e50;
            border-radius: 10px 10px 0 0;
            padding: 15px;
        }

        .card-body {
            padding: 20px;
        }

        .table {
            background-color: white;
            color: #333;
            border-radius: 5px;
            border: 1px solid #e0e0e0;
        }

        .table th {
            background-color: #3498db;
            color: white;
            border-bottom: 2px solid #2980b9;
        }

        .table td {
            border-bottom: 1px solid #e0e0e0;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
    </style>
</head>
<body>
<!-- Barre de navigation compacte -->
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
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="Ressource?action=ajouterRessource">Ajouter une Ressource</a></li>
                    <li><a class="dropdown-item" href="Ressource?action=ListRessource">Afficher les Ressources</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- Conteneur principal pour la photo et le contenu -->
<div class="main-content">
    <!-- Colonne de l'image -->
    <div class="image-column"></div>

    <!-- Colonne du contenu -->
    <div class="content-column">
        <div class="container mt-5">
            <%
                Map<Projets, List<Taches>> tachesParProjet = (Map<Projets, List<Taches>>) request.getAttribute("tachesParProjet");
                for (Map.Entry<Projets, List<Taches>> entry : tachesParProjet.entrySet()) {
                    Projets projet = entry.getKey();
                    List<Taches> taches = entry.getValue();
            %>
            <div class="card">
                <div class="card-header">
                    <h3>Projet: <%= projet.getNom() %></h3>
                    <p><strong>Description:</strong> <%= projet.getDescription() %></p>
                    <p><strong>Date Début:</strong> <%= projet.getDateDebut() %></p>
                    <p><strong>Date Fin:</strong> <%= projet.getDateFin() %></p>
                    <p><strong>Budget:</strong> <%= projet.getBudget() %></p>
                </div>
                <div class="card-body">
                    <h4>Tâches associées</h4>
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Description</th>
                            <th>Date Début</th>
                            <th>Date Fin</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (taches != null && !taches.isEmpty()) {
                                for (Taches tache : taches) {
                        %>
                        <tr>
                            <td><%= tache.getId() %></td>
                            <td><%= tache.getDescription() %></td>
                            <td><%= tache.getDateDebut() %></td>
                            <td><%= tache.getDateFin() %></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="4" class="text-center">Aucune tâche trouvée pour ce projet.</td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<!-- Bootstrap JS (nécessaire pour le menu déroulant) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>