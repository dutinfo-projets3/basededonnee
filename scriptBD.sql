/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  07/11/2017 20:18:06                      */
/*==============================================================*/

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists APPARTIENT;

drop table if exists ETREABSENT;

drop table if exists ETUDIANT;

drop table if exists EVENEMENT;

drop table if exists FORMATION;

drop table if exists GROUPE;

drop table if exists IMAGE;

drop table if exists MATIERE;

drop table if exists NOTES;

drop table if exists PERSONNE;

drop table if exists PROFESSEUR;

drop table if exists SALLE;

drop table if exists SEANCE;

drop table if exists SECRETAIRE;

drop table if exists SUIVRE_SEMESTRE;
SET FOREIGN_KEY_CHECKS = 1;
/*==============================================================*/
/* Table : APPARTIENT                                           */
/*==============================================================*/
create table APPARTIENT
(
   IDGROUPE             int not null,
   IDETUDIANT           int not null,
   primary key (IDGROUPE, IDETUDIANT)
);

/*==============================================================*/
/* Table : ETREABSENT                                           */
/*==============================================================*/
create table ETREABSENT
(
   IDSEANCE             int not null,
   IDETUDIANT           int not null,
   primary key (IDSEANCE, IDETUDIANT)
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table ETUDIANT
(
   IDETUDIANT           int not null,
   INE                  varchar(50),
   DATEENTREE           date,
   primary key (IDETUDIANT)
);

/*==============================================================*/
/* Table : EVENEMENT                                            */
/*==============================================================*/
create table EVENEMENT
(
   IDEVENNEMENT         int not null AUTO_INCREMENT,
   IDSECRETAIRE         int not null,
   NOMEVENEMENT         varchar(50),
   NUMERO               numeric(8,0),
   DESCRIPTION          text,
   DATEPUBLICATION      date,
   primary key (IDEVENNEMENT)
);

/*==============================================================*/
/* Table : FORMATION                                            */
/*==============================================================*/
create table FORMATION
(
   IDFORMATION          int not null AUTO_INCREMENT,
   NUMERO               numeric(8,0),
   DUREE                numeric(8,0),
   primary key (IDFORMATION)
);

/*==============================================================*/
/* Table : GROUPE                                               */
/*==============================================================*/
create table GROUPE
(
   IDGROUPE             int not null AUTO_INCREMENT,
   NUMERO               numeric(8,0),
   primary key (IDGROUPE)
);

/*==============================================================*/
/* Table : IMAGE                                                */
/*==============================================================*/
create table IMAGE
(
   IDIMAGE              int not null AUTO_INCREMENT,
   IDEVENNEMENT         int,
   URL                  varchar(50),
   primary key (IDIMAGE)
);

/*==============================================================*/
/* Table : MATIERE                                              */
/*==============================================================*/
create table MATIERE
(
   IDMATIERE            int not null AUTO_INCREMENT,
   IDFORMATION          int not null,
   COEF                 decimal,
   NOMMATIERE           varchar(50),
   primary key (IDMATIERE)
);

/*==============================================================*/
/* Table : NOTES                                                */
/*==============================================================*/
create table NOTES
(
   IDNOTE               int not null AUTO_INCREMENT,
   IDMATIERE            int not null,
   IDPERSONNE           int not null,
   VALEUR               int not null,
   COEFF                decimal,
   primary key (IDNOTE)
);

/*==============================================================*/
/* Table : PERSONNE                                             */
/*==============================================================*/
create table PERSONNE
(
   IDPERSONNE           int not null AUTO_INCREMENT,
   MOTDEPASSE           varchar(50),
   NOMPERS              varchar(50),
   PRENOMPERS           varchar(50),
   ADRESSE              varchar(50),
   CODEPOSTAL           numeric(5),
   URLIMAGE             varchar(50),
   VILLE                varchar(50),
   NOMUTILISATEUR       varchar(8),
   TYPE 		            int not null,
	primary key (IDPERSONNE)
);

/*==============================================================*/
/* Table : PROFESSEUR                                           */
/*==============================================================*/
create table PROFESSEUR
(
   IDPROFESSEUR         int not null,
     DATEEMBAUCHE         date,
    DATEDEPART        date,
   primary key (IDPROFESSEUR)
);

/*==============================================================*/
/* Table : SALLE                                                */
/*==============================================================*/
create table SALLE
(
   IDSALLE              int not null AUTO_INCREMENT,
   NUMERO               numeric(8,0) not null,
   BATIMENT             varchar(50) not null,
   primary key (IDSALLE)
);

/*==============================================================*/
/* Table : SEANCE                                               */
/*==============================================================*/
create table SEANCE
(
   IDSEANCE             int not null AUTO_INCREMENT,
   IDSALLE              int not null,
   IDMATIERE            int not null,
   IDGROUPE             int not null,
   IDPROFESSEUR         int not null,
   DATEDEBUT            date not null,
   DATEFIN              date,
   primary key (IDSEANCE)
);

/*==============================================================*/
/* Table : SECRETAIRE                                           */
/*==============================================================*/
create table SECRETAIRE
(
   IDSECRETAIRE         int not null,
   DATEEMBAUCHE         date,
    DATEDEPART        date,
   primary key (IDSECRETAIRE)
);

/*==============================================================*/
/* Table : SUIVRE_SEMESTRE                                      */
/*==============================================================*/
create table SUIVRE_SEMESTRE
(
   IDFORMATION          int not null,
   IDETUDIANT           int not null,
   NUMEROANNEEETUDE     int,
   ANNEECOURANTE        int,
   SEMESTRE             int,
   primary key (IDFORMATION, IDETUDIANT)
);

alter table APPARTIENT add constraint FK_APPARTIENT foreign key (IDGROUPE)
      references GROUPE (IDGROUPE) on delete restrict on update restrict;

alter table APPARTIENT add constraint FK_APPARTIENT2 foreign key (IDETUDIANT)
      references ETUDIANT (IDETUDIANT) on delete restrict on update restrict;

alter table ETREABSENT add constraint FK_ETREABSENT foreign key (IDSEANCE)
      references SEANCE (IDSEANCE) on delete restrict on update restrict;

alter table ETREABSENT add constraint FK_ETREABSENT2 foreign key (IDETUDIANT)
      references ETUDIANT (IDETUDIANT) on delete restrict on update restrict;

alter table ETUDIANT add constraint FK_HERITAGE_PERS foreign key (IDETUDIANT)
      references PERSONNE (IDPERSONNE) on delete restrict on update restrict;

alter table EVENEMENT add constraint FK_AJOUTER foreign key (IDSECRETAIRE)
      references SECRETAIRE (IDSECRETAIRE) on delete restrict on update restrict;

alter table IMAGE add constraint FK_CONTENIR foreign key (IDEVENNEMENT)
      references EVENEMENT (IDEVENNEMENT) on delete restrict on update restrict;

alter table MATIERE add constraint FK_CARACTERISER foreign key (IDFORMATION)
      references FORMATION (IDFORMATION) on delete restrict on update restrict;

alter table NOTES add constraint FK_NOTER foreign key (IDMATIERE)
      references MATIERE (IDMATIERE) on delete restrict on update restrict;

alter table NOTES add constraint FK_POSSEDER foreign key (IDPERSONNE)
      references ETUDIANT (IDETUDIANT) on delete restrict on update restrict;

alter table PROFESSEUR add constraint FK_HERITAGE_PERS2 foreign key (IDPROFESSEUR)
      references PERSONNE (IDPERSONNE) on delete restrict on update restrict;

alter table SEANCE add constraint FK_ASSOCIER foreign key (IDMATIERE)
      references MATIERE (IDMATIERE) on delete restrict on update restrict;

alter table SEANCE add constraint FK_DONNER foreign key (IDPROFESSEUR)
      references PROFESSEUR (IDPROFESSEUR) on delete restrict on update restrict;

alter table SEANCE add constraint FK_LOCALISER foreign key (IDSALLE)
      references SALLE (IDSALLE) on delete restrict on update restrict;

alter table SEANCE add constraint FK_SUIVRE foreign key (IDGROUPE)
      references GROUPE (IDGROUPE) on delete restrict on update restrict;

alter table SECRETAIRE add constraint FK_HERITAGE_PERS3 foreign key (IDSECRETAIRE)
      references PERSONNE (IDPERSONNE) on delete restrict on update restrict;

alter table SUIVRE_SEMESTRE add constraint FK_SUIVRE_SEMESTRE foreign key (IDFORMATION)
      references FORMATION (IDFORMATION) on delete restrict on update restrict;

alter table SUIVRE_SEMESTRE add constraint FK_SUIVRE_SEMESTRE2 foreign key (IDETUDIANT)
      references ETUDIANT (IDETUDIANT) on delete restrict on update restrict;

