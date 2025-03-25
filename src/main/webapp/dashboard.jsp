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
            background: linear-gradient(rgba(245, 247, 250, 0.85), rgba(195, 207, 226, 0.85)),
            url('architectural-plans-project-drawing-pen.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* Enhanced Navbar */
        .navbar {
            background: linear-gradient(to right, rgba(255, 255, 255, 0.95), rgba(232, 241, 255, 0.95));
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 0.75rem 2rem;
            position: sticky;
            top: 0;
            z-index: 1000;
            animation: slideIn 0.5s ease-out;
            backdrop-filter: blur(5px);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: #1a3c6e;
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

        .navbar-brand img:hover {
            transform: rotate(15deg);
        }

        .btn-custom {
            background: linear-gradient(45deg, #1e90ff, #00b4d8);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(30, 144, 255, 0.3);
        }

        .btn-custom:hover {
            background: linear-gradient(45deg, #00b4d8, #1e90ff);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(30, 144, 255, 0.5);
        }

        .dropdown-menu {
            background: rgba(255, 255, 255, 0.95);
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.3s ease;
            backdrop-filter: blur(5px);
        }

        .dropdown-item:hover {
            background: #e8f1ff;
            color: #1e90ff;
        }

        /* Main Content */
        .main-content {
            display: flex;
            padding: 30px;
            gap: 30px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .image-column {
            flex: 1;
            /* Plus besoin de background ici, donc on le supprime */
            min-height: 500px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1); /* Optionnel : légère superposition */
            position: relative;
        }

        .content-column {
            flex: 2;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
        }

        /* Cards */
        .card {
            background: rgba(255, 255, 255, 0.97);
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
            backdrop-filter: blur(5px);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background: linear-gradient(to right, #3498db, #2ecc71);
            color: white;
            padding: 20px;
            border-radius: 15px 15px 0 0;
            position: relative;
        }

        .card-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .card-header:hover::before {
            opacity: 1;
        }

        .card-body {
            padding: 25px;
        }

        /* Tables */
        .table {
            background: rgba(255, 255, 255, 0.97);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            backdrop-filter: blur(5px);
        }

        .table th {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            padding: 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .table td {
            padding: 15px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            transition: background 0.3s ease;
        }

        .table-hover tbody tr:hover {
            background: linear-gradient(to right, rgba(52, 152, 219, 0.2), rgba(46, 204, 113, 0.2));
        }

        /* Forms */
        .container {
            max-width: 700px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.97);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
        }

        h2 {
            color: #1a3c6e;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
        }

        h2::after {
            content: '';
            width: 50px;
            height: 3px;
            background: #3498db;
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }

        .form-label {
            font-weight: 500;
            color: #2c3e50;
            margin-bottom: 8px;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.3);
        }

        /* Buttons */
        .btn-primary, .btn-success, .btn-warning, .btn-danger, .btn-secondary {
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: linear-gradient(45deg, #3498db, #2980b9);
        }

        .btn-success {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
        }

        .btn-warning {
            background: linear-gradient(45deg, #f1c40f, #e67e22);
        }

        .btn-danger {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
        }

        .btn-secondary {
            background: linear-gradient(45deg, #95a5a6, #7f8c8d);
        }

        .btn-primary:hover, .btn-success:hover, .btn-warning:hover, .btn-danger:hover, .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        /* Animations */
        @keyframes slideIn {
            from { transform: translateY(-100%); }
            to { transform: translateY(0); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
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