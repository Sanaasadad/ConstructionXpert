<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(rgba(245, 247, 250, 0.9), rgba(195, 207, 226, 0.9)),
            url('crop-architect-opening-blueprint.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.98);
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

        .navbar-brand:hover img {
            transform: rotate(15deg);
        }

        .btn-custom {
            background: #1e90ff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background: #00b4d8;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(30, 144, 255, 0.3);
        }

        .dropdown-menu {
            background: rgba(255, 255, 255, 0.98);
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
            background: #e8f1ff;
            color: #1e90ff;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.98);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
        }

        h2 {
            color: #1a3c6e;
            font-weight: 700;
            font-size: 1.75rem;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
        }

        h2::after {
            content: '';
            width: 50px;
            height: 3px;
            background: #1e90ff;
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }

        .table {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .table th {
            background: #1e90ff;
            color: white;
            padding: 14px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .table td {
            padding: 14px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            transition: background 0.2s ease;
        }

        .table-hover tbody tr:hover {
            background: rgba(30, 144, 255, 0.1);
        }

        .btn-primary, .btn-warning, .btn-danger {
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary { background: #1e90ff; border: none; }
        .btn-primary:hover { background: #00b4d8; transform: translateY(-2px); }
        .btn-warning { background: #f1c40f; border: none; }
        .btn-warning:hover { background: #e67e22; }
        .btn-danger { background: #e74c3c; border: none; }
        .btn-danger:hover { background: #c0392b; }

        @media (max-width: 768px) {
             .container {
                margin: 20px 15px;
                padding: 20px;
            }
            .navbar { padding: 0.5rem 1rem; }
            .btn-custom { padding: 8px 16px; font-size: 0.9rem; }
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
                    <li><a class="dropdown-item" href="Ressource?action=ajouterRessource"><i class="fas fa-plus me-2"></i>Ajouter une Ressource</a></li>
                    <li><a class="dropdown-item" href="Ressource?action=ListRessource"><i class="fas fa-list me-2"></i>Afficher les Ressources</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="container mt-5">
    <h2 class="text-center mb-4">Liste des Tâches</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Date Début</th>
            <th>Date Fin</th>
            <th>Projet ID</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty TachesList}">
                <c:forEach var="tache" items="${TachesList}">
                    <tr>
                        <td>${tache.id}</td>
                        <td>${tache.description}</td>
                        <td>${tache.dateDebut}</td>
                        <td>${tache.dateFin}</td>
                        <td>${tache.projet_id}</td>
                        <td class="action-btns">
                            <a href="Taches?action=update&id=${tache.id}" class="btn btn-warning btn-sm">Modifier</a>
                            <a href="Taches?action=delete&id=${tache.id}" class="btn btn-danger btn-sm">Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="6" class="text-center">Aucune tâche trouvée</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <div class="text-end mt-3">
        <a href="Taches?action=add" class="btn btn-primary">Ajouter une Tâche</a>
    </div>
</div>
</body>
</html>