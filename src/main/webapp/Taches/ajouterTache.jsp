<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="Taches" method="post">
    <input type="hidden" name="action" value="add">

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
        <label class="form-label">Projet</label>
        <select name="projetId" class="form-control" required>
            <option value="">Sélectionnez un projet</option>
            <c:forEach var="projet" items="${listeProjets}">
                <option value="${projet.id}">${projet.nom}</option>
            </c:forEach>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Ajouter</button>
    <a href="Taches?action=list" class="btn btn-secondary">Annuler</a>
</form>