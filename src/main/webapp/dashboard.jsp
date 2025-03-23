<%@ page import="java.util.Map" %>
<%@ page import="Model.Projets" %>
<%@ page import="Model.Taches" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tableau de Bord</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Style pour le fond d'écran blanc */
        body {
            background-color: white; /* Fond blanc */
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column; /* La navbar et le contenu sont empilés verticalement */
            min-height: 100vh;
        }

        /* Style pour la navbar */
        .navbar {
            background-color: #2c3e50; /* Gris foncé */
            padding: 10px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%; /* La navbar prend toute la largeur */
            z-index: 1000; /* Pour s'assurer qu'elle reste au-dessus */
        }

        .navbar-brand {
            color: #ecf0f1 !important; /* Texte clair */
            font-size: 24px;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        .navbar-brand img {
            height: 60px;
            margin-right: 20px;
        }

        /* Boutons jaunes */
        .btn-custom {
            background-color: #FFD700; /* Jaune vif */
            color: #2c3e50; /* Texte gris foncé */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #FFC107; /* Jaune plus foncé au survol */
        }

        /* Conteneur pour la photo et le contenu */
        .main-content {
            display: flex; /* Flexbox pour diviser en deux colonnes */
            flex: 1; /* Prend tout l'espace disponible sous la navbar */
        }

        /* Colonne de l'image */
        .image-column {
            flex: 1; /* Prend 50% de l'espace */
            background-image: url('architectural-plans-project-drawing-pen.jpg'); /* Remplacez par le chemin de votre image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh; /* Prend toute la hauteur de la page */
            margin-right: 20px; /* Espacement à droite */
            border-radius: 10px; /* Bordures arrondies */
        }

        /* Colonne du contenu */
        .content-column {
            flex: 2; /* Prend plus d'espace que l'image (2/3 de l'espace) */
            padding: 20px; /* Espacement intérieur */
            overflow-y: auto; /* Ajouter un défilement si le contenu est trop long */
            background-color: #f8f9fa; /* Gris clair pour le fond du contenu */
            border-radius: 10px; /* Bordures arrondies */
            margin: 20px; /* Espacement */
            height: 100vh; /* Prend toute la hauteur de la page */
        }

        /* Style pour les cartes de projet */
        .card {
            background-color: white; /* Fond blanc */
            border: none;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Ombre légère */
            color: #2c3e50; /* Texte gris foncé */
        }

        .card-header {
            background-color: #34495e; /* Gris foncé pour l'en-tête */
            color: white;
            border-radius: 10px 10px 0 0;
            padding: 15px;
        }

        .card-body {
            padding: 20px;
        }

        .table {
            background-color: white; /* Fond blanc pour le tableau */
            color: #2c3e50; /* Texte gris foncé */
            border-radius: 5px;
        }

        .table th {
            background-color: #34495e; /* Gris foncé pour les en-têtes */
            color: white;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(52, 73, 94, 0.1); /* Effet de survol gris léger */
        }
    </style>
</head>
<body>
<!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="ConstructionXpert-removebg-preview.png" alt="Logo"> <!-- Remplacez par le chemin de votre logo -->
            ConstructionXpert
        </a>
        <div class="d-flex">
            <!-- Bouton Informations sur l'entreprise -->
            <button class="btn btn-custom me-2" onclick="window.location.href='informations'">
                Informations sur l'entreprise
            </button>
            <!-- Menu déroulant pour Ajouter/Afficher -->
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

<!-- Conteneur principal pour la photo et le contenu -->
<div class="main-content">
    <!-- Colonne de l'image -->
    <div class="image-column"></div>

    <!-- Colonne du contenu -->
    <div class="content-column">
        <div class="container mt-5">
            <%
                // Récupérer la map des tâches par projet
                Map<Projets, List<Taches>> tachesParProjet = (Map<Projets, List<Taches>>) request.getAttribute("tachesParProjet");

                // Parcourir chaque projet
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