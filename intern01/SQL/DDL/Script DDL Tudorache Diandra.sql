DROP TABLE DT_oficii CASCADE CONSTRAINTS;
DROP TABLE DT_companii CASCADE CONSTRAINTS;
DROP TABLE DT_angajati CASCADE CONSTRAINTS;
DROP TABLE DT_produse CASCADE CONSTRAINTS;
DROP TABLE DT_tranzactii CASCADE CONSTRAINTS;
DROP SEQUENCE Produs_seq;

CREATE TABLE DT_Oficii(Cod_oficiu VARCHAR2(2) PRIMARY KEY,
                       Localitate VARCHAR2(15),
                       Regiunea VARCHAR2(6),
                       Cod_manager VARCHAR2(3));
                    
                    
CREATE TABLE DT_Companii(Cod_companie VARCHAR2(2) PRIMARY KEY,
                         Compania VARCHAR2(15),
                         Reprezentant_companie VARCHAR2(3),
                         Datoria NUMBER(*,2));
                      
CREATE TABLE DT_Angajati(Cod_angajat VARCHAR2(2) PRIMARY KEY,
                         Nume VARCHAR2(15),
                         Prenume VARCHAR2(15),
                         Varsta NUMBER,
                         Functia VARCHAR2(20),
                         Cod_oficiu VARCHAR2(2),
                         Data_angajarii DATE,
                         Suma_planificata NUMBER(*,2),
                         CONSTRAINT dtangajati_Cod_oficiu_FK FOREIGN KEY(Cod_oficiu) REFERENCES DT_Oficii(Cod_oficiu));
  
 CREATE TABLE DT_Produse(Cod_produs NUMERIC PRIMARY KEY,
                        Descriere VARCHAR2(30),
                        Pret NUMBER(*,2),
                        Exista VARCHAR2(1) CHECK (Exista='Y' or Exista='N'));
                      
ALTER TABLE DT_Oficii ADD CONSTRAINT dtoficii_Cod_manager_FK FOREIGN KEY (Cod_manager) REFERENCES DT_Angajati(cod_angajat);  

ALTER TABLE DT_Companii ADD CONSTRAINT dtcompanii_repr_FK FOREIGN KEY (Reprezentant_companie) REFERENCES DT_Angajati(cod_angajat);   

                      
CREATE TABLE DT_Tranzactii(Data_comenzii DATE,
                            Cod_client VARCHAR2(2),
                            Cod_vanzator VARCHAR2(3),
                            Cod_produs NUMBER,
                            Cantitate NUMBER,
                            CONSTRAINT cod_cl_tranzactii_FK FOREIGN KEY (Cod_client) REFERENCES DT_Companii(Cod_companie),
                            CONSTRAINT cod_vanzator_tranzactii_FK FOREIGN KEY (Cod_vanzator) REFERENCES DT_Angajati(Cod_angajat),
                            CONSTRAINT cod_produs_tranzactii_FK FOREIGN KEY(Cod_produs) REFERENCES DT_Produse(Cod_produs));
                            
CREATE SEQUENCE Produs_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;


