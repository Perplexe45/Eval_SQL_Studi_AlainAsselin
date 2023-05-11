SELECT 
    client.nom AS Nom,
    client.prenom AS Prenom,
    cinema.nom AS Cinema,
    DATE_FORMAT(seance.date, '%d/%m/%Y') AS Date,
    tarif.Prix AS Prix,
    paiement.nom AS Paiement,
    film.titre AS Film,
    seance.heure_debut AS Debut,
    seance.heure_fin AS Fin,
    salleDeProjection.nom AS Salle,
    salleDeProjection.numero AS Numero,
	reservation.reservationEnLigne AS Achat_en_ligne
FROM 
    client
    INNER JOIN reservation ON client.IDclient = reservation.IDclient
    INNER JOIN paiement ON paiement.IDpaiement = reservation.IDpaiement
    INNER JOIN tarif ON tarif.IDTarif = reservation.IDTarif
    INNER JOIN seance ON seance.IDseance = reservation.IDseance
    INNER JOIN salleDeProjection ON salleDeProjection.IDsalleDeProjection = seance.IDsalleDeProjection
    INNER JOIN cinema ON cinema.IDcinema = salleDeProjection.IDcinema
    INNER JOIN film ON film.IDfilm = seance.IDfilm; 
