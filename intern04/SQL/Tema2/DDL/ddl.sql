DROP TABLE oficii CASCADE CONSTRAINTS;
DROP TABLE companii CASCADE CONSTRAINTS;
DROP TABLE angajati CASCADE CONSTRAINTS;
DROP SEQUENCE produse_seq;
DROP TRIGGER trg_produse;
DROP TABLE produse CASCADE CONSTRAINTS;
DROP TABLE tranzactii CASCADE CONSTRAINTS;

CREATE TABLE oficii (
  cod_oficiu VARCHAR2(2) PRIMARY KEY,
  localitatea VARCHAR2(15),
  regiunea VARCHAR2(6),
  cod_manager VARCHAR2(3));
  
CREATE TABLE companii (
  cod_companie VARCHAR2(2) PRIMARY KEY,
  compania VARCHAR2(15),
  reprezentant_companie VARCHAR2(3),
  datoria NUMBER(*,2));

CREATE TABLE angajati (
  cod_angajat VARCHAR2(2) PRIMARY KEY,
  nume VARCHAR2(15),
  prenume VARCHAR2(15),
  varsta NUMBER,
  functia VARCHAR2(20),
  cod_oficiu VARCHAR2(2),
  data_angajarii date,
  suma_planificata NUMBER(*,2),
  CONSTRAINT fk_cod_oficiu FOREIGN KEY (cod_oficiu) REFERENCES oficii(cod_oficiu));

CREATE TABLE produse (
  cod_produs NUMBER PRIMARY KEY,
  descriere VARCHAR2(24),
  pret NUMBER(*,2),
  exista VARCHAR2(1) check (exista = 'Y' or exista = 'N'));

CREATE SEQUENCE produse_seq start with 1 increment by 1;

CREATE OR REPLACE TRIGGER trg_produse
BEFORE INSERT ON produse
FOR EACH ROW
BEGIN
  SELECT produse_seq.NEXTVAL INTO :new.cod_produs FROM dual;
End;
/

CREATE TABLE tranzactii (
  data_comenzii date,
  cod_client VARCHAR2(2),
  cod_vanzator  VARCHAR2(3),
  cod_produs NUMBER,
  cantitatea NUMBER,
  CONSTRAINT fk_cod_client FOREIGN KEY (cod_client) REFERENCES companii(cod_companie),
  CONSTRAINT fk_cod_vanzator FOREIGN KEY (cod_vanzator) REFERENCES angajati(cod_angajat),
  CONSTRAINT fk_cod_produs FOREIGN KEY(cod_produs) REFERENCES produse(cod_produs));
  
ALTER TABLE oficii ADD CONSTRAINT fk_cod_manager FOREIGN KEY (cod_manager) REFERENCES angajati(cod_angajat);
ALTER TABLE companii ADD CONSTRAINT fk_reprez_comp FOREIGN KEY (reprezentant_companie) REFERENCES angajati(cod_angajat);
