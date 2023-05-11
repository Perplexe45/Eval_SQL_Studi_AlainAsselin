-- Insertion des administrateurs
INSERT INTO administrateur (nom, prenom, identifiant, super_utilisateur, mot_de_passe)
VALUES
('Dupond', 'Jean', 'admin1', 1, SHA2('admin_01@#jeanDupond', 256)),
('Durand', 'Christophe', 'admin2', 1, SHA2('admin_02@#christopheDurand', 256)),
('Lombard', 'Madeleine', 'admin3', 0, SHA2('admin_03@#madeleineLombard', 256)),
('Thomas', 'Henry', 'admin4', 0, SHA2('admin_04@#henryThomas', 256)),
('Pivert', 'Eric', 'admin5', 0, SHA2('admin_05@#ericPivert', 256));

-- Insertion du multiplexe
INSERT INTO multiplexe (id, nom) VALUES (1, 'Pathe_Cinema');

-- Insertion des réalisateurs
INSERT INTO realisateur (id, nom, prenom, date_naissance, oscar)
VALUES
(1, 'Ducourneau', 'Julia', '1965-01-12', 0),
(2, 'Villeneuve', 'Denis', '1965-01-12', 0),
(3, 'Power', 'Damien', '1965-01-12', 0),
(4, 'Larrain', 'Pablo', '1965-01-12', 0),
(5, 'Cameron', 'James', '1965-01-12', 0);

-- Insertion des types de film
INSERT INTO type (id, nom)
VALUES
(1, 'Action'),
(2, 'Comedie'),
(3, 'Thriller'),
(4, 'Aventure'),
(5, 'Horreur'),
(6, 'Science-fiction');

-- Insertion des clients
INSERT INTO client (id, nom, prenom, email, telephone)
VALUES
(1, 'Lemaire', 'Didier', 'lemaire.didier@free.fr', '06.05.04.03.02'),
(2, 'Tosca', 'Angeline', 'tosca.angeline@orange.fr', '07.03.24.51.26'),
(3, 'Hardouin', 'Thierry', 'hardouin.thierry@gmail.com', '02.34.36.24.58'),
(4, 'Bailly', 'Cecile', 'cecile.bailly@outlook.fr', '04.87.89.51.74'),
(5, 'Asselin', 'Alain', 'alain.asselin@laposte.net', '01.02.03.04.05'),
(6, 'Duflot', 'Marguerite', 'duflot.marguerite@free.fr', '05.65.12.36.14');

-- Insertion des types de paiement
INSERT INTO type_paiement (id, nom)
VALUES
(1, 'Action'),
(2, 'Comedie'),
(3, 'Thriller'),
(4, 'Aventure'),
(5, 'Horreur'),
(6, 'Science-fiction');

-- Insertion des tarifs
INSERT INTO tarif (id, nom, montant)
VALUES
(1, 'plein_tarif', 9.20),
(2, 'Etudiant', 7.60),
(3, 'Moins_de_14ans', 5.90);

-- Insertion des cinémas
INSERT INTO cinema (id, adresse, telephone, email, ville, code_postal, nom, id_multiplexe, id_tarif)
VALUES
(1, '141 rue colombier', '01.02.03.04.05', 'pathe-tours@gmail.com', 'Tours', '37000', 'Pathe-Tours', 1, 3),
(2, '4 Place Francois Truffault', '05.04.03.02.01', 'cgr-tours-centre@gmail.com', 'Tours', '37000', 'CGR Tours Centre', 1, 4),
(3, '42 Avenue Marcel Merieux', '02.34.37.68.94', 'cgr-2-lions@gmail.com', 'Tours', '37200', 'CGR 2 Lions', 1, 5);

-- Insertion des salles de projection
INSERT INTO salleDeProjection (id, numero, capacite, code, id_cinema)
VALUES
(1, '1', 280, 'PT1', 1),
(2, '2', 350, 'PT2', 1),
(3, '3', 200, 'PT3', 1),
(4, '1', 300, 'TC1', 2),
(5, '2', 250, 'TC2', 2),
(6, '3', 180, 'TC3', 2),
(7, '4', 200, 'TC4', 2),
(8, '5', 310, 'TC5', 2),
(9, '6', 280, 'TC6', 2),
(10, '1', 320, 'TL1', 3),
(11, '2', 250, 'TL2', 3),
(12, '3', 180, 'TL3', 3);

-- Insertion des films
INSERT INTO film (id, titre, duree, id_realisateur, id_type)
VALUES
(1, 'Titane', '02:50:00', 1, 1),
(2, 'Dune', '02:45:00', 2, 4),
(3, 'Sans Issue', '02:20:00', 5, 2),
(4, 'Spencer', '01:50:00', 4, 2),
(5, 'Avatar', '02:10:00', 5, 1);

-- Insertion des séances
INSERT INTO seance (id, date, heure_debut, heure_fin, id_salleDeProjection, id_administrateur, id_film)
VALUES
(3, '2023-06-23', '18:00:00', '20:30:00', 12, 2, 2),
(4, '2023-06-24', '18:15:00', '20:30:00', 11, 1, 3),
(5, '2023-06-24', '16:30:00', '19:00:00', 7, 2, 4),
(6, '2023-06-24', '15:25:00', '18:00:00', 5, 2, 1),
(7, '2023-06-25', '14:45:00', '17:30:00', 6, 1, 5),
(8, '2023-06-25', '14:45:00', '17:30:00', 7, 3, 5);

-- Insertion des réservations
INSERT INTO reservation (id, id_client, paye, nombre_places, id_seance, id_type_paiement, id_tarif)
VALUES
(1, 1, 0, 5, 1, 2, 1),
(2, 1, 0, 3, 2, 2, 4),
(3, 1, 1, 4, 3, 2, 5),
(4, 1, 1, 2, 2, 3, 6),
(5, 1, 0, 1, 3, 3, 1),
(6, 1, 0, 1, 1, 1, 3);
