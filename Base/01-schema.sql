DROP DATABASE IF EXISTS mediatheque;
CREATE DATABASE mediatheque CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mediatheque;

DROP TABLE IF EXISTS penalite;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS emprunt;
DROP TABLE IF EXISTS exemplaire;
DROP TABLE IF EXISTS ouvrage;
DROP TABLE IF EXISTS categorie;
DROP TABLE IF EXISTS adherent;

CREATE TABLE adherent (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telephone VARCHAR(30) DEFAULT NULL,
    date_naissance DATE NOT NULL,
    ville VARCHAR(100) NOT NULL,
    actif TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    UNIQUE KEY uq_adherent_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE categorie (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ouvrage (
    id INT NOT NULL AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    categorie_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_ouvrage_categorie FOREIGN KEY (categorie_id) REFERENCES categorie(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE exemplaire (
    id INT NOT NULL AUTO_INCREMENT,
    ouvrage_id INT NOT NULL,
    etat VARCHAR(50) NOT NULL DEFAULT 'bon',
    disponible TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    CONSTRAINT fk_exemplaire_ouvrage FOREIGN KEY (ouvrage_id) REFERENCES ouvrage(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE emprunt (
    id INT NOT NULL AUTO_INCREMENT,
    adherent_id INT NOT NULL,
    exemplaire_id INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE NOT NULL,
    date_retour_effective DATE DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_emprunt_adherent FOREIGN KEY (adherent_id) REFERENCES adherent(id),
    CONSTRAINT fk_emprunt_exemplaire FOREIGN KEY (exemplaire_id) REFERENCES exemplaire(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE reservation (
    id INT NOT NULL AUTO_INCREMENT,
    adherent_id INT NOT NULL,
    exemplaire_id INT NOT NULL,
    date_reservation DATE NOT NULL,
    statut ENUM('en_attente', 'confirmee', 'annulee') NOT NULL DEFAULT 'en_attente',
    PRIMARY KEY (id),
    CONSTRAINT fk_reservation_adherent FOREIGN KEY (adherent_id) REFERENCES adherent(id),
    CONSTRAINT fk_reservation_exemplaire FOREIGN KEY (exemplaire_id) REFERENCES exemplaire(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE penalite (
    id INT NOT NULL AUTO_INCREMENT,
    adherent_id INT NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_penalite_adherent FOREIGN KEY (adherent_id) REFERENCES adherent(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
