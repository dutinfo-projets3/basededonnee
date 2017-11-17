CREATE TRIGGER identifiant_login_trigger
  BEFORE INSERT ON Personne
  FOR EACH ROW
  BEGIN
     DECLARE nombrePersonne INT DEFAULT 1;
     ##Verification de la longueur du nouvelle utillisateur
     IF LENGTH(NEW.nomPers) < 4 THEN
        WHILE length(NEW.nomPers) < 4 DO
              SET NEW.nomPers = CONCAT(NEW.nomPers,"0");
          END WHILE ;

      END IF;
      ##Verification que le nom n'existe pas
      SELECT count(nomPers) INTO nombrePersonne
      FROM Personne
      WHERE SUBSTR(nomPers,1,4) = SUBSTR(new.nomPers,1,4);

      IF nombrePersonne < 10 THEN
        SET NEW.nomUtilisateur = CONCAT(SUBSTR(new.nomPers,1,4),"000",nombrePersonne);
      ELSE
         SET NEW.nomUtilisateur = CONCAT(SUBSTR(new.nomPers,1,4),"00",nombrePersonne);
      END IF;
  END;

DROP TRIGGER identifiant_login_trigger;