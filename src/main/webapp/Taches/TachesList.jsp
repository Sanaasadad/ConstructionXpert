<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Liste des Tâches</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Date Début</th>
            <th>Date Fin</th>
            <th>Projet</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tache" items="${TachesList}">
            <tr>
                <td>${tache.id}</td>
                <td>${tache.description}</td>
                <td>${tache.dateDebut}</td>
                <td>${tache.dateFin}</td>
                <td>${tache.projet_id}</td>
                <td>
                    <a href="Taches?action=update&id=${tache.id}" class="btn btn-warning">Modifier</a>
                    <a href="Taches?action=delete&id=${tache.id}" class="btn btn-danger">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="Taches?action=add" class="btn btn-primary">Ajouter une Tâche</a>
</div>
</body>
</html>