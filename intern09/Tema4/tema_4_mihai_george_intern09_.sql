/*1. Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela. (prin script)*/

DROP TABLE angajati2;

CREATE TABLE angajati2
AS SELECT * 
FROM angajati;

/*2. Exista vreo diferenta intre cele doua tabele? Daca da, care?

DIFERENTA DINTRE CELE DOUA ESTE CA ANGAJATI2 NU IA FK SI PK,ARE DOAR ACEEASI STRUCTURA SI ACELEASI VALORI CU TABELUL ANGAJATI */

/*3. Redenumiti coloana suma_planificata in salariu. */

ALTER TABLE ANGAJATI2
RENAME COLUMN suma_planificata TO salariu;

/*4. Adaugati 3 angajati noi pentru fiecare oficiu. */

INSERT INTO ANGAJATI2 VALUES ('BD','Barbu','Daniel',38,'contabil','BL',TO_DATE('18.04.2001','DD.MM.YYYY'),100);
INSERT INTO ANGAJATI2 VALUES ('MM','Mihai','Marius',49,'manager','BL',TO_DATE('18.01.2007','DD.MM.YYYY'),7000);
INSERT INTO ANGAJATI2 VALUES ('ML','Messi','Lionel',31,'reprezentant','BL',TO_DATE('23.01.2001','DD.MM.YYYY'),880);

INSERT INTO ANGAJATI2 VALUES ('PG','Pandele','Gabriel',28,'contabil','C',TO_DATE('15.01.2007','DD.MM.YYYY'),1500);
INSERT INTO ANGAJATI2 VALUES ('BA','Buiac','Andrei',55,'manager','C',TO_DATE('18.09.2001','DD.MM.YYYY'),6000);
INSERT INTO ANGAJATI2 VALUES ('EL','Enache','Livia',39,'reprezentant','C',TO_DATE('31.01.2010','DD.MM.YYYY'),300);

INSERT INTO ANGAJATI2 VALUES ('PS','Pantelin','Sergiu',28,'contabil','CH',TO_DATE('18.01.2015','DD.MM.YYYY'),2000);
INSERT INTO ANGAJATI2 VALUES ('LB','Lidia','Buble',35,'manager','CH',TO_DATE('18.06.2001','DD.MM.YYYY'),9000);
INSERT INTO ANGAJATI2 VALUES ('VG','Varzaru','Gabriel',60,'reprezentant','CH',TO_DATE('25.01.2007','DD.MM.YYYY'),100);

INSERT INTO ANGAJATI2 VALUES ('EA','Esca','Andreea',40,'contabil','ED',TO_DATE('18.01.2010','DD.MM.YYYY'),10000);
INSERT INTO ANGAJATI2 VALUES ('MC','Marius','Constantin',30,'manager','ED',TO_DATE('18.01.2003','DD.MM.YYYY'),50);
INSERT INTO ANGAJATI2 VALUES ('BM','Bobonete','Mihai',45,'reprezentant','ED',TO_DATE('18.01.2017','DD.MM.YYYY'),6700);

INSERT INTO ANGAJATI2 VALUES ('OS','Oprea','Stefan',34,'contabil','GL',TO_DATE('23.01.2004','DD.MM.YYYY'),330);
INSERT INTO ANGAJATI2 VALUES ('OV','Olteanu','Vlad',42,'manager','GL',TO_DATE('18.01.2003','DD.MM.YYYY'),990);
INSERT INTO ANGAJATI2 VALUES ('DC','Dinu','Cornel',26,'reprezentant','GL',TO_DATE('15.08.2002','DD.MM.YYYY'),4000);

INSERT INTO ANGAJATI2 VALUES ('VV','Valeriu','Valentin',33,'contabil','OR',TO_DATE('19.05.2006','DD.MM.YYYY'),3000);
INSERT INTO ANGAJATI2 VALUES ('VM','Vanghelie','Marian',31,'manager','OR',TO_DATE('28.09.2006','DD.MM.YYYY'),1500);
INSERT INTO ANGAJATI2 VALUES ('DC','Daum','Cristophoro',25,'reprezentant','OR',TO_DATE('10.04.2008','DD.MM.YYYY'),1000);

INSERT INTO ANGAJATI2 VALUES ('CC','Candel','Cosmin',31,'contabil','RZ',TO_DATE('22.01.2004','DD.MM.YYYY'),110);
INSERT INTO ANGAJATI2 VALUES ('SM','Sumudica','Marius',47,'reprezentant','RZ',TO_DATE('18.10.2001','DD.MM.YYYY'),10);
INSERT INTO ANGAJATI2 VALUES ('SC','Scarlatescu','Catalin',44,'contabil','RZ',TO_DATE('18.01.2006','DD.MM.YYYY'),50);

INSERT INTO ANGAJATI2 VALUES ('ME','Morcoasa','Emilia',21,'contabil','SR',TO_DATE('28.01.2010','DD.MM.YYYY'),110);
INSERT INTO ANGAJATI2 VALUES ('LL','Lopataru','Lidia',31,'contabil','SR',TO_DATE('18.01.2006','DD.MM.YYYY'),2220);
INSERT INTO ANGAJATI2 VALUES ('BN','Bucur','Nicusor',54,'reprezentant','SR',TO_DATE('18.08.2001','DD.MM.YYYY'),300);

INSERT INTO ANGAJATI2 VALUES ('CC','Chanel','Coco',31,'contabil','UN',TO_DATE('18.01.2014','DD.MM.YYYY'),4440);
INSERT INTO ANGAJATI2 VALUES ('NH','Nitoiu','Horia',29,'contabil','UN',TO_DATE('18.01.2001','DD.MM.YYYY'),4000);
INSERT INTO ANGAJATI2 VALUES ('FL','Frasin','Liviu',20,'reprezentant','UN',TO_DATE('18.01.2001','DD.MM.YYYY'),3000);

COMMIT;

/*5a. Pentru fiecare inregistrare, va trebui sa afisati numele si prenumele angajatului, 
codul oficiului in care lucreaza si salariul acestuia. */

SELECT 
    nume,
    prenume,
    cod_oficiu,
    salariu
FROM angajati2;    

/*5b. Adaugati o coloana in care sa afisati, pentru fiecare inregistrare, media salariala a oficiului in care lucreaza.
[Vom numi aceasta coloana OFFICE_AVG_SAL] */

SELECT 
    nume,
    prenume,
    cod_oficiu,
    salariu,
    AVG(salariu)
OVER (PARTITION BY cod_oficiu ORDER BY cod_oficiu) AS office_avg_sal
FROM angajati2;

/*5c. Adaugati doua coloane in care sa afisati, pentru fiecare inregistrare:  
i. cel mai mic salariu din oficiu care este mai mare decat media salariala a oficiului.  
[Vom numi aceasta coloana SMALLEST_SALARY_ABOVE_AVG_SAL] */
/*media salariala a tuturor salariilor peste media salariala a oficiului. 
[Vom numi aceasta coloana OFFICE_TOP_AVG_SAL] */

/*d. Adaugati o coloana numita raportare in care sa afisati:
i.  'over TOP_AVG', daca salariul respectivului este mai mare decat OFFICE_TOP_AVG_SAL 
ii. 'under TOP_AVG', daca salariul respectivului este mai mic decat OFFICE_TOP_AVG_SAl*/

 SELECT X.COD_OFICIU
        NUME,
        PRENUME,
        SALARIU,
        ROUND(OFFICE_AVG_SAL,2),
        SMALLEST_SALARY_ABOVE_AVG_SAL,
        ROUND(OFFICE_TOP_AVG_SAL,2),
        CASE 
              WHEN SALARIU > OFFICE_TOP_AVG_SAL THEN '> upperAVG' 
              WHEN SALARIU < OFFICE_TOP_AVG_SAL THEN '< upperAVG'
              ELSE '= upperAvg' 
        END AS "RAPOARTE"
FROM (
        SELECT NUME, 
               PRENUME,
               COD_OFICIU,
               SALARIU,
               AVG(SALARIU) OVER (PARTITION BY COD_OFICIU ORDER BY COD_OFICIU) OFFICE_AVG_SAL
        FROM ANGAJATI2
     ) X 
     INNER JOIN
       (SELECT ANGAJATI2.COD_OFICIU,
               MIN(ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL, 
               AVG(ANGAJATI2.SALARIU) OFFICE_TOP_AVG_SAL
        FROM (
              SELECT COD_OFICIU, AVG(SALARIU) AVG_SAL
              FROM ANGAJATI2 GROUP BY COD_OFICIU 
             ) Z
        JOIN ANGAJATI2 ON Z.COD_OFICIU = ANGAJATI2.COD_OFICIU
        WHERE ANGAJATI2.SALARIU >= Z.AVG_SAL
        GROUP BY ANGAJATI2.COD_OFICIU
        ) Y 
        ON X.COD_OFICIU = Y.COD_OFICIU 
        WHERE X.SALARIU > OFFICE_AVG_SAL; 
 

/*6: Modificati query-ul de mai sus astfel incat sa afiseze doar inregistrarile din oficiile care returneaza minim doua rezultate. */
 

SELECT COD_OFICIU,
       NUME,
       PRENUME,
       SALARIU,
       ROUND(OFFICE_AVG_SAL,2)
       OFFICE_TOP_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       Rapoarte
  FROM(
SELECT NUME ,
       PRENUME ,
       X.COD_OFICIU,
       SALARIU,
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
       CASE 
              WHEN SALARIU > OFFICE_TOP_AVG_SAL THEN '> upperAVG' 
              WHEN SALARIU < OFFICE_TOP_AVG_SAL THEN '< upperAVG'
              ELSE '= upperAvg'
       END AS "RAPOARTE" ,
       COUNT(X.COD_OFICIU) 
              OVER (PARTITION BY X.COD_OFICIU ORDER BY X.COD_OFICIU) NR_ANGAJATI      
FROM (
        SELECT NUME, 
               PRENUME,
               COD_OFICIU,
               SALARIU,
               AVG(SALARIU) OVER (PARTITION BY COD_OFICIU ORDER BY COD_OFICIU) OFFICE_AVG_SAL
        FROM ANGAJATI2
     ) X 
     INNER JOIN
       (SELECT ANGAJATI2.COD_OFICIU,
               MIN(ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL, 
               AVG(ANGAJATI2.SALARIU) OFFICE_TOP_AVG_SAL
        FROM (
              SELECT COD_OFICIU, AVG(SALARIU) AVG_SAL
              FROM ANGAJATI2 GROUP BY COD_OFICIU 
             ) Z
        JOIN ANGAJATI2 ON Z.COD_OFICIU = ANGAJATI2.COD_OFICIU
        WHERE ANGAJATI2.SALARIU >= Z.AVG_SAL
        GROUP BY ANGAJATI2.COD_OFICIU
        ) 
        Y ON X.COD_OFICIU = Y.COD_OFICIU 
        WHERE X.SALARIU > OFFICE_AVG_SAL 
       ) WHERE  NR_ANGAJATI >1;











