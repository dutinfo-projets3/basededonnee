## Test du trigger pour l'identifiant de personne qui est le login de l'utilisateur
INSERT INTO utilisateur (nomPers, prenomPers, adresse, type, motDePasse) VALUES ('jancze', 'Leo', '61100',0, SHA2('nathan', '256'));
INSERT INTO utilisateur (nomPers, prenomPers, adresse, type,motDePasse) VALUES ('zu', 'jonathan', '61100', 1, SHA2('azerty', '256'));
INSERT INTO utilisateur (nomPers, prenomPers, adresse, type,motDePasse) VALUES ('zuu', 'alexandre', '61100', 2, SHA2('azerty', '256'));
DROP TRIGGER identifiant_login_trigger;

INSERT INTO Utilisateur (type, nomUtilisateur, nomPers, prenomPers, motDePasse, adresse, ville, codePostal, urlImage)
       VALUES (-1, 'test', 'testNom', 'test');

INSERT INTO news (idSecretaire, nomEvenement, numero, description, datePublication) VALUES (3, 'troisiéme test', 1, "Fonctionnelle", STR_TO_DATE('24,3,2016','%d,%m,%Y'));
SELECT *
FROM news;

SELECT *
FROM utilisateur;

SELECT *
FROM Etudiant;

SELECT *
FROM professeur;

SELECT *
FROM secretaire;

SELECT *
FROM Formation;


SELECT *
FROM matiere
SELECT
    constraint_name,
    table_name
FROM
    information_schema.table_constraints;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM News;
ALTER TABLE News
MODIFY datePublication DATETIME;

SELECT description, idNews
FROM News;

DELETE FRom News WHERE idNews=9;

