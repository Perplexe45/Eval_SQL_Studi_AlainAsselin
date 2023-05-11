SELECT
    DATE_FORMAT(seance.date, '%d/%m/%Y') AS Date,
    cinema.nom AS Cinema,
    film.titre AS Film,
    seance.heure_debut AS Heure_debut,
    salleDeProjection.numero AS Num_salle,
    salleDeProjection.nb_place AS Places_max,
    COUNT(DISTINCT reservation.IDReservation) AS Reservation,
    salleDeProjection.nb_place - COUNT(DISTINCT reservation.IDReservation) AS Restantes
FROM
    cinema
    JOIN salleDeProjection ON cinema.IDcinema = salleDeProjection.IDcinema
    JOIN seance ON salleDeProjection.IDSalleDeProjection = seance.IDSalleDeProjection
    JOIN film ON seance.IDFilm = film.IDFilm
    LEFT JOIN reservation ON seance.IDseance = reservation.IDseance
GROUP BY
    seance.date,
    cinema.nom,
    film.titre,
    seance.heure_debut,
    salleDeProjection.numero,
    salleDeProjection.nb_place
HAVING
    COUNT(DISTINCT reservation.IDReservation) <= salleDeProjection.nb_place;


