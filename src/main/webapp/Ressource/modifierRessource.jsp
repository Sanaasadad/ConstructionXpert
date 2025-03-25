<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Modifier Ressource</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding: 20px; background-color: #f8f9fa; }
        .form-container { max-width: 600px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .form-label { font-weight: 500; }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4">Modifier Ressource</h2>
        <form action="Ressource?action=modifierRessource" method="post">
            <input type="hidden" name="id" value="${ressource.id}">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom" value="${ressource.nom}" required>
            </div>
            <div class="mb-3">
                <label for="type" class="form-label">Type</label>
                <input type="text" class="form-control" id="type" name="type" value="${ressource.type}" required>
            </div>
            <div class="mb-3">
                <label for="nom_fournisseur" class="form-label">Fournisseur</label>
                <input type="text" class="form-control" id="nom_fournisseur" name="nom_fournisseur" value="${ressource.nom_fournisseur}">
            </div>
            <div class="mb-3">
                <label for="quantite" class="form-label">Quantité</label>
                <input type="number" class="form-control" id="quantite" name="quantite" value="${ressource.quantite}" required min="1">
            </div>
            <div class="mb-3">
                <label for="tache_id" class="form-label">Tâche associée</label>
                <select class="form-control" id="tache_id" name="tache_id" required>
                    <option value="">Sélectionnez une tâche</option>
                    <c:forEach var="tache" items="${tachesDisponibles}">
                        <option value="${tache.id}">${tache.description} (ID: ${tache.id})</option>
                    </c:forEach>
                </select>
            </div>
            <div class="d-flex justify-content-between">
                <a href="Ressource?action=ListRessource" class="btn btn-secondary">Annuler</a>
                <button type="submit" class="btn btn-primary">Enregistrer</button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>