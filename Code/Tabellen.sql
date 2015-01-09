DROP DATABASE IF EXISTS Maillog;

Create DATABASE Maillog;
use Maillog;

CREATE TABLE mailart (
MA_key smallint PRIMARY KEY AUTO_INCREMENT,
Bezeichnung varchar(40) NOT NULL);

CREATE TABLE mail (
M_key bigint Primary Key AUTO_INCREMENT,
MA_key smallint,
KBytes double,
Hit_Points double,
Absender varchar(50),
Empfaenger varchar(50),
FOREIGN KEY (MA_key) References mailart(MA_key));

CREATE TABLE dienst (
D_key varchar(5) PRIMARY KEY,
Name varchar(20) NOT NULL);

CREATE TABLE server (
S_key varchar(5) PRIMARY KEY,
Name varchar(20) NOT NULL);

CREATE TABLE meldung (
Me_key varchar(10) PRIMARY KEY,
Text text,
Fehler boolean,
Verlust boolean);

CREATE TABLE M_Me_D_S (
M_key bigint, 
Me_key varchar(10), 
D_key varchar(5), 
S_key varchar(5), 
Foreign Key (M_key) References mail(M_key),
Foreign Key (Me_key) References meldung(Me_key),
Foreign Key (D_key) References dienst(D_key),
Foreign Key (S_key) References server(S_key),
qeued_id varchar(10),
Zeit timestamp);

INSERT INTO server VALUES("1", "test");

DELIMITER $$
CREATE Procedure getServer(var VARCHAR(20))
BEGIN
	SELECT S_key FROM server WHERE Name = var LIMIT 1;
END $$

CREATE Procedure getDienst(var VARCHAR(20))
BEGIN
	SELECT D_key FROM dienst WHERE Name = var LIMIT 1;
END $$

CREATE Procedure getMeldung(var text)
BEGIN
	SELECT Me_key FROM meldung WHERE Text = var LIMIT 1;
END $$

DELIMITER ;