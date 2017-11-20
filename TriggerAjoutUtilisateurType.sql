CREATE TRIGGER identifiant_login_trigger
  BEFORE INSERT ON Utilisateur
  FOR EACH ROW
  BEGIN
     DECLARE nombrePersonne INT;
    DECLARE newNomPers VARCHAR(50);
     ##Verification de la longueur du nouvelle utillisateur
    SET  newNomPers = NEW.nomPers;
     IF LENGTH(newNomPers) < 4 THEN
        WHILE length(newNomPers) < 4 DO
              SET newNomPers = CONCAT(newNomPers,"0");
          END WHILE ;

      END IF;
      ##Verification que le nom n'existe pas
      SELECT count(newNomPers) INTO nombrePersonne
      FROM Utilisateur
      WHERE SUBSTR(nomUtilisateur,1,4) = SUBSTR(newNomPers,1,4);

      IF nombrePersonne < 9 THEN
        SET NEW.nomUtilisateur = lower(CONCAT(SUBSTR(newNomPers,1,4),"000",nombrePersonne+1));
      ELSE
         SET NEW.nomUtilisateur = lower(CONCAT(SUBSTR(newNomPers,1,4),"00",nombrePersonne+1));
      END IF;

  END;

DROP TRIGGER insert_new_type_user