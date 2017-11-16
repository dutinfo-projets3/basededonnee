CREATE TRIGGER insert_new_type_user
  AFTER INSERT ON PERSONNE
  FOR EACH ROW
  BEGIN
  DECLARE userType INT;
    SELECT NEW.TYPE INTO userType
    FROM PERSONNE
    WHERE IDPERSONNE = NEW.IDPERSONNE;
     IF userType = 0 THEN
      INSERT INTO ETUDIANT (IDETUDIANT) VALUES (NEW.IDPERSONNE);
    END IF;
    
    IF userType = 1 THEN
      INSERT INTO PROFESSEUR (IDPROFESSEUR) VALUES (NEW.IDPERSONNE);
    END IF;
    
     IF userType = 2 THEN
      INSERT INTO SECRETAIRE (IDSECRETAIRE) VALUES (NEW.IDPERSONNE);
    END IF;

  END;

DROP TRIGGER insert_new_type_user