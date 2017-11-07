--Selectionner la liste des élève dans un groupe (idGroupe= 1)
SELECT * FROM ETUDIANT
WHERE idPersonne IN (SELECT idPersonne FROM APPARTIENT
                     WHERE idGroupe = 1)
ORDER BY nom, prenom ;

--Lister les notes d'un élève (idPersonne = 2) pour une année (anneeCourante),
--classées par matière
SELECT n.valeur, n.coeff FROM NOTES n, ETUDIANT e, SUIVRE_SEMESTRE s
WHERE n.idPersonne = 2
AND s.idPersonne = 2
AND s.anneeCourante = '2017' ; 
/* ???? ON NE PEUT PAS TROUVER UNE NOTE EN FONCTION DE L'ANNEE OU DU SEMESTRE */

--Lister les absences d'un élève (idPersonne =2)
SELECT * FROM SEANCE
WHERE idSeance IN (SELECT idSeance FROM ABSENCE
                  WHERE idPersonne = 2) ;

--Lister les élèves absents a un cours (idSéance = 5)
SELECT * FROM ETUDIANT
WHERE idPersonne IN (SELECT idPersonne FROM ABSENCE
                     WHERE idSeance = 5) ;

--Lister les formations
SELECT * FROM FORMATION ;

--Lister les matières par formation
SELECT mat.nomMatiere, fmt.numero FROM MATIERE mat, FORMATION fmt
WHERE fmt.idFormation = mat.idFormation
ORDER BY 1,2 ;

--Lister les cours auxquels appartient un étudiant (idPersonne= 2)
SELECT * FROM SEANCE
WHERE idGroupe IN (SELECT idGroupe FROM GROUPE
                   WHERE  idGroupe IN (SELECT idGroupe FROM APPARTENIR
                                       WHERE idPersonne = 2)) ;

--Lister les séances d'un groupe (idGroupe 1)
SELECT * FROM SEANCE
WHERE idGroupe IN (SELECT idGroupe FROM GROUPE
                   WHERE  idGroupe = 1) ;

--Lister les évenements du jour (ici datePub = 25/10/2017 mais utiliser 
--plutôt : DATE_FORMAT(SYSDATE, 'DD-MM-YYYY') )
SELECT * FROM EVENEMENT
WHERE datePub = TO_DATE('25-10-2017', 'DD-MM-YYYY') ;