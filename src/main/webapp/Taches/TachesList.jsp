<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { padding: 20px; background-color: #f8f9fa; }
        .table { margin-top: 20px; background-color: white; }
        .container { max-width: 1200px; }
        .action-btns { white-space: nowrap; }
    </style>
</head>
<body>
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