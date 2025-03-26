<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter un Projet</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(rgba(245, 247, 250, 0.85), rgba(195, 207, 226, 0.85)),
            url('construction-plans-with-yellow-helmet-drawing-tools-bluep.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* Barre de navigation avec gris clair */
        .navbar {
            background: rgba(211, 211, 211, 0.95); /* Gris clair (#d3d3d3) */
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
            color: #000000; /* Noir pour le texte */
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
            background: #007bff; /* Bleu pour les boutons */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background: #0056b3; /* Bleu plus foncé au survol */
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }

        .dropdown-menu {
            background: rgba(211, 211, 211, 0.95); /* Gris clair pour le menu déroulant */
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            border: none;
            padding: 8px 0;
        }

        .dropdown-item {
            padding: 8px 16px;
            color: #000000; /* Noir pour le texte des items */
            transition: background 0.2s ease;
        }

        .dropdown-item:hover {
            background: #007bff; /* Bleu au survol des items */
            color: #ffffff;
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
            background: #007bff; /* Bleu pour cohérence */
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
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.3);
        }

        /* Buttons */
        .btn-primary, .btn-secondary {
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: #007bff; /* Bleu */
        }

        .btn-secondary {
            background: #6c757d; /* Gris */
        }

        .btn-primary:hover, .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

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
        <button type="submit" class="btn btn-primary">Enregistrer</button>
        <a href="Taches?action=list" class="btn btn-secondary">Annuler</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>