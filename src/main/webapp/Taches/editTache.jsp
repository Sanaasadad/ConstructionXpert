<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Modifier une Tâche</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Modifier une Tâche</h2>
    <form action="Taches" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${tache.id}"> <!-- Assurez-vous que l'ID est bien envoyé -->

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" required>${tache.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Date Début</label>
            <input type="date" name="dateDebut" class="form-control" required value="${tache.dateDebut}">
        </div>

        <div class="mb-3">
            <label class="form-label">Date Fin</label>
            <input type="date" name="dateFin" class="form-control" required value="${tache.dateFin}">
        </div>

        <div class="mb-3">
            <label class="form-label">Projet</label>
            <select name="projetId" class="form-control" required>
                <option value="">Sélectionnez un projet</option>
                <c:forEach var="projet" items="${listeProjets}">
                    <option value="${projet.id}" ${tache.projet_id == projet.id ? 'selected' : ''}>${projet.nom}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Modifier</button>
        <a href="Taches?action=list" class="btn btn-secondary">Annuler</a>
    </form>
</div>
</body>
</html>