<html>
<head>
    <title>Ajouter un Projet</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #343a40;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .form-label {
            font-weight: bold;
            color: #495057;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(128, 189, 255, 0.5);
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .border {
            border: 1px solid #dee2e6;
        }

        .rounded {
            border-radius: 8px;
        }

        .shadow {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .mb-3 {
            margin-bottom: 1.5rem;
        }

        .mt-5 {
            margin-top: 3rem;
        }

        .p-4 {
            padding: 1.5rem;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Ajouter un Projet</h2>
    <form action="?action=add" method="post" class="border p-4 rounded shadow">
        <div class="mb-3">
            <label class="form-label">Nom du projet</label>
            <input type="text" name="nom" class="form-control" required>
        </div>
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
            <label class="form-label">Budget (DH)</label>
            <input type="number" name="budget" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Ajouter</button>
        <a href="Taches?action=list" class="btn btn-secondary">Annuler</a>
    </form>
</div>
</body>
</html>