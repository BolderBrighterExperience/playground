DROP TABLE OFICII CASCADE CONSTRAINTS;

CREATE TABLE OFICII (
COD_OFICIU VARCHAR2(2)NOT NULL CONSTRAINT COD_OFICIU PRIMARY KEY,
LOCALITATE VARCHAR2(15),
REGIUNEA VARCHAR2(6),
COD_MANAGER VARCHAR2(3)
);

DROP TABLE COMPANII CASCADE CONSTRAINTS;

CREATE TABLE COMPANII(
COD_COMPANIE VARCHAR2(2) NOT NULL CONSTRAINT COD_COMPANIE PRIMARY KEY,
COMPANIA VARCHAR2(15),
REPREZENTANT_COMPANIE VARCHAR2(3),
DATORIA NUMBER(10,2)
);

DROP TABLE ANGAJATI CASCADE CONSTRAINTS;

CREATE TABLE ANGAJATI(
COD_ANGAJAT VARCHAR2(2) NOT NULL CONSTRAINT COD_ANGAJAT PRIMARY KEY,
NUME VARCHAR2(15),
PRENUME VARCHAR2(15),
VARSTA NUMBER,
FUNCTIA VARCHAR2(20),
COD_OFICIU VARCHAR2(2),
DATA_ANGAJARII DATE,
SUMA_PLANIFICATA NUMBER(10,2)
);

DROP TABLE PRODUSE CASCADE CONSTRAINTS;

CREATE TABLE PRODUSE(
COD_PRODUS NUMBER CONSTRAINT COD_PRODUS PRIMARY KEY,
DESCRIERE VARCHAR2(30),
PRET NUMBER(10,2),
EXISTA VARCHAR2(1),
CONSTRAINT CHECK_EXISTA CHECK(EXISTA='Y' OR EXISTA='N')
);

DROP SEQUENCE INTERN09.COD_PRODUS_SEQ;

CREATE SEQUENCE COD_PRODUS_SEQ
		INCREMENT BY 1
		START WITH 1
		MAXVALUE 9999
		NOCACHE
		NOCYCLE;

DROP TABLE TRANZACTII CASCADE CONSTRAINTS;
    
CREATE TABLE TRANZACTII(
DATA_COMENZII DATE,
COD_CLIENT VARCHAR2(2),
COD_VANZATOR VARCHAR2(3),
COD_PRODUS NUMBER,
CANTITATEA NUMBER
);