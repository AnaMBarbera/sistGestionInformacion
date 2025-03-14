-- Copyright Abdó Garcia Burguera - 2013

-- DROP schema IF EXISTS `lliga1213` ;
-- schema equivale a DATABASE
CREATE SCHEMA IF NOT EXISTS `futbol` DEFAULT CHARACTER SET latin1 ;

USE `futbol` ;

-- -----------------------------------------------------
-- Table `ciutats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ciutats` ;

CREATE  TABLE IF NOT EXISTS `ciutats` (
  `codi` INT(11) NOT NULL ,
  `nom` VARCHAR(30) NOT NULL ,
  `habitants` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`codi`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `equips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equips` ;

CREATE  TABLE IF NOT EXISTS `equips` (
  `codi` VARCHAR(3) NOT NULL ,
  `nomcurt` VARCHAR(20) NULL DEFAULT NULL ,
  `nomllarg` VARCHAR(40) NULL DEFAULT NULL ,
  `ciutat` INT(11) NULL DEFAULT NULL ,
  `entrenador` VARCHAR(30) NULL DEFAULT NULL ,
  `estadi` VARCHAR(30) NULL DEFAULT NULL ,
  `marca` VARCHAR(30) NULL DEFAULT NULL ,
  `patrocinador` VARCHAR(30) NULL DEFAULT NULL ,
  `pressupost` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`codi`) ,
  INDEX `ciutat` (`ciutat` ASC) ,
  CONSTRAINT `equips_ciutat`
    FOREIGN KEY (`ciutat` )
    REFERENCES `ciutats` (`codi` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `jugadors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jugadors` ;

CREATE  TABLE IF NOT EXISTS `jugadors` (
  `equip` VARCHAR(3) NOT NULL DEFAULT '' ,
  `dorsal` INT(11) NOT NULL DEFAULT '0' ,
  `nom` VARCHAR(30) NOT NULL ,
  `lloc` VARCHAR(10) NULL DEFAULT NULL ,
  `sou` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`equip`, `dorsal`) ,
  CONSTRAINT `jugadors_equip`
    FOREIGN KEY (`equip` )
    REFERENCES `equips` (`codi` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `porters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `porters` ;

CREATE  TABLE IF NOT EXISTS `porters` (
  `equip` VARCHAR(3) NOT NULL ,
  `dorsal` INT(11) NOT NULL ,
  `partits` INT(11) NULL DEFAULT NULL ,
  `gols` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`equip`, `dorsal`) ,
  CONSTRAINT `porters_jugador`
    FOREIGN KEY (`equip` , `dorsal` )
    REFERENCES `jugadors` (`equip` , `dorsal` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `golejadors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golejadors` ;

CREATE  TABLE IF NOT EXISTS `golejadors` (
  `equip` VARCHAR(3) NOT NULL ,
  `dorsal` INT(11) NOT NULL ,
  `partits` INT(11) NULL DEFAULT NULL ,
  `gols` INT(11) NULL DEFAULT NULL ,
  `penals` INT(11) NULL DEFAULT NULL ,
  `pp` INT(11) NULL DEFAULT NULL ,
  `minutsgol` INT(11) NULL DEFAULT NULL ,
  `gtitular` INT(11) NULL DEFAULT NULL ,
  `gsuplent` INT(11) NULL DEFAULT NULL ,
  `gpunts` INT(11) NULL DEFAULT NULL ,
  `gvictoria` INT(11) NULL DEFAULT NULL ,
  `gremuntada` INT(11) NULL DEFAULT NULL ,
  `percent` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`equip`, `dorsal`) ,
  CONSTRAINT `golejadors_jugador`
    FOREIGN KEY (`equip` , `dorsal` )
    REFERENCES `jugadors` (`equip` , `dorsal` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `jornades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jornades` ;

CREATE  TABLE IF NOT EXISTS `jornades` (
  `num` INT(11) NOT NULL ,
  `data` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`num`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `partits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partits` ;

CREATE  TABLE IF NOT EXISTS `partits` (
  `equipc` VARCHAR(3) NOT NULL DEFAULT '' ,
  `equipf` VARCHAR(3) NOT NULL DEFAULT '' ,
  `jornada` INT(11) NOT NULL ,
  `golsc` INT(11) NULL DEFAULT NULL ,
  `golsf` INT(11) NULL DEFAULT NULL ,
  `possessioc` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`equipc`, `equipf`) ,
  INDEX `equipf` (`equipf` ASC) ,
  INDEX `partits_ibkf_3` (`jornada` ASC) ,
  CONSTRAINT `partits_equipc`
    FOREIGN KEY (`equipc` )
    REFERENCES `equips` (`codi` ),
  CONSTRAINT `partits_equipf`
    FOREIGN KEY (`equipf` )
    REFERENCES `equips` (`codi` ),
  CONSTRAINT `partits_jornada`
    FOREIGN KEY (`jornada` )
    REFERENCES `jornades` (`num` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



-- ---------------------------------------------------
-- DADES
-- ---------------------------------------------------

/*
-- Query: select * from ciutats
LIMIT 0, 1000

-- Date: 2013-05-19 20:48
*/
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (2,'Alacant',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (3,'Albacete',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (4,'Almeria',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (5,'Astúries',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (6,'Àvila',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (7,'Badajoz',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (8,'Barcelona',1615000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (9,'Bilbao',353000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (10,'Biscaia',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (11,'Burgos',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (12,'Càceres',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (13,'Cadis',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (14,'Cantàbria',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (15,'Castelló',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (16,'Ceuta',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (17,'Ciutat Real',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (18,'Còrdova',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (19,'Cornellà de Llobregat',85000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (20,'Cuenca',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (21,'Getafe',169000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (22,'Girona',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (23,'Granada',234000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (24,'Guadalajara',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (25,'Guipúscoa',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (26,'Huelva',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (27,'Illes Balears',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (28,'Jaén',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (29,'La Corunya',246000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (30,'La Rioja',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (31,'Las Palmas',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (32,'Lleida',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (33,'Lleó',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (34,'Lugo',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (35,'Madrid',3293000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (36,'Màlaga',568000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (37,'Melilla',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (38,'Múrcia',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (39,'Navarra',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (40,'Orense',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (41,'Osca',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (42,'Palència',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (43,'Palma de Mallorca',400000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (44,'Pamplona',197000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (45,'Pontevedra',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (46,'Salamanca',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (47,'Sant Sebastià',186000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (48,'Santa Cruz de Tenerife',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (49,'Saragossa',680000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (50,'Segòvia',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (51,'Sevilla',702000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (52,'Sória',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (53,'Tarragona',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (54,'Terol',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (55,'Toledo',NULL);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (56,'València',798000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (57,'Valladolid',313000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (58,'Vigo',297000);
INSERT INTO `ciutats` (`codi`,`nom`,`habitants`) VALUES (59,'Zamora',NULL);


/*
-- Query: select * from equips
LIMIT 0, 1000

-- Date: 2013-05-19 23:45
*/
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('ath','Athletic','Athletic Club',9,'Marcelo Bielsa','Estadio de San Mamés','Umbro','Petronor',58);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('atm','At. Madrid','Club Atlético de Madrid',35,'Diego Simeone','Vicente Calderón','Nike','Azerbaiyán',120);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('bar','Barça','Futbol Club Barcelona',8,'Tito Vilanova','Camp Nou','Qatar Foundation','UNICEF',470);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('bet','Real Betis','Real Betis Balompié',51,'Pepe Mel','Benito Villamarín','Cirsa','Andalucía',40);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('cel','Celta de Vigo','Real Club Celta de Vigo',58,'Abel Resino','Estadio de Balaídos','Adidas','Citroën',33);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('dep','Deportivo','Real Club Deportivo de La Coruña',29,'Fernando Vàquez Pena','Riazor','Lotto Sport Italia','Hijos de Rivera',40);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('esp','Espanyol','Reial Club Deportiu Espanyol',8,'Javier Aguirre','Cornellà-El Prat','Puma','Cancún',46);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('gda','Granada','Granada Club de Fútbol',23,'Lucas Alcaraz','Los Cármenes','Caja Granada','',30);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('get','Getafe','Getafe Club de Fútbol',21,'Luis Garca Plaza','Coliseum Alfonso Pérez','Joma','',42);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('lev','Llevant','LLevant Unió Esportiva',56,'Juan Ignacio Martínez Jiméez','Ciutat de València','Kelme','Comunitat Valenciana',22);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('mal','Mallorca','Real Club Deportivo Mallorca',43,'Gregorio Manzano','Iberostar Estadio','Riviera Maya','Sol Melià',31);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('mga','Málaga','Málaga Club de Fútbol',36,'Manuel Pellegrini','Estadio La Rosaleda','Unesco','Porsche',80);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('osa','Osasuna','Club Atlético Osasuna',44,'Jos Luis Mendilíbar','Reyno de Navarra','','',30);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('ray','Rayo Vallecano','Rayo Vallecano de Madrid',35,'Paco Jiménez','Campo de Fútbol de Vallecas','Erre','',8);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('rma','Real Madrid','Real Madrid Club de Fútbol',35,'José Mourinho','Santiago Bernabéu','Adidas','',517);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('rso','Real Sociedad','Real Sociedad de Fútbol',47,'Philippe Montanier','Anoeta','Canal+','Kutxa',43);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('sev','Sevilla','Sevilla Fútbol Club',51,'Unai Emery','Ramón Sánchez Pizjuán','','',60);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('vad','Valladolid','Real Valladolid Club de Fútbol',57,'Miroslav ?uki?','Estadio Jos Zorrilla','Kappa','El Norte de Castilla',23);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('val','València','València Club de Futbol',56,'Ernesto Valverde','Mestalla','','',103);
INSERT INTO `equips` (`codi`,`nomcurt`,`nomllarg`,`ciutat`,`entrenador`,`estadi`,`marca`,`patrocinador`,`pressupost`) VALUES ('zar','Zaragoza','Real Zaragoza',49,'Manolo Jiménez Jiménez','La Romareda','Telefónica','Canal+',0);


/*
-- Query: select * from jugadors
LIMIT 0, 1000

-- Date: 2013-05-19 20:50
*/
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',1,'Gorka Iraizoz','porter',2850000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',2,'Toquero','defensa',1670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',3,'Aurtenetxe','defensa',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',4,'Laporte','defensa',1690000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',5,'Amorebieta','defensa',1700000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',6,'Mikel San José','mig',4310000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',8,'Iturraspe','defensa',1730000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',9,'Fernando Llorente','mig',3210000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',10,'Óscar de Marcos','mig',4710000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',11,'Ibai Gómez','mig',4010000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',13,'Raúl Fernández','porter',470000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',14,'Markel Susaeta','mig',4710000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',15,'Iraola','defensa',1800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',16,'Isma López','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',17,'Iñigo Pérez','defensa',1820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',18,'Carlos Gurpegui','mig',2810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',19,'Iker Muniain','mig',3510000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',20,'Aritz Aduriz','davanter',6310000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',21,'Ander Herrera','mig',3010000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',22,'Xabi Castillo','defensa',1870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',23,'Ekiza','defensa',1880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',26,'Igor Martínez','defensa',1910000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',27,'Ruiz de Galarreta','defensa',1920000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',28,'Ramalho','defensa',1930000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',37,'Aketxe','defensa',2020000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ath',39,'Morán','defensa',2040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',1,'Sergio Asenjo','porter',440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',2,'Diego Godín','mig',3960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',3,'Filipe Luís','mig',3660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',4,'Mario Suárez','mig',3360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',5,'Tiago','mig',2860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',6,'Koke','mig',4060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',7,'Adrián López','mig',3960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',8,'Raúl García','mig',4260000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',9,'Radamel Falcao','davanter',9260000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',10,'Arda Turan','mig',4160000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',11,'Cristián Rodríguez','mig',3660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',12,'Pulido','defensa',2360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',13,'Thibaut Courtois','porter',3580000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',14,'Gabi','defensa',2380000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',15,'Cisma','defensa',2390000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',18,'Cata Díaz','defensa',2420000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',19,'Diego Costa','davanter',4860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',20,'Juanfran','mig',3860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',22,'Insúa','defensa',2460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',23,'Miranda','mig',4060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',26,'Manquillo','defensa',2500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',28,'Saúl','defensa',2520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',30,'Óliver Torres','defensa',2540000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',31,'Borja Galán','defensa',2550000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',34,'Iván Calero','defensa',2580000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',35,'Galass','defensa',2590000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',41,'Ndoye','defensa',2650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',42,'Kader','defensa',2660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('atm',43,'Thomas','defensa',2670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',1,'Víctor Valdés','porter',3040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',2,'Dani Alves','defensa',2740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',3,'Gerard Piqué','mig',3360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',4,'Cesc Fàbregas','davanter',5360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',5,'Carles Puyol','mig',1960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',6,'Xavi','mig',4060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',7,'David Villa','davanter',4760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',8,'Andrés Iniesta','mig',3660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',9,'Alexis Sánchez','davanter',4560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',10,'Lionel Messi','davanter',12860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',11,'Thiago Alcântara','mig',3260000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',12,'Jonathan dos Santos','defensa',2840000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',13,'José Manuel Pinto','porter',1000000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',14,'Mascherano','defensa',2860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',15,'Bartra','defensa',2870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',16,'Sergio Busquets','mig',3560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',17,'Pedro Rodríguez','mig',3960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',18,'Jordi Alba','mig',3460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',19,'Montoya','defensa',2910000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',21,'Adriano','mig',3760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',22,'Abidal','defensa',2940000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',25,'Alex Song','mig',2560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',27,'Deulofeu','defensa',2990000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',28,'Sergi Roberto','defensa',3000000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',31,'Oier','defensa',3030000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',32,'Masip','defensa',3040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bar',37,'Cristian Tello','davanter',3860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',1,'Casto Barriga','porter',620000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',2,'Chica','defensa',1440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',3,'Mario Álvarez','mig',2360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',4,'Amaya','defensa',1460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',6,'Álex Martínez','defensa',1480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',7,'Ángel López','mig',1360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',8,'Rubén Pérez','mig',2660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',9,'Vadillo','defensa',1510000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',10,'Beñat','mig',4160000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',11,'Alejandro Pozuelo','mig',1560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',12,'Paulão','mig',2660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',13,'Adrián San Miguel','porter',2810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',14,'Salva Sevilla','mig',2060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',15,'Joel Campbell','mig',3160000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',16,'Perquis','defensa',1580000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',17,'Juan Carlos','defensa',1590000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',18,'Molins','defensa',1600000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',19,'Jorge Molina','davanter',5460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',20,'Nosa Igiebor','mig',2060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',21,'Cañas','defensa',1630000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',22,'Dorlan Pabon','mig',2860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',23,'Nacho','defensa',1650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',24,'Rubén Castro','davanter',6760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',25,'Fabricio Agosto','porter',410000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',27,'Fausto','defensa',1690000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',29,'Nono','defensa',1710000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',30,'Eder Vilarchao','defensa',1720000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',32,'Manu Palancar','defensa',1740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',34,'Carlos García','defensa',1760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',35,'Borja','defensa',1770000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',37,'Eneko Eizmendi','defensa',1790000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('bet',39,'Sergio Rodríguez','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',1,'Sergio Álvarez','porter',340000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',2,'Hugo Mallo','defensa',1640000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',3,'Roberto Lago','defensa',1650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',4,'Borja Oubiña','mig',3760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',5,'Túñez','defensa',1670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',6,'Jonathan Vila','defensa',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',8,'Álex López','mig',3660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',9,'Mario Bermejo','mig',4460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',10,'Iago Aspas','davanter',5560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',11,'Pranjic','defensa',1730000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',12,'Gustavo Cabral','mig',2860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',13,'Javi Varas','porter',3060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',15,'Demidov','defensa',1770000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',16,'Bellvis','defensa',1780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',18,'Park Chu-Young','mig',2860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',19,'Orellana','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',20,'Toni','defensa',1820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',21,'Samuel','defensa',1830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',22,'Enrique de Lucas','mig',3060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',23,'Michael Krohn-Dehli','mig',3560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',24,'Augusto Fernández','mig',4760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',25,'Natxo Insa','mig',1960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',26,'Blanco','defensa',1880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',28,'Jonny','defensa',1900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',29,'Madinda','defensa',1910000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('cel',31,'Santi Mina','defensa',1930000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',1,'Aranzubia','porter',2730000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',2,'Manuel Pablo','defensa',1830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',3,'Evaldo','defensa',1840000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',4,'Alex Bergantiños','mig',3060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',5,'Zé Castro','defensa',1860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',6,'Aythami','defensa',1870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',8,'André Santos','defensa',1890000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',9,'Pizzi','davanter',4960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',10,'Juan Domínguez','mig',2460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',11,'Riki','davanter',6060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',12,'Paulo Assunção','defensa',1930000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',13,'Germán Lux','porter',530000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',14,'Abel Aguilar','mig',3260000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',15,'Laure','defensa',1960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',16,'Bruno Gama','mig',4660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',17,'Ayoze','defensa',1980000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',18,'Javier Camuñas','mig',2660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',19,'Sílvio','mig',2060000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',20,'Jesús Vázquez','defensa',2010000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',21,'Juan Carlos Valerón','mig',3360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',22,'Diogo Salomão','mig',1560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',23,'Kaká','defensa',2040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',24,'Carlos Marchena','mig',2760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',25,'Nélson Oliveira','mig',3460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('dep',28,'Insúa','defensa',2090000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',1,'Cristian Álvarez','porter',1580000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',2,'Mattioni','defensa',1880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',3,'Raúl Rodríguez','defensa',1890000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',4,'Víctor Sánchez','mig',3520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',5,'Tejera','mig',1520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',6,'Forlín','defensa',1920000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',7,'Baena','mig',2220000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',8,'Christian Stuani','davanter',4520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',9,'Sergio García','davanter',4120000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',10,'Joan Verdú','davanter',5420000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',12,'Samuele Longo','mig',2620000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',13,'Kiko Casilla','porter',1990000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',15,'Héctor Moreno','mig',3820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',16,'Javi López','mig',3320000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',17,'Petrov','defensa',2030000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',18,'Capdevila','defensa',2040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',19,'Diego Colotto','mig',3120000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',20,'Simão Sabrosa','mig',3120000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',22,'Wakaso Mubarak','mig',3220000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',23,'Cristian Gómez','defensa',2090000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',24,'Cristian Alfonso','defensa',2100000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',26,'Edgar','defensa',2120000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',27,'Víctor Álvarez','defensa',2130000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',35,'Germán','defensa',2210000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('esp',46,'De Amo','defensa',2320000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',1,'Toño','porter',2210000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',2,'Nyom','defensa',1650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',3,'Brahimi','defensa',1660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',4,'Fran Rico','defensa',1670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',5,'Diego Mainz','mig',2780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',6,'Guilherme Siqueira','mig',4380000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',7,'Carlos Aranda','mig',2980000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',8,'Iñigo López','defensa',1710000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',9,'Youssef El-Arabi','mig',4180000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',10,'Nolito','mig',1980000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',11,'Dani Benítez','mig',1280000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',12,'Diego Buonanotte','mig',2480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',13,'Roberto Fernández','porter',1120000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',14,'Mikel Rico','mig',4080000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',15,'Diakhaté','defensa',1780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',16,'Brayan Angulo','mig',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',17,'Yebda','defensa',1800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',18,'Lucena','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',20,'Borja Gómez','defensa',1830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',21,'Juanma Ortiz','defensa',1840000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',22,'Gabriel Torje','mig',4080000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',24,'Iriney','defensa',1870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',25,'Odion Ighalo','mig',3480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',28,'Recio','mig',2280000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('gda',37,'Antonio Puertas','defensa',2000000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',1,'Miguel Ángel Moyà','porter',2750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',2,'Alexis Ruano','mig',3440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',3,'Mané','mig',1540000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',4,'Miguel Torres','defensa',1790000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',5,'Lacen','defensa',1800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',6,'Lopo','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',7,'Álvaro Vázquez','mig',4140000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',8,'Sarabia','defensa',1830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',9,'Paco Alcácer','mig',2740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',10,'Gavilán','defensa',1850000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',11,'Adrián Colunga','mig',3540000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',12,'Fede Fernández','mig',1640000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',13,'Jordi Codina','porter',810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',14,'Pedro León','mig',3440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',15,'Rafa','defensa',1900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',16,'Sergio Escudero','mig',1240000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',17,'Diego Castro','davanter',4740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',18,'Ángel Lafita','mig',3040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',19,'Abdelaziz Barrada','mig',4040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',20,'Juan Valera','mig',3340000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',21,'Míchel','defensa',1960000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',22,'Juan Rodríguez','mig',1540000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',23,'Borja Fernández','mig',2040000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',24,'Hugo Fraile','defensa',1990000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',25,'Xavi Torres','defensa',2000000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',32,'Postigo','defensa',2070000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',33,'Alberto Lopo','mig',2440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('get',35,'Nadal','defensa',2100000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',1,'Gustavo Munúa','porter',2700000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',4,'David Navarro','mig',3610000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',5,'Héctor Rodas','defensa',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',6,'Vyntra','defensa',1690000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',7,'José Barkero','mig',4010000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',8,'Nabil El Zhar','mig',3410000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',9,'Robert Acquafresca','mig',1610000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',10,'Vicente Iborra','mig',4010000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',11,'Rubén García','mig',3810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',12,'Juanfran','defensa',1750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',13,'Keylor Navas','porter',750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',14,'Dudka','defensa',1770000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',15,'Karabelas','defensa',1780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',16,'Pedro Ríos','mig',2610000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',17,'Valdo','defensa',1800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',18,'Ballesteros','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',19,'Pedro López','defensa',1820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',20,'Juanlu','mig',2710000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',21,'Míchel Herrero','mig',4410000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',22,'Christian Lell','mig',2610000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',23,'Pape Diop','defensa',1860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',24,'Simão','defensa',1870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',26,'Garabato','defensa',1890000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',27,'Roger Martí','mig',1910000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('lev',28,'Iván López','defensa',1910000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',1,'Juan Calatayud','porter',380000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',2,'Hutton','defensa',1500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',3,'João Victor','defensa',1510000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',4,'Anderson Conceiçao','defensa',1520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',5,'Pina','defensa',1530000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',6,'Antonio López','defensa',1540000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',7,'Michael Pereira','mig',2650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',8,'Emilio Nsue','mig',3450000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',9,'Giovani dos Santos','mig',3750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',10,'Tomer Hemed','davanter',5650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',11,'Javi Márquez','mig',2750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',12,'Tissone','defensa',1600000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',13,'Dudu Aouate','porter',2740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',14,'Geromel','mig',3050000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',16,'Nunes','defensa',1640000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',17,'Pedro Bigas','mig',2450000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',18,'Víctor','davanter',4750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',19,'Martí','defensa',1670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',20,'Luna','defensa',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',21,'Alejandro Alfaro','mig',3650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',22,'Javier Arizmendi','mig',2550000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',23,'Kevin Martínez','mig',1450000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',24,'Fontás','defensa',1720000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',25,'Rubén Miño','porter',230000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',26,'Yeray','defensa',1740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',27,'Ximo Navarro','defensa',1750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',30,'Álvaro','defensa',1780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mal',35,'Marc Fernández','defensa',1830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',1,'Carlos Kameni','porter',500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',2,'Jesús Gámez','defensa',1720000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',3,'Weligton','mig',3770000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',4,'Lugano','defensa',1740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',5,'Martín Demichelis','mig',4070000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',6,'Ignacio Camacho','mig',3770000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',7,'Joaquín','mig',4270000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',8,'Toulalan','defensa',1780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',9,'Javier Saviola','davanter',4170000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',10,'Júlio Baptista','mig',2070000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',11,'Seba Fernández','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',12,'Lucas Piazon','defensa',1820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',13,'Willy Caballero','porter',3290000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',14,'Pedro Morales','mig',1270000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',16,'Iturra','defensa',1860000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',17,'Duda','defensa',1870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',18,'Eliseu','mig',3070000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',19,'Portillo','defensa',1890000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',21,'Sergio Sánchez','defensa',1910000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',22,'Francisco Portillo (Isco)','mig',4970000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',23,'Onyewu','defensa',1930000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',24,'Roque Santa Cruz','davanter',4870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',25,'Antunes','mig',1570000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',30,'Jurado','defensa',2000000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',32,'Pol','defensa',2020000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',45,'Fabrice Olinga','mig',670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('mga',46,'Álex Portillo','defensa',2160000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',1,'Riesgo','defensa',1490000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',2,'Marc Bertrán','defensa',1500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',3,'Rubén','defensa',1510000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',4,'Miguel Flaño','defensa',1520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',5,'Lolo','mig',2580000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',6,'Miguel de las Cuevas','mig',1780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',7,'Kike Sola','davanter',4880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',8,'Masoud Shojaei','mig',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',9,'Emiliano Armenteros','mig',3480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',10,'Puñal','defensa',1580000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',11,'Annan','defensa',1590000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',12,'Joseba Llorente','mig',2480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',13,'Andrés Fernández','porter',3260000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',14,'Alejandro Arribas','mig',3780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',15,'Oier','defensa',1630000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',16,'Álvaro Cejudo','mig',3380000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',17,'Nino','mig',3180000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',18,'Manu Onwu','mig',880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',19,'Nano','defensa',1670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',20,'Francisco Silva','mig',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',21,'Roberto Torres','defensa',1690000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',22,'David Timor','mig',1880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',23,'Raoul Loé','mig',2780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',24,'Damiá','defensa',1720000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',25,'Ricardo','defensa',1730000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',26,'Imanol','defensa',1740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('osa',27,'Sisi','defensa',1750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',1,'Rubén','porter',2490000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',2,'Tito Román','mig',3630000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',3,'Casado','defensa',1790000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',4,'Labaka','defensa',1800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',5,'Gálvez','defensa',1810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',6,'Rodri','defensa',1820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',8,'Adrián','defensa',1840000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',9,'José Carlos','mig',3530000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',10,'Piti Medina','davanter',6430000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',11,'Chori Domínguez','mig',4030000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',13,'Dani Giménez','porter',390000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',14,'Arbilla','defensa',1900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',15,'Raúl Tamudo','mig',830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',16,'Jordi Amat','mig',3030000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',17,'Trashorras','defensa',1930000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',18,'Javi Fuego','defensa',1940000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',19,'Lass Bangoura','mig',3830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',20,'Franco Vazquez','mig',1930000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',22,'Jordi','defensa',1980000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',23,'Andrija Delibasic','mig',4430000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',25,'David Cobeño','porter',900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',29,'Léo Baptistão','davanter',4430000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',31,'Roberto Trashorras','mig',3630000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',32,'Nono','defensa',2080000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',33,'Alberto Perea','defensa',2090000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',38,'Nacho Martínez','mig',1130000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('ray',39,'Isi','defensa',2150000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',1,'Iker Casillas','porter',2140000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',2,'Varane','defensa',2470000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',3,'Pepe','mig',3410000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',4,'Sergio Ramos','mig',3810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',5,'Fábio Coentrão','mig',2210000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',6,'Sami Khedira','mig',3210000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',7,'Cristiano Ronaldo','davanter',10610000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',8,'Kaká','mig',2810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',9,'Karim Benzema','davanter',5510000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',10,'Mesut Özil','davanter',5210000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',11,'Ricardo Carvalho','defensa',2560000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',12,'Marcelo','defensa',2570000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',13,'Antonio Adán','porter',680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',14,'Xabi Alonso','defensa',2590000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',15,'Michael Essien','mig',2510000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',17,'Arbeloa','defensa',2620000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',18,'Raúl Albiol','mig',2210000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',19,'Luka Modric','mig',4110000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',20,'Gonzalo Higuaín','davanter',5810000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',21,'José María Callejón','mig',3410000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',22,'Ángel di María','mig',4610000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',25,'Diego López','porter',2430000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',27,'Nacho','defensa',2720000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',29,'Álvaro Morata','mig',2010000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',33,'Fabinho','defensa',2780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',34,'José Rodríguez','defensa',2790000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',35,'Jesús','defensa',2800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',37,'Diego Javier Llorente','defensa',2820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rma',38,'Casemiro','defensa',2830000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',1,'Claudio Bravo','porter',2730000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',2,'Carlos Martínez','mig',3090000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',3,'Mikel González','mig',3890000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',4,'Gorka Elustondo','mig',1290000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',5,'Bergara','defensa',2450000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',6,'Iñigo Martínez','mig',4190000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',7,'Antoine Griezmann','davanter',4990000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',8,'Illarramendi','defensa',2480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',9,'Imanol Agirretxe','davanter',5990000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',10,'Xabi Prieto','davanter',4890000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',11,'Carlos Vela','davanter',6390000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',13,'Eñaut Zubikarai','porter',900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',14,'Rubén Pardo','defensa',2540000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',15,'Ansotegi','defensa',2550000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',17,'David Zurutuza','mig',2590000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',18,'Chori Castro','mig',4290000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',19,'Cadamuro','defensa',2590000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',20,'José Ángel','defensa',2600000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',21,'Diego Ifrán','mig',3190000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',22,'Estrada','defensa',2620000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',23,'Javi Ros','defensa',2630000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',24,'Alberto de la Bella','mig',4190000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('rso',26,'Royo','defensa',2660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',1,'Palop','porter',1550000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',2,'Federico Fazio','mig',3440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',3,'F. Navarro','defensa',1730000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',5,'Cala','defensa',1750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',6,'Campaña','defensa',1760000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',7,'Jesús Navas','defensa',1770000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',8,'Gary Medel','mig',4340000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',9,'Álvaro Negredo','davanter',7540000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',10,'Perotti','defensa',1800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',11,'Ivan Rakitic','davanter',4740000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',12,'Maduro','defensa',1820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',13,'Beto','porter',1270000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',14,'Manu del Moral','mig',2640000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',15,'Piotr Trochowski','mig',1240000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',17,'Javi Hervás','defensa',1870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',18,'Miroslav Stevanovic','defensa',1880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',19,'José Antonio Reyes','mig',3640000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',20,'Babá','defensa',1900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',21,'Cicinho','mig',2840000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',22,'Geoffrey Kondogbia','mig',3240000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',23,'Coke','mig',2640000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',24,'Alberto Botía','mig',2140000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',25,'Julián','defensa',1950000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',28,'Álex Rubio','defensa',1980000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',30,'Bryan Rabello','defensa',2000000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('sev',35,'Alberto Moreno','defensa',2050000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',1,'Jaime','porter',1190000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',2,'Antonio Rukavina','mig',3920000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',4,'Marc Valiente','defensa',1650000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',5,'Sereno','defensa',1660000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',6,'Jesús Rueda','defensa',1670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',7,'Neira','defensa',1680000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',8,'Javier Baraja','mig',1520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',9,'Javi Guerra','davanter',4620000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',10,'Óscar González','davanter',5920000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',11,'Daniel Larsson','defensa',1720000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',13,'Dani Hernández','porter',2250000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',14,'Omar','defensa',1750000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',15,'Alberto Bueno','mig',4020000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',16,'Lluís Sastre','mig',3120000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',17,'Peña','defensa',1780000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',18,'Álvaro Rubio','defensa',1790000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',20,'Patrick Ebert','mig',3520000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',22,'Víctor Pérez','mig',3020000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',23,'Rama','defensa',1840000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',24,'Balenziaga','defensa',1850000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',25,'Manucho','davanter',4120000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',27,'Lolo','defensa',1880000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',28,'Rubén Peña','defensa',1890000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',30,'Jorge Pesca','defensa',1910000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('vad',32,'Iván Casado','defensa',1930000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',1,'Diego Alves','porter',2310000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',3,'Aly Cissokho','mig',2900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',4,'Rami','defensa',2260000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',6,'Albelda','defensa',2280000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',7,'Jonas','davanter',6100000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',8,'Sofiane Feghouli','mig',3400000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',9,'Roberto Soldado','davanter',7700000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',10,'Éver Banega','mig',3500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',11,'Pablo Piatti','mig',1900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',12,'João Pereira','defensa',2340000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',13,'Vicente Guaita','porter',1290000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',14,'Barragán','defensa',2360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',15,'Jonathan Viera','mig',2200000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',16,'Nelson Valdez','mig',4300000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',17,'Andrés Guardado','mig',3500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',18,'Víctor Ruiz','defensa',2400000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',20,'Ricardo Costa','mig',3400000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',21,'Dani Parejo','mig',2900000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',22,'Mathieu','defensa',2440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',23,'Sergio Canales','mig',1800000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',24,'Tino Costa','mig',3500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',26,'Felipe','defensa',2480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',28,'Juan Bernat','defensa',2500000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('val',29,'Alex Quintanilla','defensa',2510000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',1,'Roberto','porter',2820000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',2,'Movilla','defensa',1230000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',3,'Paredes','defensa',1240000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',4,'Álvaro González','mig',3370000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',5,'Lanzaro','defensa',1260000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',6,'Rodri','mig',1570000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',7,'Bienvenu','defensa',1280000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',8,'Edu Oriol','defensa',1290000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',9,'Hélder Postiga','davanter',5970000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',10,'Apoño','davanter',4870000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',11,'Paco Montañés','mig',4670000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',12,'Romaric','defensa',1330000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',13,'Leo Franco','porter',410000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',14,'José Fernández','defensa',1350000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',15,'José Mari','defensa',1360000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',16,'Loovens','defensa',1370000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',17,'Babovic','defensa',1380000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',18,'Wilchez','defensa',1390000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',19,'Cristian Sapunaru','mig',3270000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',20,'Franco Zuculini','mig',1970000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',21,'Abraham','defensa',1420000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',22,'Pintér','defensa',1430000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',23,'Javi Álamo','defensa',1440000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',24,'Obradovic','defensa',1450000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',25,'Carmona','defensa',1460000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',26,'Ortí','defensa',1470000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',27,'Héctor','defensa',1480000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',30,'Pablo Alcolea','porter',350000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',31,'Rubén Rochina','mig',1570000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',32,'Víctor Rodríguez','mig',3370000);
INSERT INTO `jugadors` (`equip`,`dorsal`,`nom`,`lloc`,`sou`) VALUES ('zar',40,'Kilian Falcón','defensa',1610000);


/*
-- Query: select * from golejadors
LIMIT 0, 1000

-- Date: 2013-05-19 20:49
*/
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',19,30,4,0,0,608,4,0,1,2,2,10);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',14,25,3,0,0,723,3,0,1,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',11,21,6,0,0,209,6,0,1,0,0,14);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',7,30,3,0,0,463,2,1,0,1,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',21,23,5,0,0,287,5,0,0,1,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',24,17,1,0,0,1,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',15,30,4,1,0,336,4,0,0,0,0,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',24,33,3,0,0,979,3,0,0,1,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',33,20,1,0,0,2,1,0,0,1,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',21,25,5,0,0,240,5,0,1,1,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',14,32,2,0,0,1,2,0,0,1,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',11,11,1,0,0,426,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',4,27,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',8,31,2,0,0,1,2,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',25,19,1,0,0,1,1,0,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',2,26,3,0,0,748,3,0,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',9,27,7,0,0,229,7,0,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',16,30,1,0,0,2,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',4,30,1,0,0,3,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',29,12,2,0,0,200,1,1,0,1,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',9,33,20,3,0,138,19,1,3,2,0,38);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',7,29,5,0,0,275,3,2,0,0,0,10);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',3,22,2,0,0,741,2,0,0,1,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',21,26,1,0,0,2,1,0,1,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',17,30,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',8,28,2,0,0,950,2,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',23,30,6,0,0,205,2,4,0,0,0,14);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',22,30,6,0,0,318,5,1,0,1,1,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',18,24,2,0,0,769,1,1,0,1,1,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',7,9,1,0,0,557,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',7,31,8,0,0,324,8,0,0,0,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',2,35,1,0,1,3,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',25,11,1,0,0,943,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',10,29,9,7,0,254,9,0,0,0,0,26);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',10,30,4,0,0,525,4,0,1,1,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',20,33,14,1,0,175,14,0,2,5,0,35);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',24,34,6,0,0,463,6,0,1,1,0,18);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',7,18,1,0,0,934,1,0,0,1,1,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',10,31,4,0,0,647,4,0,0,1,0,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',23,16,1,0,0,1,1,0,0,1,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',4,34,1,0,0,3,1,0,1,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',16,13,1,0,0,544,0,1,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',16,35,5,0,0,585,5,0,0,1,0,11);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',5,13,1,0,0,968,1,0,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',7,26,1,0,0,1,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',18,24,1,0,0,2,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',24,22,2,0,1,927,2,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',2,26,1,0,0,2,1,0,1,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',11,33,14,4,0,183,12,2,1,0,0,22);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',4,29,10,0,0,206,10,0,0,1,0,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',18,28,6,0,0,207,6,0,0,0,0,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',11,30,4,2,0,616,4,0,0,1,0,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',22,20,2,0,0,850,2,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',8,29,7,0,0,269,4,3,0,1,1,16);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',21,24,1,0,0,2,1,0,0,1,1,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',23,18,3,0,0,477,3,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',11,31,1,0,0,1,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',19,27,2,0,0,1,2,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',37,20,7,0,0,166,5,2,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',7,34,34,6,1,80,33,1,2,2,0,35);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',11,9,1,0,0,719,1,0,0,1,1,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',21,24,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',4,32,1,0,1,3,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',22,15,1,1,1,841,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',7,25,9,0,0,131,6,3,0,1,1,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',17,19,2,0,0,551,2,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',12,21,1,0,0,648,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',17,31,7,4,0,338,6,1,1,2,0,17);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',19,25,2,0,0,1,2,0,0,1,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',19,29,8,0,0,234,6,2,0,2,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',2,34,1,0,0,3,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',21,25,2,0,0,444,1,1,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',5,24,1,0,0,2,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',22,12,1,0,0,363,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',22,14,6,0,0,179,6,0,1,0,0,12);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',18,26,1,1,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',9,27,3,0,0,785,3,0,0,1,0,10);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',8,29,2,0,0,1,1,1,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',22,23,3,0,0,237,2,1,0,0,0,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',10,26,3,0,0,574,3,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',5,16,1,0,0,1,1,0,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',45,2,1,0,0,77,0,1,0,1,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',12,12,1,0,0,995,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',2,26,3,0,0,706,3,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',9,24,3,0,0,270,1,2,1,0,0,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',3,31,1,0,0,3,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',19,27,2,0,0,857,2,0,0,0,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',20,13,1,0,0,1,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',20,15,1,0,0,490,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',20,16,1,0,0,924,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',22,33,3,0,0,704,3,0,0,0,0,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',8,29,6,0,0,402,6,0,0,0,0,12);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',22,28,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',3,25,2,0,0,1,2,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',14,27,1,0,0,2,1,0,1,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',9,26,5,0,0,428,5,0,0,1,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',20,26,14,0,0,113,12,2,1,1,1,15);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',4,8,1,0,0,440,1,0,1,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',6,32,5,5,0,545,5,0,1,0,0,16);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',12,25,1,0,0,2,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',15,32,2,0,0,1,2,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',9,34,12,1,0,241,12,0,0,1,1,34);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',10,32,11,2,0,239,11,0,1,1,0,32);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',11,32,3,0,0,594,3,0,0,0,0,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',6,31,2,0,0,1,2,0,0,1,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',19,31,1,0,0,2,0,1,0,1,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',9,31,13,0,0,137,11,2,0,3,2,20);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',6,31,4,0,0,698,4,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',22,35,8,2,0,363,8,0,1,1,1,16);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',11,31,7,1,0,385,7,0,0,0,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',9,28,8,0,0,190,5,3,0,2,1,17);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',16,29,1,0,1,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',11,22,2,1,0,625,2,0,0,1,1,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',22,20,2,0,0,395,0,2,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',8,11,1,0,0,313,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',18,23,1,0,0,647,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',9,25,7,0,0,212,7,0,0,1,0,14);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',10,34,9,3,0,318,9,0,0,0,0,21);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',7,32,4,1,0,564,4,0,0,1,1,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',15,25,2,0,0,758,2,0,0,1,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',7,32,13,1,0,171,13,0,2,1,0,21);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',15,15,2,0,0,365,2,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',18,26,2,0,1,1,2,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',16,26,1,0,2,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',19,30,11,1,0,180,7,4,1,1,0,21);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',19,26,4,0,0,430,4,0,0,0,0,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',7,28,5,2,0,436,5,0,1,0,0,14);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',9,29,2,0,0,951,1,1,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',21,28,1,0,0,1,0,1,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',12,21,1,0,0,845,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',21,30,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',10,21,1,0,0,2,1,0,1,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',22,9,2,0,0,268,2,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',20,27,2,0,0,1,2,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',20,33,1,0,2,3,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',20,23,1,0,0,1,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',10,12,3,0,0,244,3,0,0,1,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',8,18,3,1,0,301,3,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',9,29,11,0,0,154,10,1,0,0,0,11);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',23,11,1,0,0,817,0,1,1,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',7,29,9,0,0,210,7,2,0,2,0,31);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',6,31,3,0,0,779,3,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',19,30,3,0,0,573,3,0,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',29,28,7,0,0,322,7,0,0,1,0,16);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',10,32,46,4,0,57,40,6,1,4,3,43);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',16,27,1,0,0,1,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',5,22,1,0,0,2,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',19,31,3,0,0,668,3,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',3,11,1,0,0,861,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',14,22,1,0,0,772,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',18,5,1,0,0,86,0,1,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',25,23,8,0,1,194,8,0,1,2,0,17);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',3,19,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',9,33,5,0,0,321,4,1,0,2,1,15);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',4,28,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',14,33,6,0,0,475,6,0,1,1,0,15);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',5,30,4,0,0,664,4,0,0,0,0,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',8,13,1,0,0,320,0,1,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',10,30,9,0,0,214,7,2,0,1,1,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',15,19,1,0,0,2,1,0,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',23,32,1,0,0,3,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',7,23,1,0,0,1,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',21,34,4,1,0,445,3,1,1,1,0,11);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',6,14,1,0,0,978,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',3,32,2,0,0,1,2,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',14,35,2,0,0,2,2,0,0,1,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',6,31,5,0,0,392,4,1,0,0,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',23,33,2,0,0,1,2,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',8,28,2,0,0,804,2,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',38,7,1,0,0,522,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',25,16,1,0,0,961,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',25,27,3,0,0,258,1,2,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',16,28,6,0,0,125,1,5,0,2,1,10);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',17,24,3,0,0,511,3,0,0,0,0,10);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',10,14,2,0,0,605,2,0,0,1,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',20,16,1,0,0,568,0,1,1,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',25,25,4,0,0,433,4,0,0,1,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ath',10,33,6,0,0,479,6,0,0,0,0,15);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',10,33,12,0,0,234,12,0,2,1,0,26);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',11,14,1,0,0,837,1,0,0,1,1,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',9,19,3,0,0,218,2,1,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',11,35,5,0,0,601,5,0,0,0,0,14);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('cel',18,21,3,0,0,244,1,2,1,1,0,9);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',20,21,6,0,0,274,6,0,0,1,0,13);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',12,20,2,0,1,780,2,0,0,1,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',17,21,1,0,0,2,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',14,26,3,0,0,671,3,0,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',14,6,2,0,0,177,2,0,0,0,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',16,22,1,0,0,1,0,1,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',17,25,5,0,0,376,5,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',3,28,1,0,0,2,1,0,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('sev',15,6,2,0,0,221,2,0,0,1,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',10,32,15,3,0,172,15,0,1,2,1,35);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',9,32,8,4,0,358,8,0,1,1,0,18);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',9,33,28,8,0,101,28,0,1,3,0,45);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('osa',23,22,2,0,0,781,2,0,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',18,16,1,0,0,1,1,0,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',8,29,5,0,0,245,5,0,0,1,0,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',15,4,1,0,0,57,0,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',28,17,2,0,0,603,2,0,1,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',20,23,4,0,0,473,4,0,0,1,1,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',11,33,13,0,0,189,13,0,0,0,0,30);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',9,10,2,0,0,385,1,1,2,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',9,32,21,5,0,127,21,0,0,3,0,34);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',31,32,1,0,0,3,0,1,0,1,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',6,10,2,0,0,254,2,0,0,0,0,6);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',27,15,1,0,0,313,0,1,1,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',24,30,8,0,0,195,4,4,0,0,0,16);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',24,31,17,2,0,158,17,0,0,3,0,33);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',11,28,4,0,0,409,4,0,0,2,0,11);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',8,22,1,0,0,1,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',31,12,1,0,0,538,0,1,0,1,1,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bet',14,14,2,0,0,436,2,0,0,1,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',6,24,2,0,0,827,1,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',12,18,3,0,0,332,3,0,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',16,29,1,0,0,2,1,0,0,0,0,1);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',23,11,2,0,0,240,2,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('get',16,8,1,0,0,697,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',9,25,7,0,0,305,7,0,1,2,0,16);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rma',4,26,4,0,0,567,4,0,0,1,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('dep',19,15,2,0,0,602,2,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',20,23,3,0,0,464,2,1,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',8,25,3,0,0,681,3,0,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',5,11,1,0,0,267,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',11,24,2,0,0,629,1,1,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('atm',5,21,2,0,0,642,1,1,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('val',24,30,1,0,0,2,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('ray',2,32,1,0,0,3,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',10,35,10,0,0,227,9,1,1,2,1,26);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('lev',10,32,3,0,0,930,3,0,0,0,0,8);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mal',18,30,8,1,0,295,8,0,1,1,0,21);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('vad',22,22,3,3,0,632,3,0,1,1,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('zar',32,30,1,0,0,2,1,0,0,0,0,3);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',4,31,1,0,0,3,1,0,0,0,0,2);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('esp',22,24,3,0,0,576,2,1,0,0,0,7);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('mga',3,31,2,0,1,1,2,0,0,0,0,4);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('rso',10,32,7,2,0,370,7,0,0,2,0,11);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('bar',6,26,5,0,0,397,4,1,0,0,0,5);
INSERT INTO `golejadors` (`equip`,`dorsal`,`partits`,`gols`,`penals`,`pp`,`minutsgol`,`gtitular`,`gsuplent`,`gpunts`,`gvictoria`,`gremuntada`,`percent`) VALUES ('gda',9,28,6,1,0,293,6,0,1,0,0,19);


/*
-- Query: select * from porters
LIMIT 0, 1000

-- Date: 2013-05-19 20:51
*/
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('dep',1,32,63);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('mal',13,32,61);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('ath',1,32,56);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('cel',13,34,50);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('bet',13,30,45);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('zar',1,31,45);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('ray',1,27,44);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('osa',13,35,42);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('lev',1,29,41);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('val',1,24,39);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('get',1,29,39);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('mga',13,34,38);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('gda',1,24,37);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('vad',13,24,37);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('rso',1,28,36);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('bar',1,29,32);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('rma',25,23,28);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('atm',13,35,28);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('esp',1,16,24);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('esp',13,20,23);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('sev',1,15,19);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('sev',13,12,17);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('rma',1,19,17);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('gda',13,11,16);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('get',13,7,13);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('ray',25,8,13);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('vad',1,11,13);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('val',13,11,11);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('rso',13,7,9);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('mga',1,3,7);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('mal',1,3,7);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('zar',13,3,6);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('bar',13,6,6);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('lev',13,6,6);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('bet',25,2,5);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('ray',13,2,4);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('ath',13,3,4);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('bet',1,4,4);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('rma',13,3,3);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('dep',13,4,3);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('mal',25,1,2);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('atm',1,1,2);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('zar',30,2,2);
INSERT INTO `porters` (`equip`,`dorsal`,`partits`,`gols`) VALUES ('cel',1,2,2);


/*
-- Query: select * from jornades
LIMIT 0, 1000

-- Date: 2013-05-19 20:49
*/
INSERT INTO `jornades` (`num`,`data`) VALUES (1,'2012-08-19');
INSERT INTO `jornades` (`num`,`data`) VALUES (2,'2012-08-26');
INSERT INTO `jornades` (`num`,`data`) VALUES (3,'2013-12-29');
INSERT INTO `jornades` (`num`,`data`) VALUES (4,'2012-09-16');
INSERT INTO `jornades` (`num`,`data`) VALUES (5,'2012-09-23');
INSERT INTO `jornades` (`num`,`data`) VALUES (6,'2002-01-11');
INSERT INTO `jornades` (`num`,`data`) VALUES (7,'2013-05-13');
INSERT INTO `jornades` (`num`,`data`) VALUES (8,'2012-10-21');
INSERT INTO `jornades` (`num`,`data`) VALUES (9,'2012-10-28');
INSERT INTO `jornades` (`num`,`data`) VALUES (10,'2012-11-04');
INSERT INTO `jornades` (`num`,`data`) VALUES (11,'2012-11-11');
INSERT INTO `jornades` (`num`,`data`) VALUES (12,'2012-11-18');
INSERT INTO `jornades` (`num`,`data`) VALUES (13,'2012-11-25');
INSERT INTO `jornades` (`num`,`data`) VALUES (14,'2012-12-02');
INSERT INTO `jornades` (`num`,`data`) VALUES (15,'2012-12-09');
INSERT INTO `jornades` (`num`,`data`) VALUES (16,'2012-12-16');
INSERT INTO `jornades` (`num`,`data`) VALUES (17,'2012-12-22');
INSERT INTO `jornades` (`num`,`data`) VALUES (18,'2013-01-06');
INSERT INTO `jornades` (`num`,`data`) VALUES (19,'2013-01-13');
INSERT INTO `jornades` (`num`,`data`) VALUES (20,'2013-01-20');
INSERT INTO `jornades` (`num`,`data`) VALUES (21,'2013-01-27');
INSERT INTO `jornades` (`num`,`data`) VALUES (22,'2013-02-03');
INSERT INTO `jornades` (`num`,`data`) VALUES (23,'2013-02-10');
INSERT INTO `jornades` (`num`,`data`) VALUES (24,'2013-02-17');
INSERT INTO `jornades` (`num`,`data`) VALUES (25,'2013-02-24');
INSERT INTO `jornades` (`num`,`data`) VALUES (26,'2013-03-03');
INSERT INTO `jornades` (`num`,`data`) VALUES (27,'2013-03-10');
INSERT INTO `jornades` (`num`,`data`) VALUES (28,'2013-03-17');
INSERT INTO `jornades` (`num`,`data`) VALUES (29,'2013-03-31');
INSERT INTO `jornades` (`num`,`data`) VALUES (30,'2013-04-07');
INSERT INTO `jornades` (`num`,`data`) VALUES (31,'2013-04-14');
INSERT INTO `jornades` (`num`,`data`) VALUES (32,'2013-04-21');
INSERT INTO `jornades` (`num`,`data`) VALUES (33,'2013-04-28');
INSERT INTO `jornades` (`num`,`data`) VALUES (34,'2013-05-05');
INSERT INTO `jornades` (`num`,`data`) VALUES (35,'2013-05-12');
INSERT INTO `jornades` (`num`,`data`) VALUES (36,'2013-05-19');
INSERT INTO `jornades` (`num`,`data`) VALUES (37,'2013-05-29');
INSERT INTO `jornades` (`num`,`data`) VALUES (38,'2013-06-01');


/*
-- Query: select * from partits
LIMIT 0, 1000

-- Date: 2013-05-20 00:11
*/
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','atm',21,3,0,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','bar',33,2,2,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','bet',1,3,5,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','cel',15,1,0,39);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','dep',13,1,1,36);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','esp',23,0,4,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','gda',29,1,0,39);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','get',9,1,2,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','lev',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','mal',35,2,1,39);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','mga',5,0,0,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','osa',7,1,0,39);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','ray',19,1,2,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','rma',31,0,3,35);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','rso',25,1,3,42);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','sev',11,2,1,59);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','vad',3,2,0,70);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','val',27,1,0,53);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ath','zar',17,0,2,30);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','ath',2,4,0,80);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','bar',35,1,2,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','bet',22,1,0,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','cel',17,1,0,81);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','dep',15,6,0,94);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','esp',25,1,0,65);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','gda',31,5,0,73);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','get',11,2,0,64);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','lev',20,2,0,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','mal',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','mga',7,2,1,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','osa',9,3,1,76);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','ray',4,4,3,63);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','rma',33,1,2,41);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','rso',27,0,1,45);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','sev',13,4,0,68);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','vad',5,2,1,67);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','val',29,1,1,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('atm','zar',19,2,0,80);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','ath',14,5,1,78);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','atm',16,4,1,75);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','bet',34,4,2,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','cel',10,3,1,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','dep',27,2,0,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','esp',18,4,0,78);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','gda',5,2,0,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','get',23,6,1,81);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','lev',32,1,0,69);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','mal',30,5,0,81);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','mga',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','osa',21,5,1,78);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','ray',28,3,1,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','rma',7,2,2,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','rso',1,5,1,78);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','sev',25,2,1,69);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','vad',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','val',3,1,0,69);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bar','zar',12,3,1,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','ath',20,1,1,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','atm',3,2,4,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','bar',15,1,2,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','cel',35,1,0,53);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','dep',33,1,1,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','esp',5,1,0,53);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','gda',11,1,2,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','get',29,0,0,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','lev',19,2,0,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','mal',17,1,2,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','mga',25,3,0,61);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','osa',27,2,1,53);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','ray',2,1,2,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','rma',13,1,0,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','rso',7,2,0,54);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','sev',31,3,3,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','vad',23,0,0,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','val',9,1,0,53);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('bet','zar',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','ath',34,1,1,68);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','atm',36,1,3,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','bar',29,2,2,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','bet',16,0,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','dep',9,1,1,76);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','esp',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','gda',25,2,1,29);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','get',5,2,1,61);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','lev',14,1,1,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','mal',12,1,1,80);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','mga',1,0,1,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','osa',3,2,0,76);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','ray',30,0,2,54);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','rma',27,1,2,41);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','rso',21,1,1,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','sev',7,2,0,62);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','vad',18,3,1,70);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','val',23,0,1,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('cel','zar',32,2,1,77);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','ath',32,1,1,68);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','atm',34,0,0,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','bar',8,4,5,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','bet',14,2,3,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','cel',28,3,1,34);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','esp',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','gda',23,0,3,19);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','get',3,1,1,58);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','lev',12,0,2,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','mal',10,1,0,31);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','mga',18,1,0,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','osa',1,2,0,76);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','ray',26,0,0,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','rma',25,1,2,41);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','rso',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','sev',5,0,2,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','vad',16,0,0,64);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','val',21,2,3,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('dep','zar',30,3,2,77);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','ath',4,3,3,42);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','atm',6,0,1,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','bar',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','bet',24,1,0,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','cel',19,1,0,45);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','dep',17,2,0,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','gda',33,0,1,39);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','get',13,0,2,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','lev',22,3,2,45);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','mal',20,3,2,45);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','mga',9,0,0,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','osa',11,0,3,33);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','ray',8,3,2,63);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','rma',35,1,1,44);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','rso',29,2,2,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','sev',15,2,2,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','vad',26,0,0,42);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','val',31,3,3,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('esp','zar',2,1,2,39);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','ath',10,1,2,65);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','atm',12,0,1,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','bar',24,1,2,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','bet',30,1,5,42);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','cel',6,2,1,81);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','dep',4,1,1,76);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','esp',14,0,0,62);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','get',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','lev',28,1,1,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','mal',26,1,2,77);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','mga',34,1,0,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','osa',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','ray',20,2,0,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','rma',22,1,0,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','rso',16,0,0,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','sev',2,1,1,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','vad',32,1,1,64);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','val',18,1,2,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('gda','zar',8,1,2,71);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','ath',28,1,0,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','atm',30,0,0,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','bar',4,1,4,31);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','bet',10,2,4,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','cel',24,3,1,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','dep',22,3,1,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','esp',32,0,2,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','gda',19,2,2,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','lev',8,0,1,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','mal',6,1,0,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','mga',14,1,0,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','osa',16,1,1,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','ray',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','rma',2,2,1,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','rso',34,2,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','sev',20,1,1,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','vad',12,2,1,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','val',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('get','zar',26,2,0,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','ath',18,3,1,44);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','atm',1,1,1,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','bar',13,0,4,28);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','bet',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','cel',33,0,1,35);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','dep',31,0,4,26);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','esp',3,3,2,65);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','gda',9,3,1,44);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','get',27,0,0,58);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','mal',15,4,0,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','mga',23,1,2,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','osa',25,0,2,32);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','ray',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','rma',11,1,2,41);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','rso',5,2,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','sev',29,1,0,59);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','vad',21,2,1,67);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','val',7,1,0,53);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('lev','zar',35,0,0,38);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','ath',16,0,1,65);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','atm',18,1,1,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','bar',11,2,4,34);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','bet',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','cel',31,1,0,81);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','dep',29,2,3,73);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','esp',1,2,1,65);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','gda',7,1,2,21);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','get',25,1,3,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','lev',34,1,1,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','mga',21,2,3,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','osa',23,1,1,70);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','ray',32,1,1,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','rma',9,0,5,29);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','rso',3,1,0,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','sev',27,2,1,59);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','vad',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','val',5,2,0,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mal','zar',14,1,1,74);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','ath',24,1,0,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','atm',26,0,0,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','bar',19,1,3,34);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','bet',6,4,0,64);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','cel',20,1,1,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','dep',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','esp',28,0,2,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','gda',15,4,0,64);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','get',33,2,1,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','lev',4,3,1,58);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','mal',2,1,1,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','osa',31,1,0,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','ray',10,1,2,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','rma',17,3,2,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','rso',11,1,2,45);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','sev',35,0,0,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','vad',8,2,1,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','val',13,4,0,62);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('mga','zar',22,1,1,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','ath',26,0,1,65);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','atm',28,0,2,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','bar',2,1,2,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','bet',8,0,0,54);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','cel',22,1,0,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','dep',20,2,1,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','esp',30,0,2,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','gda',17,1,2,31);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','get',35,1,0,61);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','lev',6,4,0,78);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','mal',4,1,1,34);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','mga',12,0,0,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','ray',14,1,0,63);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','rma',19,0,0,44);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','rso',32,0,0,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','sev',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','vad',10,0,1,61);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','val',15,0,1,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('osa','zar',24,1,0,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','ath',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','atm',23,2,1,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','bar',9,0,5,25);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','bet',21,3,0,63);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','cel',11,3,2,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','dep',7,2,1,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','esp',27,2,0,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','gda',1,1,0,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','get',18,3,1,64);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','lev',17,3,0,53);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','mal',13,2,0,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','mga',29,1,3,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','osa',33,2,2,44);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','rma',5,0,2,38);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','rso',31,0,2,42);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','sev',3,0,0,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','vad',25,1,2,41);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','val',35,0,4,38);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('ray','zar',15,0,2,38);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','ath',12,5,1,80);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','atm',14,2,0,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','bar',26,2,1,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','bet',32,3,1,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','cel',8,2,0,84);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','dep',6,5,1,88);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','esp',16,2,2,62);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','gda',3,3,0,69);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','get',21,4,0,70);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','lev',30,5,1,78);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','mal',28,5,2,89);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','mga',36,6,2,64);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','osa',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','ray',24,2,0,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','rso',18,4,3,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','sev',23,4,1,65);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','vad',34,4,3,67);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','val',1,1,1,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rma','zar',10,4,0,86);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','ath',6,2,0,74);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','atm',8,0,1,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','bar',20,3,2,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','bet',26,3,3,54);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','cel',2,2,1,81);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','dep',19,1,1,76);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','esp',10,0,1,59);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','gda',35,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','get',15,1,1,58);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','lev',24,1,1,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','mal',22,3,0,89);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','mga',30,4,2,58);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','osa',13,0,0,70);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','ray',12,4,0,72);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','rma',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','sev',17,2,1,59);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','vad',28,4,1,73);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','val',33,4,2,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('rso','zar',4,2,0,80);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','ath',30,2,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','atm',32,0,1,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','bar',6,2,3,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','bet',12,5,1,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','cel',26,4,1,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','dep',24,3,1,54);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','esp',34,3,0,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','gda',21,3,0,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','get',1,2,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','lev',10,0,0,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','mal',8,3,2,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','mga',16,0,2,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','osa',18,1,0,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','ray',22,2,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','rma',4,1,0,47);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','rso',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','vad',14,1,2,45);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','val',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('sev','zar',28,4,0,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','ath',22,2,2,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','atm',24,0,3,37);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','bar',17,1,3,34);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','bet',4,0,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','cel',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','dep',35,1,0,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','esp',7,1,1,62);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','gda',13,1,0,43);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','get',31,2,1,61);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','lev',2,2,0,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','mal',19,3,1,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','mga',27,1,1,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','osa',29,1,3,34);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','ray',6,6,1,75);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','rma',15,2,3,41);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','rso',9,2,2,48);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','sev',33,1,1,56);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','val',11,1,1,50);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('vad','zar',20,2,0,46);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','ath',8,3,2,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','atm',10,2,0,52);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','bar',22,1,1,40);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','bet',28,3,0,63);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','cel',4,2,1,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','dep',2,3,3,54);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','esp',12,2,1,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','gda',37,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','get',17,4,2,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','lev',26,2,2,54);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','mal',24,2,0,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','mga',32,5,1,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','osa',34,4,0,66);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','ray',16,0,1,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','rma',20,0,5,29);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','rso',14,2,5,39);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','sev',19,2,0,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','vad',30,2,1,57);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('val','zar',6,2,0,60);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','ath',36,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','atm',38,NULL,NULL,NULL);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','bar',31,0,3,31);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','bet',18,1,2,51);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','cel',13,0,1,27);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','dep',11,5,3,36);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','esp',21,0,0,62);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','gda',27,0,0,30);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','get',7,0,1,55);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','lev',16,0,1,63);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','mal',33,3,2,33);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','mga',3,0,1,49);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','osa',5,3,1,76);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','ray',34,3,0,69);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','rma',29,1,1,44);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','rso',23,1,2,45);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','sev',9,2,1,59);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','vad',1,0,1,61);
INSERT INTO `partits` (`equipc`,`equipf`,`jornada`,`golsc`,`golsf`,`possessioc`) VALUES ('zar','val',25,2,2,50);

