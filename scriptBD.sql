/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  07/11/2017 20:18:06                      */
/*==============================================================*/

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists Appartient;

drop table if exists Absence;

drop table if exists Etudiant;

drop table if exists Evenement;

drop table if exists Formation;

drop table if exists Groupe;

drop table if exists Image;

drop table if exists Matiere;

drop table if exists Notes;

drop table if exists Personne;

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
/* Table : EVENEMENT                                            */
/*==============================================================*/
create table Evenement
(
   idEvenement         int not null AUTO_INCREMENT,
   idSecretaire         int not null,
   nomEvenement         varchar(50),
   numero               numeric(8,0),
   description          text,
   datePublication      date,
   primary key (idEvenement)
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
create table Personne
(
   idPersonne           int not null AUTO_INCREMENT,
   motDePasse           varchar(64),
   nomPers              varchar(50),
   prenomPers           varchar(50),
   adresse              varchar(50),
   codePostal           numeric(5),
   urlImage             varchar(50),
   ville                varchar(50),
   nomUtilisateur       varchar(8),
   type 		            int not null,
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
      references Personne (idPersonne) on delete restrict on update restrict;

alter table Evenement add constraint FK_AJOUTER foreign key (idSecretaire)
      references Secretaire (idSecretaire) on delete restrict on update restrict;

alter table Image add constraint FK_CONTENIR foreign key (idEvenement)
      references Evenement (idEvenement) on delete restrict on update restrict;

alter table Matiere add constraint FK_CARACTERISER foreign key (idFormation)
      references Formation (idFormation) on delete restrict on update restrict;

alter table Notes add constraint FK_NOTER foreign key (idMatiere)
      references Matiere (idMatiere) on delete restrict on update restrict;

alter table Notes add constraint FK_POSSEDER foreign key (idPersonne)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

alter table Professeur add constraint FK_HERITAGE_PERS2 foreign key (idProfesseur)
      references Personne (idPersonne) on delete restrict on update restrict;

alter table Seance add constraint FK_ASSOCIER foreign key (idMatiere)
      references Matiere (idMatiere) on delete restrict on update restrict;

alter table Seance add constraint FK_DONNER foreign key (idProfesseur)
      references Professeur (idProfesseur) on delete restrict on update restrict;

alter table Seance add constraint FK_LOCALISER foreign key (idSalle)
      references Salle (idSalle) on delete restrict on update restrict;

alter table Seance add constraint FK_SUIVRE foreign key (idGroupe)
      references Groupe (idGroupe) on delete restrict on update restrict;

alter table Secretaire add constraint FK_HERITAGE_PERS3 foreign key (idSecretaire)
      references Personne (idPersonne) on delete restrict on update restrict;

alter table Semestre add constraint FK_SUIVRE_SEMESTRE foreign key (idFormation)
      references Formation (idFormation) on delete restrict on update restrict;

alter table Semestre add constraint FK_SUIVRE_SEMESTRE2 foreign key (idEtudiant)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

