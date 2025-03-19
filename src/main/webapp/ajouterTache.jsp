<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Tâche</title>
</head>
<body>
<h1>Ajouter une nouvelle Tâche</h1>
<form action="Taches" method="post">
    <label for="description">Description:</label><br>
    <input type="text" id="description" name="description" required><br><br>

    <label for="dateDebut">Date de Début:</label><br>
    <input type="date" id="dateDebut" name="dateDebut" required><br><br>

    <label for="dateFin">Date de Fin:</label><br>
    <input type="date" id="dateFin" name="dateFin" required><br><br>

    <label for="projet_id">ID du Projet:</label><br>
    <input type="number" id="projet_id" name="projet_id" required><br><br>

    <input type="submit" value="Ajouter la Tâche">
</form>
</body>
</html>