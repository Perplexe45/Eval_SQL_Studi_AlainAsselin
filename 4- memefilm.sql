SELECT 
	film.titre AS Film,	
	DATE_FORMAT(seance.date, '%d/%m/%Y') AS Date,
    cinema.nom AS Cinema,	
	seance.heure_debut AS Heure_debut,	
	seance.heure_fin AS Heure_fin,		
	salleDeProjection.nom AS Salle,	
	salleDeProjection.numero AS Numero
FROM 
	cinema
	INNER JOIN salleDeProjection ON cinema.IDcinema = salleDeProjection.IDcinema
	INNER JOIN seance ON salleDeProjection.IDSalleDeProjection = seance.IDSalleDeProjection
	INNER JOIN film ON film.IDFilm = seance.IDFilm
ORDER BY 
	film.titre ASC;
