USE mediatheque;

INSERT INTO categorie (id, nom) VALUES
    (1, 'Roman'),
    (2, 'BD'),
    (3, 'Documentaire');

INSERT INTO ouvrage (id, titre, auteur, categorie_id) VALUES
    (1, 'Le Petit Prince', 'Antoine de Saint-Exupéry', 1),
    (2, 'L''Etranger', 'Albert Camus', 1),
    (3, 'Les Misérables', 'Victor Hugo', 1),
    (4, 'Astérix et Cléopâtre', 'René Goscinny', 2),
    (5, 'Tintin au pays de l''or noir', 'Hergé', 2),
    (6, 'Histoire de la bibliothèque', 'Claire Martin', 3);

INSERT INTO exemplaire (id, ouvrage_id, etat, disponible) VALUES
    (1, 1, 'bon', 1),
    (2, 1, 'bon', 1),
    (3, 2, 'moyen', 0),
    (4, 2, 'bon', 1),
    (5, 3, 'bon', 1),
    (6, 3, 'moyen', 0),
    (7, 4, 'bon', 1),
    (8, 4, 'abime', 0),
    (9, 5, 'bon', 1),
    (10, 5, 'bon', 1),
    (11, 6, 'bon', 1),
    (12, 6, 'moyen', 0);

INSERT INTO adherent (id, nom, prenom, email, telephone, date_naissance, ville, actif) VALUES
    (1, 'Dupont', 'Alice', 'alice.dupont@mediatheque.fr', '+33102030401', '1988-04-12', 'Paris', 1),
    (2, 'Martin', 'Benoît', 'benoit.martin@mediatheque.fr', '+33102030402', '1991-08-19', 'Lyon', 1),
    (3, 'Bernard', 'Chloé', 'chloe.bernard@mediatheque.fr', '+33102030403', '1979-02-03', 'Marseille', 1),
    (4, 'Dubois', 'Damien', 'damien.dubois@mediatheque.fr', '+33102030404', '1984-11-27', 'Toulouse', 1),
    (5, 'Thomas', 'Emma', 'emma.thomas@mediatheque.fr', '+33102030405', '1995-06-07', 'Nice', 1),
    (6, 'Robert', 'François', 'francois.robert@mediatheque.fr', '+33102030406', '1987-03-15', 'Nantes', 1),
    (7, 'Richard', 'Gabriel', 'gabriel.richard@mediatheque.fr', '+33102030407', '1992-01-09', 'Strasbourg', 1),
    (8, 'Petit', 'Hélène', 'helene.petit@mediatheque.fr', '+33102030408', '1981-09-22', 'Lille', 1),
    (9, 'Durand', 'Inès', 'ines.durand@mediatheque.fr', '+33102030409', '1990-07-14', 'Bordeaux', 1),
    (10, 'Leroy', 'Julien', 'julien.leroy@mediatheque.fr', '+33102030410', '1986-12-05', 'Rennes', 1),
    (11, 'Moreau', 'Karine', 'karine.moreau@mediatheque.fr', '+33102030411', '1978-05-18', 'Montpellier', 1),
    (12, 'Simon', 'Luc', 'luc.simon@mediatheque.fr', '+33102030412', '1994-10-29', 'Grenoble', 1),
    (13, 'Laurent', 'Manon', 'manon.laurent@mediatheque.fr', '+33102030413', '1983-07-31', 'Dijon', 1),
    (14, 'Michel', 'Nicolas', 'nicolas.michel@mediatheque.fr', '+33102030414', '1997-02-20', 'Angers', 1),
    (15, 'Garcia', 'Olivia', 'olivia.garcia@mediatheque.fr', '+33102030415', '1989-11-11', 'Lille', 1),
    (16, 'David', 'Paul', 'paul.david@mediatheque.fr', '+33102030416', '1982-06-26', 'Tours', 1),
    (17, 'Bertrand', 'Quentin', 'quentin.bertrand@mediatheque.fr', '+33102030417', '1993-08-16', 'Clermont-Ferrand', 1),
    (18, 'Roux', 'Romy', 'romy.roux@mediatheque.fr', '+33102030418', '1985-01-04', 'Aix-en-Provence', 1),
    (19, 'Vincent', 'Sophie', 'sophie.vincent@mediatheque.fr', '+33102030419', '1998-03-23', 'Le Havre', 1),
    (20, 'Fournier', 'Thomas', 'thomas.fournier@mediatheque.fr', '+33102030420', '1977-10-09', 'Nancy', 1),
    (21, 'Chevalier', 'Ulysse', 'ulysse.chevalier@mediatheque.fr', '+33102030421', '1986-04-28', 'Reims', 1),
    (22, 'Benoit', 'Valentin', 'valentin.benoit@mediatheque.fr', '+33102030422', '1991-12-18', 'Caen', 1),
    (23, 'Meyer', 'Wendy', 'wendy.meyer@mediatheque.fr', '+33102030423', '1980-09-02', 'Poitiers', 1),
    (24, 'Blanc', 'Xavier', 'xavier.blanc@mediatheque.fr', '+33102030424', '1996-05-13', 'Avignon', 1),
    (25, 'Lopez', 'Yasmine', 'yasmine.lopez@mediatheque.fr', '+33102030425', '1987-08-08', 'Metz', 1),
    (26, 'Girard', 'Zoé', 'zoe.girard@mediatheque.fr', '+33102030426', '1992-02-17', 'Orléans', 1),
    (27, 'Andre', 'Arthur', 'arthur.andre@mediatheque.fr', '+33102030427', '1984-06-30', 'Amiens', 1),
    (28, 'Mercier', 'Béatrice', 'beatrice.mercier@mediatheque.fr', '+33102030428', '1979-04-21', 'Saint-Étienne', 1),
    (29, 'Faure', 'Cédric', 'cedric.faure@mediatheque.fr', '+33102030429', '1993-11-24', 'Limoges', 1),
    (30, 'Arnaud', 'Diane', 'diane.arnaud@mediatheque.fr', '+33102030430', '1988-03-06', 'Annecy', 1),
    (31, 'Gauthier', 'Élodie', 'elodie.gauthier@mediatheque.fr', '+33102030431', '1990-05-15', 'Perpignan', 1),
    (32, 'Robin', 'Florian', 'florian.robin@mediatheque.fr', '+33102030432', '1981-12-12', 'Mulhouse', 1),
    (33, 'Clement', 'Gaëlle', 'gaelle.clement@mediatheque.fr', '+33102030433', '1995-09-03', 'Brest', 1),
    (34, 'Guerin', 'Hugo', 'hugo.guerin@mediatheque.fr', '+33102030434', '1983-01-19', 'Nîmes', 1),
    (35, 'Boyer', 'Iris', 'iris.boyer@mediatheque.fr', '+33102030435', '1991-07-28', 'Rouen', 1),
    (36, 'Perrin', 'Jules', 'jules.perrin@mediatheque.fr', '+33102030436', '1986-10-26', 'Belfort', 1),
    (37, 'Lemoine', 'Kévin', 'kevin.lemoine@mediatheque.fr', '+33102030437', '1997-04-08', 'Reunion', 1),
    (38, 'Rey', 'Léa', 'lea.rey@mediatheque.fr', '+33102030438', '1989-02-14', 'Cannes', 1),
    (39, 'Leclerc', 'Mila', 'mila.leclerc@mediatheque.fr', '+33102030439', '1994-06-16', 'Le Mans', 1),
    (40, 'Marchand', 'Noah', 'noah.marchand@mediatheque.fr', '+33102030440', '1982-08-09', 'Tours', 1);

INSERT INTO emprunt (id, adherent_id, exemplaire_id, date_emprunt, date_retour_prevue, date_retour_effective) VALUES
    (1, 1, 1, '2026-09-01', '2026-09-15', NULL),
    (2, 2, 3, '2026-09-04', '2026-09-18', NULL),
    (3, 10, 7, '2026-08-26', '2026-09-09', '2026-09-12'),
    (4, 15, 9, '2026-09-05', '2026-09-19', NULL),
    (5, 22, 4, '2026-08-30', '2026-09-13', '2026-09-14'),
    (6, 30, 11, '2026-09-08', '2026-09-22', NULL);

INSERT INTO reservation (id, adherent_id, exemplaire_id, date_reservation, statut) VALUES
    (1, 5, 2, '2026-09-09', 'en_attente'),
    (2, 12, 6, '2026-09-10', 'confirmee'),
    (3, 18, 8, '2026-09-11', 'annulee');

INSERT INTO penalite (id, adherent_id, montant, date_debut, date_fin) VALUES
    (1, 10, 3.50, '2026-09-10', '2026-09-24'),
    (2, 22, 5.00, '2026-09-15', NULL),
    (3, 30, 2.00, '2026-09-13', '2026-09-20');
