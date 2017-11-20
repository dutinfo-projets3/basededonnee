CREATE TRIGGER insert_new_type_user
  AFTER INSERT ON Utilisateur
  FOR EACH ROW
  BEGIN
  DECLARE userType INT DEFAULT 0;
    SELECT NEW.type INTO userType
    FROM Utilisateur
    WHERE idPersonne = NEW.idPersonne;
     IF userType = 0 THEN
      INSERT INTO Etudiant (idEtudiant) VALUES (NEW.idPersonne);
    END IF;

    IF userType = 1 THEN
      INSERT INTO Professeur (idProfesseur) VALUES (NEW.idPersonne);
    END IF;

     IF userType = 2 THEN
      INSERT INTO Secretaire (idSecretaire) VALUES (NEW.idPersonne);
    END IF;

    set userType = 0;

  END;
DROP TRIGGER identifiant_login_trigger;