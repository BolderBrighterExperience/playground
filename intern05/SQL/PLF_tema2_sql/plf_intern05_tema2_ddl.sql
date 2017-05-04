drop table PLF_oficii CASCADE constraints;
drop table PLF_angajati CASCADE constraints;
drop table PLF_companii CASCADE constraints;
drop table PLF_produse CASCADE constraints;
drop table PLF_tranzactii CASCADE constraints;
drop sequence PLF_SEQ_CODPROD;

create table PLF_oficii(
cod_oficiu varchar2(2) PRIMARY KEY,
localitatea varchar2(15),
regiunea varchar2(6),
cod_manager varchar2(3));

create table PLF_angajati(
cod_angajat varchar2(2) PRIMARY KEY,
nume varchar2(15),
prenume varchar2(15),
varsta number,
functia varchar2(20),
cod_oficiu varchar2(2),
data_angajarii date,
suma_planificata number(*,2));


create table PLF_companii(
cod_companie varchar2(2) PRIMARY KEY,
compania varchar2(15),
reprezentant_companie varchar2(3),
datoria number(*,2));

CREATE SEQUENCE PLF_SEQ_CODPROD
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;


create table PLF_produse(
cod_produs number PRIMARY KEY,
descriere varchar2(30),
pret number(*,2),
exista varchar2(1) check (exista='Y' or exista='N'));

create table PLF_tranzactii(
data_comenzii date,
cod_client varchar2(2),
cod_vanzator varchar2(3),
cod_produs number,
cantitate number);

ALTER TABLE PLF_angajati ADD CONSTRAINT fk_cod_oficiu FOREIGN KEY (cod_oficiu) REFERENCES PLF_oficii(cod_oficiu);

ALTER TABLE PLF_oficii ADD CONSTRAINT fk_cod_manager FOREIGN KEY (cod_manager) REFERENCES PLF_angajati(cod_angajat);

ALTER TABLE PLF_companii ADD CONSTRAINT fk_reprezentant_companie FOREIGN KEY (reprezentant_companie) REFERENCES PLF_angajati(cod_angajat);

ALTER TABLE PLF_tranzactii ADD CONSTRAINT fk_cod_client FOREIGN KEY (cod_client) REFERENCES PLF_companii(cod_companie);

ALTER TABLE PLF_tranzactii ADD CONSTRAINT fk_cod_vanzator FOREIGN KEY (cod_vanzator) REFERENCES PLF_angajati(cod_angajat);

ALTER TABLE PLF_tranzactii ADD CONSTRAINT fk_cod_produs FOREIGN KEY (cod_produs) REFERENCES PLF_produse(cod_produs);

--Adaugati coloana discount_produs de tip NUMBER(7, 2) adugand totodata o constrangere de verificare pentru a va asigura  ca discount_produs este mai mare de 0
ALTER TABLE PLF_produse ADD discount_produs number(7,2) CHECK (discount_produs > 0 );