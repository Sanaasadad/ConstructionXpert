<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ajouter une Tâche</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --primary-hover: #2980b9;
            --secondary-color: #2c3e50;
            --light-gray: #f8f9fa;
            --white: #ffffff;
            --border-color: #e0e0e0;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--light-gray);
            color: #333;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: var(--white);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 1rem;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.25rem;
            color: var(--secondary-color);
            display: flex;
            align-items: center;
        }

        .navbar-brand img {
            height: 40px;
            margin-right: 10px;
        }

        .btn-custom {
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 0.9rem;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: var(--primary-hover);
            color: var(--white);
        }

        .dropdown-menu {
            font-size: 0.9rem;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dropdown-item:hover {
            background-color: var(--light-gray);
        }

        .form-container {
            max-width: 800px;
            margin: 30px auto;
            background-color: var(--white);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            font-weight: 700;
        }

        .form-label {
            font-weight: 500;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid var(--border-color);
            padding: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }

        .required-field::after {
            content: " *";
            color: #dc3545;
        }

        @media (max-width: 768px) {
            .form-container {
                margin: 20px 15px;
                padding: 20px;
            }
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
                <i class="fas fa-info-circle me-1"></i> Informations
            </button>
            <div class="dropdown">
                <button class="btn btn-custom dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-tasks me-1"></i> Actions
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="projet?action=add"><i class="fas fa-plus me-2"></i>Ajouter un Projet</a></li>
                    <li><a class="dropdown-item" href="projet?action=list"><i class="fas fa-list me-2"></i>Afficher les Projets</a></li>
                    <li><a class="dropdown-item" href="Taches?action=add"><i class="fas fa-plus-circle me-2"></i>Ajouter une Tâche</a></li>
                    <li><a class="dropdown-item" href="Taches?action=list"><i class="fas fa-tasks me-2"></i>Afficher les Tâches</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- Contenu principal - Formulaire d'ajout de tâche -->
<div class="form-container">
    <h2><i class="fas fa-plus-circle me-2"></i>Ajouter une nouvelle tâche</h2>

    <form action="Taches" method="post">
        <input type="hidden" name="action" value="add">

        <div class="mb-3">
            <label class="form-label required-field">Description</label>
            <textarea name="description" class="form-control" rows="4" required></textarea>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label required-field">Date Début</label>
                <input type="date" name="dateDebut" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label class="form-label required-field">Date Fin</label>
                <input type="date" name="dateFin" class="form-control" required>
            </div>
        </div>

        <div class="mb-4">
            <label class="form-label required-field">Projet</label>
            <select name="projetId" class="form-select" required>
                <option value="">Sélectionnez un projet</option>
                <c:forEach var="projet" items="${listeProjets}">
                    <option value="${projet.id}">${projet.nom}</option>
                </c:forEach>
            </select>
        </div>

        <div class="d-flex justify-content-end mt-4">
            <a href="Taches?action=list" class="btn btn-secondary me-2">
                <i class="fas fa-times me-1"></i> Annuler
            </a>
            <button type="submit" class="btn btn-custom">
                <i class="fas fa-save me-1"></i> Enregistrer
            </button>
        </div>
    </form>
</div>

<!-- Bootstrap JS et dépendances -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>