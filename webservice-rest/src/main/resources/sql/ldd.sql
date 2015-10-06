use cerisaie;
-- --------------------------------------------------------

--
-- Contenu de la table `client`
--
CREATE TABLE CLIENT (
  NumCli INTEGER PRIMARY KEY,
  NomCli VARCHAR(100) NOT NULL ,
  AdrRueCli VARCHAR(50) NOT NULL ,
  CpCli INTEGER NOT NULL ,
  VilleCli VARCHAR(50) NOT NULL ,
  PieceCli CHAR(2) NOT NULL ,
  NumPieceCli INTEGER NOT NULL
);

INSERT INTO `client` (`NumCli`, `NomCli`, `AdrRueCli`, `CpCli`, `VilleCli`, `PieceCli`, `NumPieceCli`) VALUES
  (1, 'Merle', '3 rue des lilas', '69005', 'Lyon', 'CI', '2356786'),
  (2, 'Poussin', 'rue des tulipes', '69007', 'Lyon', 'CI', '347835684'),
  (3, 'Rossignol', '3 rue des glaieuls', '69002', 'Lyon', 'CI', '23556645'),
  (4, 'Canaris', '10 rue des acacias', '69005', 'Lyon', 'PS', '235667'),
  (5, 'Piaf', '4 rue des pivoines', '69007', 'Lyon', 'PC', '347235684'),
  (6, 'Rose', '5 rue des marguerites', '69160', 'Tassin', 'CI', '56947341'),
  (7, 'Poussin', '20 rue des iris', '69400', 'Villefranche', 'CI', '234511'),
  (8, 'Piactivitet', 'rue des pÃ©tunias', '69340', 'Francheville', 'CI', '347289'),
  (9, 'Aigle', '3 rue des geraniums', '69290', 'Saint Consorce', 'CI', '234591'),
  (10, 'Mesange', '10 rue des aubÃ©pines', '69290', 'Craponne', 'PS', '2398643'),
  (11, 'Aactivitette', '4 rue des orchidÃ©s', '69500', 'Bron', 'PC', '34723896'),
  (12, 'Buse', '5 rue des nÃ©nuphars', '69200', 'Venissieux', 'CI', '569475342');

-- --------------------------------------------------------


--
-- Contenu de la table `sport`
--
CREATE TABLE SPORT(
  CodeSport INTEGER PRIMARY KEY,
  LibelleSport VARCHAR(100) NOT NULL,
  UniteTpsSport VARCHAR(20) NOT NULL,
  TarifUnite INTEGER NOT NULL,
  CONSTRAINT TARIF_GT_ZERO_CSTR CHECK(TarifUnite > 0)
);

INSERT INTO `sport` (`CodeSport`, `LibelleSport`, `UniteTpsSport`, `TarifUnite`) VALUES
  (1, 'Tennis', '1 heure', 9),
  (2, 'VTT', '1/2 journée', 15),
  (3, 'Planche-vo', '1 journée', 22),
  (4, 'PÃ©dalo', '2 heures', 8),
  (5, 'CanoÃ«', '1/2 journée', 10);

-- --------------------------------------------------------

--
-- Contenu de la table `type_emplacement`
--

CREATE TABLE `TYPE_EMPLACEMENT` (
  CodeTypeE   INT PRIMARY KEY,
  LIBTYPEPL  VARCHAR(30) NOT NULL,
  TARIFTYPEPL INT NOT NULL,
  CONSTRAINT TARIF_GT_ZERO_CSTR CHECK(TARIFTYPEPL > 0)
);

INSERT INTO `type_emplacement` (`CodeTypeE`, `LIBTYPEPL`, `TARIFTYPEPL`) VALUES
  (1, 'TENTE', 19),
  (2, 'CARAVANE', 29),
  (3, 'CAMPING-CAR', 32),
  (4, 'BUNGALOW', 28);

--
-- Contenu de la table `emplacement`
--
CREATE TABLE EMPLACEMENT(
  NumEmpl INTEGER PRIMARY KEY,
  CodeTypeE INT NOT NULL ,
  SurfaceEmpl SMALLINT NOT NULL,
  NbPersMaxEmpl TINYINT NOT NULL,

  FOREIGN KEY (CodeTypeE) REFERENCES TYPE_EMPLACEMENT(CodeTypeE),
  CONSTRAINT SURFACE_GT_ZERO_CSTR CHECK(SurfaceEmpl > 0),
  CONSTRAINT NB_PERSO_MAX_GT_ZERO_CSTR CHECK(NbPersMaxEmpl > 0)
);

INSERT INTO `emplacement` (`NumEmpl`, `CodeTypeE`, `SurfaceEmpl`, `NbPersMaxEmpl`) VALUES
  (1, 1, 4, 4),
  (2, 1, 4, 4),
  (3, 1, 6, 5),
  (4, 1, 8, 8),
  (5, 2, 8, 12),
  (6, 2, 10, 14),
  (7, 2, 12, 16),
  (8, 3, 12, 12),
  (9, 3, 10, 8),
  (10, 4, 19, 15),
  (11, 4, 18, 16),
  (12, 4, 18, 16),
  (13, 4, 20, 25);

-- --------------------------------------------------------

--
-- Contenu de la table `sejour`
--
CREATE TABLE SEJOUR(
  NumSej INT PRIMARY KEY,
  NumCli INT NOT NULL,
  NumEmpl INT NOT NULL,
  DatedebSej DATE NOT NULL,
  DateFinSej DATE,
  NbPersonnes INT NOT NULL,

  FOREIGN KEY (NumCli) REFERENCES CLIENT(NumCli),
  FOREIGN KEY (NumEmpl) REFERENCES EMPLACEMENT(NumEmpl),
  CONSTRAINT NB_PERSONNE_GT_ZERO_CSTR CHECK (NbPersonnes > 0)
);

INSERT INTO `sejour` (`NumSej`, `NumCli`, `NumEmpl`, `DatedebSej`, `DateFinSej`, `NbPersonnes`) VALUES
  (1, 1, 1, '2012-07-01', '2012-07-10', 4),
  (2, 2, 3, '2012-07-02', '2012-07-13', 4),
  (3, 3, 4, '2012-07-01', '2012-07-14', 4),
  (4, 4, 2, '2012-07-05', '2012-07-15', 5),
  (5, 5, 5, '2012-07-08', '2012-07-25', 8),
  (6, 6, 13, '2012-07-09', '2012-07-23', 11),
  (7, 7, 7, '2012-07-10', '2012-07-20', 6),
  (8, 8, 8, '2012-07-11', '2012-07-26', 2),
  (9, 9, 9, '2012-07-12', '2012-07-15', 3),
  (10, 10, 10, '2012-07-13', '2012-07-17', 7),
  (11, 11, 11, '2012-07-14', '2012-07-19', 6),
  (12, 12, 12, '2012-07-15', '2012-07-21', 5),
  (13, 2, 13, '2012-07-15', '2012-07-25', 14),
  (14, 3, 3, '2012-07-16', '2012-07-23', 5),
  (15, 4, 4, '2012-07-16', '2012-07-26', 4),
  (16, 5, 5, '2012-07-17', '2012-07-28', 4);

--
-- Contenu de la table `activite`
--
CREATE TABLE ACTIVITE(
  CodeSport INTEGER,
  DateJour DATE NOT NULL,
  NumSej INTEGER NOT NULL,
  NbLoc TINYINT NOT NULL,

  PRIMARY KEY (CodeSport, DateJour, NumSej),
  FOREIGN KEY (CodeSport) REFERENCES SPORT(CodeSport),
  FOREIGN KEY(NumSej) REFERENCES SEJOUR(NumSej) ON DELETE CASCADE
);

INSERT INTO `activite` (`CodeSport`, `DateJour`, `NumSej`, `NBLOC`) VALUES
  (1, '2012-07-05', 3, 1),
  (1, '2012-07-20', 13, 1),
  (2, '2012-07-05', 2, 1),
  (2, '2012-07-10', 7, 1),
  (2, '2012-07-15', 7, 2),
  (3, '2012-07-07', 4, 2),
  (3, '2012-07-14', 9, 3),
  (4, '2012-07-09', 5, 2),
  (5, '2012-07-07', 6, 3),
  (5, '2012-07-12', 8, 2);

-- --------------------------------------------------------
