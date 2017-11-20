## Test du trigger pour l'identifiant de personne qui est le login de l'utilisateur
INSERT INTO utilisateur (nomPers, prenomPers, adresse, type, motDePasse) VALUES ('jancze', 'Leo', '61100',0, SHA2('nathan', '256'));
INSERT INTO utilisateur (nomPers, prenomPers, adresse, type,motDePasse) VALUES ('zu', 'jonathan', '61100', 1, SHA2('azerty', '256'));
INSERT INTO utilisateur (nomPers, prenomPers, adresse, type,motDePasse) VALUES ('zuu', 'alexandre', '61100', 2, SHA2('azerty', '256'));
DROP TRIGGER identifiant_login_trigger;


SELECT *
FROM utilisateur;

SELECT *
FROM Etudiant;

SELECT *
FROM professeur;

SELECT *
FROM secretaire;

SELECT
    constraint_name,
    table_name
FROM
    information_schema.table_constraints

