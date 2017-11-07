-- Lister les séances d'un prof

SELECT seance.'date', mat.nomMatiere, salle.numero, salle.batiment FROM Seance seance, Matiere mat, Salle salle, Professeur prof
								   WHERE prof.idPersonne = (
									SELECT idPersonne FROM Professeur
											  WHERE nom    = 'DUPONT',
											    AND prenom = 'Jean'
								   );

-- Ajouter une personne
INSERT INTO Personne (nom, prenom, adresse, codePostal, urlImage) VALUES ('Doe', 'John', '13 grande rue', '51000', "Chalons-en-champagne");

-- Ajouter un prof
INSERT INTO Professeur (idPersonne) VALUES (/* [LAST INSERTED VALUE] */); 

-- Ajouter un élève
INSERT INTO Etudiant(idPersonne) VALUES (/* [LAST INSERTED VALUE] */, "INE DE LELEVE", 2016); 

-- Ajouter un secrétaire
INSERT INTO Secretaire (idPersonne) VALUES (/* [LAST INSERTED VALUE] */); 

-- Ajouter une séance à un groupe (En vérifiant qu'il n'y a ni séances dans la salle ni dans l'EDT du prof ou des élèves)
	-- Vérifier qu'il n'y ai pas de séances dans la salle ni dans l'EDT prof/eleves

SELECT 'true' FROM Seance sc 
              WHERE sc.idSalle NOT IN (SELECT idSalle FROM Seance sc1
						      WHERE sc1.idSalle = sc.idSalle)
		// TODO: Check si ca collide avec d'autres séances '
	        AND sc.idSalle = /* NUMERO DE LA SALLE */;

SELECT 'true' FROM Seance sc 
	      WHERE sc.idProf NOT IN (SELECT idProf FROM Seance sc1
						    WHERE sc.idProf = sc1.idProf)
		// Check si ca collide avec d'autres séances '
		AND sc.idProf = /* ID DU PROF */;

SELECT 'true' FROM Seance sc, 


-- Ajouter une matière à une formation

-- Ajouter un évennement

-- Ajouter une formation

-- Ajouter une matière à une formation 

-- Consulter l'EDT d'une
