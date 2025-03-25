<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Ressources</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding: 20px; background-color: #f8f9fa; }
        .table-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .action-btn { margin-right: 5px; }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <h2 class="text-center mb-4">Liste des Ressources</h2>
        <div class="mb-3">
            <a href="Ressource?action=ajouterRessource" class="btn btn-success">Ajouter Ressource</a>
        </div>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Type</th>
                <th>Fournisseur</th>
                <th>Quantité</th>
                <th>ID Tâche</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ressource" items="${RessourceList}">
                <tr>
                    <td>${ressource.id}</td>
                    <td>${ressource.nom}</td>
                    <td>${ressource.type}</td>
                    <td>${ressource.nom_fournisseur}</td>
                    <td>${ressource.quantite}</td>
                    <td>${ressource.taches_id}</td>
                    <td>
                        <a href="Ressource?action=modifierRessource&id=${ressource.id}" class="btn btn-warning btn-sm action-btn">Modifier</a>
                        <a href="Ressource?action=supprimerRessources&id=${ressource.id}" class="btn btn-danger btn-sm" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource?')">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>