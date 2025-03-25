<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter un Projet</title>
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

        /* Style pour le formulaire */
        .container {
            max-width: 600px;
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

        .form-label {
            font-weight: bold;
            color: #495057; /* Texte gris foncé */
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(128, 189, 255, 0.5);
        }

        .btn-success {
            background-color: #28a745; /* Vert */
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838; /* Vert plus foncé au survol */
        }

        .btn-secondary {
            background-color: #6c757d; /* Gris */
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268; /* Gris plus foncé au survol */
        }

        .border {
            border: 1px solid #dee2e6;
        }

        .rounded {
            border-radius: 8px;
        }

        .shadow {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
    <h2 class="text-center">Ajouter un Projet</h2>
    <form action="?action=add" method="post" class="border p-4 rounded shadow">
        <div class="mb-3">
            <label class="form-label">Nom du projet</label>
            <input type="text" name="nom" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Date Début</label>
            <input type="date" name="dateDebut" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Date Fin</label>
            <input type="date" name="dateFin" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Budget (DH)</label>
            <input type="number" name="budget" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Ajouter</button>
        <a href="Taches?action=list" class="btn btn-secondary">Annuler</a>
    </form>
</div>

<!-- Bootstrap JS (nécessaire pour le menu déroulant) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>