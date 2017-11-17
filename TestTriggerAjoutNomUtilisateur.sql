## Test du trigger pour l'identifiant de personne qui est le login de l'utilisateur
INSERT INTO Personne (nomPers, prenomPers, adresse, type, motDePasse) VALUES ('jancze', 'Leo', '61100',0, SHA2('nathan', '256'));
INSERT INTO PERSONNE (NOMPERS, PRENOMPERS, ADRESSE, TYPE,MOTDEPASSE) VALUES ('zu', 'jonathan', '61100', 1, SHA2('azerty', '256'));
INSERT INTO PERSONNE (NOMPERS, PRENOMPERS, ADRESSE, TYPE,MOTDEPASSE) VALUES ('zuu', 'alexandre', '61100', 2, SHA2('azerty', '256'));



SELECT *
FROM Personne;

SELECT *
FROM Etudiant;

SELECT *
FROM PROFESSEUR;

SELECT *
FROM SECRETAIRE;

SELECT
    constraint_name,
    table_name
FROM
    information_schema.table_constraints

