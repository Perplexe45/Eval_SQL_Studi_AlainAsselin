SELECT 
    administrateur.nom AS Nom,
    administrateur.prenom AS Prenom,
    DATE_FORMAT(seance.date, '%d/%m/%Y') AS Date,
    cinema.nom AS Cinema,
    film.titre AS Film,
    seance.heure_debut AS Heure_debut,
    seance.heure_fin AS Heure_fin,
    salleDeProjection.nom AS Salle,
    salleDeProjection.numero AS Numero
FROM 
    seance
JOIN administrateur ON administrateur.IDadministrateur = seance.IDadministrateur
JOIN film ON film.IDfilm = seance.IDfilm
JOIN salleDeProjection ON salleDeProjection.IDsalleDeProjection = seance.IDsalleDeProjection
JOIN cinema ON cinema.IDcinema = salleDeProjection.IDcinema
WHERE 
    administrateur.super_utilisateur = 1
    AND administrateur.IDadministrateur = 1
    OR administrateur.IDadministrateur = 2;
