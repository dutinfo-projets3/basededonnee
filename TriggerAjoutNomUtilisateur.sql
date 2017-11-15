CREATE TRIGGER identifiant_login_trigger
  BEFORE INSERT ON PERSONNE
  FOR EACH ROW
  BEGIN
     DECLARE nombrePersonne INT;
     ##Verification de la longueur du nouvelle utillisateur
     IF LENGTH(NEW.NOMPERS) < 4 THEN
        WHILE length(NEW.NOMPERS) < 4 DO
              SET NEW.NOMPERS = CONCAT(NEW.NOMPERS,"0");
          END WHILE ;

      END IF;
      ##Verification que le nom n'existe pas
      SELECT count(NOMPERS) INTO nombrePersonne
      FROM PERSONNE
      WHERE SUBSTR(NOMPERS,1,4) = SUBSTR(new.NOMPERS,1,4);

      IF nombrePersonne < 10 THEN
        SET NEW.NOMUTILISATEUR = CONCAT(SUBSTR(new.NOMPERS,1,4),"000",nombrePersonne);
      ELSE
         SET NEW.NOMUTILISATEUR = CONCAT(SUBSTR(new.NOMPERS,1,4),"00",nombrePersonne);
      END IF;
  END;

DROP TRIGGER identifiant_login_trigger;