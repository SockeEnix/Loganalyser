#DDL


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
D_key int PRIMARY KEY AUTO_INCREMENT,
Name varchar(20) NOT NULL);

CREATE TABLE server (
S_key int PRIMARY KEY AUTO_INCREMENT,
Name varchar(20) NOT NULL);

CREATE TABLE meldung (
Me_key int PRIMARY KEY AUTO_INCREMENT,
Text text,
Fehler boolean,
Verlust boolean);

CREATE TABLE M_Me_D_S (
M_key bigint NOT NULL, 
Me_key int NOT NULL, 
D_key int NOT NULL, 
S_key int NOT NULL, 
Foreign Key (M_key) References mail(M_key),
Foreign Key (Me_key) References meldung(Me_key),
Foreign Key (D_key) References dienst(D_key),
Foreign Key (S_key) References server(S_key),
qeued_id varchar(10),
Zeit timestamp);

########################################################################

#DML


DELIMITER $$

#Get

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

CREATE Procedure getMailart(var text)
BEGIN
	SELECT MA_key FROM mailart WHERE Text = var LIMIT 1;
END $$

#Set

CREATE Procedure setMailart(var VARCHAR(40))
BEGIN
	INSERT INTO mailart(Bezeichnung) VALUES(var);
END $$

CREATE Procedure setServer(var VARCHAR(20))
BEGIN
	INSERT INTO server(Name) VALUES(var);
END $$

CREATE Procedure setDienst(var VARCHAR(20))
BEGIN
	INSERT INTO dienst(Name) VALUES(var);
END $$

CREATE Procedure setMeldung(var TEXT, fehler BOOLEAN, verlust BOOLEAN)
BEGIN
	INSERT INTO meldung(Text, Fehler, Verlust) VALUES(var, fehler, verlust);
END $$

CREATE Procedure setRelation(M BIGINT, Me INT, D INT, S INT,qeued VARCHAR(10), _time TIMESTAMP)
BEGIN
	INSERT INTO M_Me_D_S VALUES(M, Me, D, S, qeued,_time);
END $$

CREATE Procedure setMail(MA SMALLINT, kb DOUBLE, hit DOUBLE, absend VARCHAR(50), empfang)
BEGIN
	INSERT INTO mail(MA_key, KBytes, Hit_Points, Absender, Empfaenger) VALUES(MA, kb, hit, absend, empfang);
END


DELIMITER ;


##############################################################################

#Testbeispiele

CALL setServer("test");