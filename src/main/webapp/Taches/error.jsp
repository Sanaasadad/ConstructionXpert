<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erreur</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center text-danger">Une erreur s'est produite</h2>

    <!-- Afficher le message d'erreur -->
    <p class="text-center"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "Erreur inconnue" %></p>

    <!-- Bouton pour retourner à la liste des tâches -->
    <div class="text-center">
        <a href="Taches?action=list" class="btn btn-primary">Retour à la liste des tâches</a>
    </div>
</div>
</body>
</html>