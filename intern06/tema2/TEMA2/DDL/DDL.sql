
DROP table GL_OFICII cascade constraints;

CREATE table GL_OFICII (
      Cod_oficiu varchar2(2),
      Localitatea varchar2(15),
		  Regiunea varchar2(6),
		  Cod_manager varchar2(3),
		  CONSTRAINT pk_Cod_oficiu PRIMARY KEY(Cod_oficiu)
		  );


DROP table GL_COMPANII cascade constraints;

CREATE TABLE GL_COMPANII (
			Cod_companie varchar2(2),
			Compania varchar2(15),
			Reprezentant_companie varchar2(3),
			Datoria number(10,2),
			CONSTRAINT pk_Cod_companie PRIMARY KEY(Cod_companie)
			);


DROP table GL_ANGAJATI cascade constraints;

CREATE TABLE GL_ANGAJATI (
			Cod_angajat varchar2(2),
			Nume varchar2(15),
			Prenume varchar2(15),
			Varsta number,
			Fuctia varchar2(20),
			Cod_oficiu varchar(2),
			Data_angajarii date,
			Suma_planificata number(10,2),
			CONSTRAINT pk_Cod_angajat PRIMARY KEY(Cod_angajat)
			);


DROP table GL_PRODUSE cascade constraints;

CREATE table GL_PRODUSE(
			Cod_produs number,
			Descriere varchar2(30),
			Pret number(10,2),
			Exista varchar2(1) NOT NULL CONSTRAINT Exista CHECK (Exista='Y' or Exista='N'),
      CONSTRAINT pk_Cod_produs PRIMARY KEY(Cod_produs)
		    );
	
  
  		
DROP table GL_TRANZACTII cascade constraints;
			
CREATE table GL_TRANZACTII(
			Data_comenzii date,
			Cod_client varchar2(2),
			Cod_vanzator varchar2(3),
			Cod_produs number,
      Cantitatea number
		    );	
			
			
ALTER TABLE GL_OFICII
    ADD CONSTRAINT fk_Cod_manager FOREIGN KEY(Cod_manager) 
    REFERENCES GL_ANGAJATI(Cod_angajat); 	

ALTER TABLE GL_COMPANII
    ADD CONSTRAINT fk_Reprezentant_companie FOREIGN KEY(Reprezentant_companie) 
    REFERENCES GL_ANGAJATI(Cod_angajat);

ALTER TABLE GL_ANGAJATI
    ADD CONSTRAINT fk_Cod_oficiu FOREIGN KEY(Cod_oficiu) 
    REFERENCES GL_OFICII(Cod_oficiu);

ALTER TABLE GL_TRANZACTII
    ADD CONSTRAINT fk_Cod_client FOREIGN KEY(Cod_client) 
    REFERENCES GL_COMPANII(Cod_companie);

ALTER TABLE GL_TRANZACTII
    ADD CONSTRAINT fk_Cod_vanzator FOREIGN KEY(Cod_vanzator) 
    REFERENCES GL_ANGAJATI(Cod_angajat);

ALTER TABLE GL_TRANZACTII
    ADD CONSTRAINT fk_Cod_produs FOREIGN KEY(Cod_produs) 
    REFERENCES GL_PRODUSE(Cod_produs);

DROP sequence Cod_produs_SEQUENCE;
 
CREATE sequence Cod_produs_SEQUENCE
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;  