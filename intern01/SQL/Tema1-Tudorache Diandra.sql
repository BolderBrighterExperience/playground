drop table DT_DEPARTMENTS CASCADE CONSTRAINTS;
DROP TABLE DT_EMPLOYEES CASCADE CONSTRAINTS;


create table DT_DEPARTMENTS( ID NUMBER PRIMARY KEY,
                            DENUMIRE VARCHAR2(50));
                            
CREATE TABLE DT_EMPLOYEES(ID NUMBER PRIMARY KEY,
                          NUME VARCHAR2(50),
                          PRENUME VARCHAR2(50),
                          DATA_NASTERII DATE,
                          DATA_ANGAJARII DATE DEFAULT SYSDATE,
                          GEN VARCHAR2(1) CHECK (GEN='M' OR GEN='F'),
                          SALARIU NUMBER DEFAULT 0, 
                          ID_DEPT NUMBER,
                          FOREIGN KEY (ID_DEPT) REFERENCES DT_DEPARTMENTS(ID));

INSERT INTO DT_DEPARTMENTS VALUES(1,'IT');
INSERT INTO DT_DEPARTMENTS VALUES(2,'MARKETING');
INSERT INTO DT_DEPARTMENTS VALUES(3,'CONTABILITATE');
INSERT INTO DT_DEPARTMENTS VALUES(4,'PUBLICITATE');
INSERT INTO DT_DEPARTMENTS VALUES(5,'HR');

INSERT INTO DT_EMPLOYEES VALUES(1,'POPESCU','MIHAI',TO_DATE('10.01.1990','dd.mm.yyyy'),TO_DATE('14.03.2014','dd.mm.yyyy'),'M', 1450,1);
INSERT INTO DT_EMPLOYEES VALUES(2,'IONESCU','ANDREI',TO_DATE('15.09.1890','dd.mm.yyyy'),TO_DATE('12.05.2016','dd.mm.yyyy'),'M',2000,2);
INSERT INTO DT_EMPLOYEES VALUES(3,'ION','MARIA',TO_DATE('01.01.1991','dd.mm.yyyy'),TO_DATE('20.09.2010','dd.mm.yyyy'),'F',1200,3);
INSERT INTO DT_EMPLOYEES VALUES(4,'CRISTESCU','ANDREEA',TO_DATE('03.10.1897','dd.mm.yyyy'),TO_DATE('14.06.2009','dd.mm.yyyy'),'F',2500,4);
INSERT INTO DT_EMPLOYEES VALUES(5,'OANCEA','IOANA',TO_DATE('05.09.1995','dd.mm.yyyy'),TO_DATE('20.06.2013','dd.mm.yyyy'),'F',2300,5);
INSERT INTO DT_EMPLOYEES VALUES(6,'IONESCU','ALIN',TO_DATE('10.01.1990','dd.mm.yyyy'),TO_DATE('01.01.2015','dd.mm.yyyy'),'M',900,1);
INSERT INTO DT_EMPLOYEES VALUES(7,'GRIGORE','RAUL',TO_DATE('12.10.1993','dd.mm.yyyy'),TO_DATE('06.07.2014','dd.mm.yyyy'),'M',940,3);
INSERT INTO DT_EMPLOYEES VALUES(8,'OANCEA','MARIA',TO_DATE('31.03.1970','dd.mm.yyyy'),TO_DATE('15.10.2016','dd.mm.yyyy'),'F',4000,1);
INSERT INTO DT_EMPLOYEES VALUES(9,'CRISTESCU','VASILE',TO_DATE('15.04.1984','dd.mm.yyyy'),TO_DATE('20.04.2014','dd.mm.yyyy'),'M',550,1);

UPDATE DT_EMPLOYEES SET PRENUME=INITCAP(PRENUME);
SELECT * FROM DT_EMPLOYEES;

INSERT INTO DT_EMPLOYEES VALUES(10,'POPESCU','Oana',TO_DATE('23.05.1981','dd.mm.yyyy'),TO_DATE('03.06.2016','dd.mm.yyyy'),'F',750,1);
INSERT INTO DT_EMPLOYEES VALUES(11,'STROE','Ion',TO_DATE('29.09.1982','dd.mm.yyyy'),TO_DATE('01.01.2017','dd.mm.yyyy'),'M',3560,2);
INSERT INTO DT_EMPLOYEES VALUES(12,'POPESCU','Mihai',TO_DATE('20.08.1994','dd.mm.yyyy'),TO_DATE('15.06.2015','dd.mm.yyyy'),'M',230,2);
INSERT INTO DT_EMPLOYEES VALUES(13,'GANEA','Bogdan',TO_DATE('01.02.1997','dd.mm.yyyy'),TO_DATE('01.01.2017','dd.mm.yyyy'),'M',1100,2);
INSERT INTO DT_EMPLOYEES VALUES(14,'MARINESCU','Emil',TO_DATE('25.12.1995','dd.mm.yyyy'),TO_DATE('23.05.2016','dd.mm.yyyy'),'M',1200,3);
INSERT INTO DT_EMPLOYEES VALUES(15,'MARINCA','Eugenia',TO_DATE('29.11.1985','dd.mm.yyyy'),TO_DATE('04.12.2015','dd.mm.yyyy'),'F',900,3);
INSERT INTO DT_EMPLOYEES VALUES(16,'POPA','Rodica',TO_DATE('06.04.1988','dd.mm.yyyy'),TO_DATE('20.10.2015','dd.mm.yyyy'),'F',700,3);
INSERT INTO DT_EMPLOYEES(ID ,NUME,PRENUME,DATA_NASTERII,DATA_ANGAJARII,GEN,SALARIU) VALUES
                          (17,'ICHIM','Cristina',TO_DATE('15.11.1993','dd.mm.yyyy'),TO_DATE('05.11.2016','dd.mm.yyyy'),'F',200);
INSERT INTO DT_EMPLOYEES VALUES(18,'GRECU','Radu',TO_DATE('31.10.1992','dd.mm.yyyy'),TO_DATE('30.08.2016','dd.mm.yyyy'),'M',4570,3);

COMMIT;


--  Selectati toti angajatii care au data nasterii intre 01.01.1990 si 31.12.1995.

SELECT NUME,PRENUME FROM DT_EMPLOYEES WHERE DATA_NASTERII BETWEEN TO_DATE('01.01.1990','dd.mm.yyyy') AND TO_DATE('31.12.1995','dd.mm.yyyy');

--  Numarati angajatii din fiecare departament, care au data angajarii > 01.01.2016.

SELECT COUNT(ID),ID_DEPT FROM DT_EMPLOYEES WHERE (DATA_ANGAJARII) > TO_DATE('01.01.2016','dd.mm.yyyy') GROUP BY ID_DEPT;

--  Selectati angajatii din fiecare department care au primele 2 salarii ca marime din departamentul lor. 

SELECT ID,NUME,PRENUME,TO_CHAR(DATA_NASTERII,'DD.MM.YYYY'),TO_CHAR(DATA_ANGAJARII,'DD.MM.YYYY'),GEN,SALARIU,ID_DEPT
                                FROM DT_EMPLOYEES DT1 WHERE (SELECT COUNT(DISTINCT (SALARIU)) FROM DT_EMPLOYEES DT2 
                                WHERE DT2.ID_DEPT=DT1.ID_DEPT AND DT2.SALARIU >= DT1.SALARIU) <=2 order by id_dept ;

-- Afisati toti angajatii care au salariul mai mare decat media salariului din firma

SELECT ID,NUME,PRENUME,TO_CHAR(DATA_NASTERII,'DD.MM.YYYY'),TO_CHAR(DATA_ANGAJARII,'DD.MM.YYYY'),GEN,SALARIU,ID_DEPT
                                FROM DT_EMPLOYEES WHERE SALARIU>(SELECT AVG(SALARIU) FROM DT_EMPLOYEES);

--  Scrieti un query care sa afiseze intr-o singura coloana:

SELECT 'Angajatul' || ' ' || NUME ||' ' || PRENUME || '' || ' ' || 'are salariul' ||' ' || SALARIU FROM DT_EMPLOYEES;

-- Scrieti un query care sa afiseze pozitia caracterului ?o? din coloana NUME pentru angajatii care au acest character in nume.

SELECT NUME,INSTR(NUME,'O') FROM DT_EMPLOYEES WHERE NUME LIKE '%O%';