## Test du trigger pour l'identifiant de personne qui est le login de l'utilisateur
INSERT INTO PERSONNE (NOMPERS, PRENOMPERS, ADRESSE, TYPE) VALUES ('bergerot', 'Leo', '61100',0);
INSERT INTO PERSONNE (NOMPERS, PRENOMPERS, ADRESSE, TYPE) VALUES ('zu', 'jonathan', '61100', 1);
INSERT INTO PERSONNE (NOMPERS, PRENOMPERS, ADRESSE, TYPE) VALUES ('zuu', 'alexandre', '61100', 2);



SELECT *
FROM PERSONNE;

SELECT *
FROM ETUDIANT;

SELECT *
FROM PROFESSEUR;

SELECT *
FROM SECRETAIRE