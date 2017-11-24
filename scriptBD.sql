/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  07/11/2017 20:18:06                      */
/*==============================================================*/

SET FOREIGN_KEY_CHECKS = 0;

drop table if exists Appartient;
drop table if exists Absence;
drop table if exists Etudiant;
drop table if exists News;
drop table if exists Formation;
drop table if exists Groupe;
drop table if exists Image;
drop table if exists Matiere;
drop table if exists Notes;
drop table if exists Utilisateur;
drop table if exists Professeur;
drop table if exists Salle;
drop table if exists Seance;
drop table if exists Secretaire;
drop table if exists Semestre;

SET FOREIGN_KEY_CHECKS = 1;
/*==============================================================*/
/* Table : APPARTIENT                                           */
/*==============================================================*/
create table Appartient
(
   idGroupe             int not null,
   idEtudiant           int not null,
   primary key (idGroupe, idEtudiant)
);

/*==============================================================*/
/* Table : ETREABSENT                                           */
/*==============================================================*/
create table Absence
(
   idSeance             int not null,
   idEtudiant           int not null,
   primary key (idSeance, idEtudiant)
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table Etudiant
(
   idEtudiant           int not null,
   ine                  varchar(50),
   dateEntree           date,
   primary key (idEtudiant)
);

/*==============================================================*/
/* Table : NEWS                                            */
/*==============================================================*/
create table News
(
   idNews         int not null AUTO_INCREMENT,
   idSecretaire         int not null,
   nomEvenement         varchar(50),
   numero               numeric(8,0),
   description          text,
   datePublication      date,
   primary key (idNews)
);

/*==============================================================*/
/* Table : FORMATION                                            */
/*==============================================================*/
create table Formation
(
   idFormation          int not null AUTO_INCREMENT,
   numero               numeric(8,0),
   duree                numeric(8,0),
   primary key (idFormation)
);

/*==============================================================*/
/* Table : GROUPE                                               */
/*==============================================================*/
create table Groupe
(
   idGroupe             int not null AUTO_INCREMENT,
   numero               numeric(8,0),
   primary key (idGroupe)
);

/*==============================================================*/
/* Table : IMAGE                                                */
/*==============================================================*/
create table Image
(
   idImage              int not null AUTO_INCREMENT,
   idEvenement         int,
   url                  varchar(50),
   primary key (idImage)
);

/*==============================================================*/
/* Table : MATIERE                                              */
/*==============================================================*/
create table Matiere
(
   idMatiere            int not null AUTO_INCREMENT,
   idFormation          int not null,
   coef                 decimal,
   nomMatiere           varchar(50),
   primary key (idMatiere)
);

/*==============================================================*/
/* Table : NOTES                                                */
/*==============================================================*/
create table Notes
(
   idNote               int not null AUTO_INCREMENT,
   idMatiere            int not null,
   idPersonne           int not null,
   valeur               int not null,
   coeff                decimal,
   primary key (idNote)
);

/*==============================================================*/
/* Table : PERSONNE                                             */
/*==============================================================*/
create table Utilisateur
(
   idPersonne           int not null AUTO_INCREMENT,
   type 		            int not null,
   nomUtilisateur       varchar(8),
   nomPers              varchar(50),
   prenomPers           varchar(50),
   motDePasse           varchar(64),
   adresse              varchar(50),
   ville                varchar(50),
   codePostal           numeric(5),
   primary key (idPersonne)
);

/*==============================================================*/
/* Table : PROFESSEUR                                           */
/*==============================================================*/
create table Professeur
(
   idProfesseur         int not null,
     dateEmbauche         date,
    dateDepart        date,
   primary key (idProfesseur)
);

/*==============================================================*/
/* Table : SALLE                                                */
/*==============================================================*/
create table Salle
(
   idSalle              int not null AUTO_INCREMENT,
   numero               numeric(8,0) not null,
   batiment             varchar(50) not null,
   primary key (idSalle)
);

/*==============================================================*/
/* Table : SEANCE                                               */
/*==============================================================*/
create table Seance
(
   idSeance             int not null AUTO_INCREMENT,
   idSalle              int not null,
   idMatiere            int not null,
   idGroupe             int not null,
   idProfesseur         int not null,
   dateDebut            date not null,
   dateFin              date,
   primary key (idSeance)
);

/*==============================================================*/
/* Table : SECRETAIRE                                           */
/*==============================================================*/
create table Secretaire
(
   idSecretaire         int not null,
   dateEmbauche         date,
    dateDepart        date,
   primary key (idSecretaire)
);

/*==============================================================*/
/* Table : SUIVRE_SEMESTRE                                      */
/*==============================================================*/
create table Semestre
(
   idFormation          int not null,
   idEtudiant           int not null,
   numeroAnneeEtude     int,
   anneeCourante        int,
   semestre             int,
   primary key (idFormation, idEtudiant)
);
alter table Appartient add constraint FK_APPARTIENT foreign key (idGroupe)
      references Groupe (idGroupe) on delete restrict on update restrict;

alter table Appartient add constraint FK_APPARTIENT2 foreign key (idEtudiant)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

alter table Absence add constraint FK_ETREABSENT foreign key (idSeance)
      references Seance (idSeance) on delete restrict on update restrict;

alter table Absence add constraint FK_ETREABSENT2 foreign key (idEtudiant)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

alter table Etudiant add constraint FK_HERITAGE_PERS foreign key (idEtudiant)
      references Utilisateur (idPersonne) on delete restrict on update restrict;

alter table News add constraint FK_AJOUTER foreign key (idSecretaire)
      references Secretaire (idSecretaire) on delete restrict on update restrict;

alter table Image add constraint FK_CONTENIR foreign key (idEvenement)
      references News (idNews) on delete restrict on update restrict;

alter table Matiere add constraint FK_CARACTERISER foreign key (idFormation)
      references Formation (idFormation) on delete restrict on update restrict;

alter table Notes add constraint FK_NOTER foreign key (idMatiere)
      references Matiere (idMatiere) on delete restrict on update restrict;

alter table Notes add constraint FK_POSSEDER foreign key (idPersonne)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

alter table Professeur add constraint FK_HERITAGE_PERS2 foreign key (idProfesseur)
      references Utilisateur (idPersonne) on delete restrict on update restrict;

alter table Seance add constraint FK_ASSOCIER foreign key (idMatiere)
      references Matiere (idMatiere) on delete restrict on update restrict;

alter table Seance add constraint FK_DONNER foreign key (idProfesseur)
      references Professeur (idProfesseur) on delete restrict on update restrict;

alter table Seance add constraint FK_LOCALISER foreign key (idSalle)
      references Salle (idSalle) on delete restrict on update restrict;

alter table Seance add constraint FK_SUIVRE foreign key (idGroupe)
      references Groupe (idGroupe) on delete restrict on update restrict;

alter table Secretaire add constraint FK_HERITAGE_PERS3 foreign key (idSecretaire)
      references Utilisateur (idPersonne) on delete restrict on update restrict;

alter table Semestre add constraint FK_SUIVRE_SEMESTRE foreign key (idFormation)
      references Formation (idFormation) on delete restrict on update restrict;

alter table Semestre add constraint FK_SUIVRE_SEMESTRE2 foreign key (idEtudiant)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

ALTER DATABASE projets3 CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE Utilisateur CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE Etudiant CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE Professeur CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE Secretaire CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
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
      SELECT count(newNomPers) INTO nombrePersonne
      FROM Utilisateur
      WHERE SUBSTR(nomUtilisateur,1,4) = SUBSTR(newNomPers,1,4);

      IF nombrePersonne < 9 THEN
        SET NEW.nomUtilisateur = lower(CONCAT(SUBSTR(newNomPers,1,4),"000",nombrePersonne+1));
      ELSE
         SET NEW.nomUtilisateur = lower(CONCAT(SUBSTR(newNomPers,1,4),"00",nombrePersonne+1));
      END IF;

  END;


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

INSERT INTO Utilisateur(idPersonne, type, nomUtilisateur, nomPers, prenomPers, motDePasse, adresse, ville, codePostal) VALUES
  (null, 0, null, UPPER('ETUDIANT'), 'Toto', sha2('azerty', 256), '123 rue toto', 'Reims', '51100');

INSERT INTO Utilisateur(idPersonne, type, nomUtilisateur, nomPers, prenomPers, motDePasse, adresse, ville, codePostal) VALUES
  (null, 1, null, UPPER('PROFESSEUR'), 'Tutu', sha2('azerty', 256), '123 rue localhost', 'Chalons', 51000);

INSERT INTO Utilisateur(idPersonne, type, nomUtilisateur, nomPers, prenomPers, motDePasse, adresse, ville, codePostal) VALUES
  (null, 2, null, UPPER('SECRETAIRE'), 'Tata', sha2('azerty', 256), '123 rue localhost', 'Chalons', 51000);
