-- Réinitialisation complète pour une exécution répétée du script
DROP USER IF EXISTS 'app_media'@'localhost';
DROP USER IF EXISTS 'biblio_marie'@'localhost';
DROP USER IF EXISTS 'stagiaire'@'localhost';
DROP USER IF EXISTS 'analyste'@'localhost';
DROP USER IF EXISTS 'analyste'@'192.168.1.%';
DROP ROLE IF EXISTS role_catalogue, role_prets, role_adherents;

-- 1. Création des trois rôles métier
CREATE ROLE role_catalogue, role_prets, role_adherents;

GRANT SELECT ON mediatheque.ouvrage TO 'role_catalogue';
GRANT SELECT ON mediatheque.exemplaire TO 'role_catalogue';
GRANT SELECT ON mediatheque.categorie TO 'role_catalogue';

GRANT SELECT, INSERT, UPDATE ON mediatheque.emprunt TO 'role_prets';
GRANT SELECT, INSERT, UPDATE ON mediatheque.reservation TO 'role_prets';
GRANT SELECT, INSERT, UPDATE ON mediatheque.penalite TO 'role_prets';
GRANT UPDATE (disponible) ON mediatheque.exemplaire TO 'role_prets';

GRANT SELECT, INSERT, UPDATE ON mediatheque.adherent TO 'role_adherents';

-- 2. Création des quatre comptes
CREATE USER 'app_media'@'localhost' IDENTIFIED BY 'AppMedia!2026';
CREATE USER 'biblio_marie'@'localhost' IDENTIFIED BY 'BiblioMarie!2026';
CREATE USER 'stagiaire'@'localhost' IDENTIFIED BY 'Stagiaire!2026';
CREATE USER 'analyste'@'localhost' IDENTIFIED BY 'Analyste!2026';

-- app_media : catalogue + prêts + lecture restreinte des adhérents
GRANT role_catalogue TO 'app_media'@'localhost';
GRANT role_prets TO 'app_media'@'localhost';
GRANT SELECT (id, nom, prenom, actif) ON mediatheque.adherent TO 'app_media'@'localhost';
ALTER USER 'app_media'@'localhost' DEFAULT ROLE role_catalogue, role_prets;

-- biblio_marie : application + gestion complète des adhérents
GRANT role_catalogue TO 'biblio_marie'@'localhost';
GRANT role_prets TO 'biblio_marie'@'localhost';
GRANT role_adherents TO 'biblio_marie'@'localhost';
ALTER USER 'biblio_marie'@'localhost' DEFAULT ROLE role_catalogue, role_prets, role_adherents;

-- stagiaire : catalogue + liste des adhérents sans coordonnées sensibles
GRANT role_catalogue TO 'stagiaire'@'localhost';
GRANT SELECT (id, nom, prenom, ville, actif) ON mediatheque.adherent TO 'stagiaire'@'localhost';
ALTER USER 'stagiaire'@'localhost' DEFAULT ROLE role_catalogue;

-- analyste : lecture du catalogue et des prêts pour les statistiques
GRANT role_catalogue TO 'analyste'@'localhost';
GRANT SELECT ON mediatheque.emprunt TO 'analyste'@'localhost';
ALTER USER 'analyste'@'localhost' DEFAULT ROLE role_catalogue;

-- Bonus : accès réseau pour l'analyste depuis 192.168.1.%
CREATE USER 'analyste'@'192.168.1.%' IDENTIFIED BY 'AnalysteNet!2026';
GRANT role_catalogue TO 'analyste'@'192.168.1.%';
GRANT SELECT ON mediatheque.emprunt TO 'analyste'@'192.168.1.%';
ALTER USER 'analyste'@'192.168.1.%' DEFAULT ROLE role_catalogue;
-- Si 'analyste'@'%' existait aussi, MySQL choisirait le compte le plus spécifique (192.168.1.%) avant le wildcard %, donc c'est le compte réseau qui serait utilisé.

-- 3. Vérification : SHOW GRANTS pour chacun des quatre comptes + colonnes accessibles
SHOW GRANTS FOR 'app_media'@'localhost';
SHOW GRANTS FOR 'biblio_marie'@'localhost';
SHOW GRANTS FOR 'stagiaire'@'localhost';
SHOW GRANTS FOR 'analyste'@'localhost';
SELECT *
FROM information_schema.column_privileges
WHERE TABLE_SCHEMA = 'mediatheque'
ORDER BY TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, GRANTEE;

-- 3. Cas de test : l'analyste n'a finalement pas besoin des réservations
GRANT SELECT ON mediatheque.reservation TO 'analyste'@'localhost';
SHOW GRANTS FOR 'analyste'@'localhost';
REVOKE SELECT ON mediatheque.reservation FROM 'analyste'@'localhost';
SHOW GRANTS FOR 'analyste'@'localhost';

-- Bonus : deux façons de clôturer le compte de stagiaire
-- ALTER USER 'stagiaire'@'localhost' ACCOUNT LOCK;
-- DROP USER 'stagiaire'@'localhost';
-- Je choisirais le verrouillage, car il conserve l'historique et permet une réactivation rapide si le stage est prolongé ou s'il faut reconstituer l'accès sans recréer les droits.
