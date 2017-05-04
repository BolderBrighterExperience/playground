/*1. Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela. (prin script)*/

DROP TABLE AB_ANGAJATI2;

CREATE TABLE AB_ANGAJATI2
AS 
SELECT *
FROM AB_ANGAJATI;


/*2. Exista vreo diferenta intre cele doua tabele? Daca da, care?
RASPUNS: DIFERENTA INTRE CELE DOUA TABELE ESTE CA AB_ANGAJATI2 PASTREAZA
         STRUCTURA TABELULUI AB_ANGAJATI , DAR NU PRIMESTE SI FOREIGN
         SI PRIMARY KEY-URILE*/

--3. Redenumiti coloana suma_planificata in salariu.--


ALTER TABLE AB_ANGAJATI2
RENAME COLUMN SUMA_PLANIFICATA TO SALARIU;

--4. Adaugati 3 angajati noi pentru fiecare oficiu.--

INSERT INTO AB_ANGAJATI2 
VALUES ( 'BN' , 'Banica' , 'Mihai' , 23 , 'contabil' , 'BL' , TO_DATE('06.07.2004','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'GA' , 'Glodeanu' , 'Ana' , 25 , 'sef' , 'BL' , TO_DATE('18.08.2001','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'SG' , 'Sacasanu' , 'George' , 22 , 'reprezentant' , 'BL' , TO_DATE('15.10.2005','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'GA' , 'Gherca' , 'Ana' , 24 , 'contabil' , 'C' , TO_DATE('23.01.2002','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'HL' , 'Horjea' , 'Lacramioara' , 28 , 'sef' , 'C' , TO_DATE('13.12.2001','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'PD' , 'Pandra' , 'Denisa' , 23 , 'reprezentant' , 'C' , TO_DATE('23.08.1999','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'PL' , 'Popescu' , 'Laura' , 31 , 'contabil' , 'CH' , TO_DATE('18.01.2004','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'MA' , 'Mihai' , 'Adrian' , 27 , 'sef' , 'CH' , TO_DATE('23.05.2003','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'RC' , 'Ronaldo' , 'Cristian' , 25 , 'reprezentant' , 'CH' , TO_DATE('08.07.2000','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'DR' , 'Dinu' , 'Razvan' , 22 , 'contabil' , 'ED' , TO_DATE('18.01.2003','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'MI' , 'Marcu' , 'Ianis' , 22 , 'sef' , 'ED' , TO_DATE('18.12.2001','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'TD' , 'Taune' , 'Dragos' , 21 , 'reprezentant' , 'ED' , TO_DATE('04.04.2004','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'BA' , 'Balasescu' , 'Alexandru' , 31 , 'contabil' , 'GL' , TO_DATE('18.01.2001','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2
VALUES ( 'AC' , 'Apostol' , 'Catalin' , 28 , 'sef' , 'GL' , TO_DATE('12.02.2003','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'VV' , 'Vasiliu' , 'Victor' , 25 , 'reprezentant' , 'GL' , TO_DATE('01.01.2001','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'TA' , 'Taranu' , 'Andrei' , 37 , 'contabil' , 'OR' , TO_DATE('18.01.2002','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'SN' , 'Sanda' , 'Nicolae' , 21 , 'sef' , 'OR' , TO_DATE('02.01.2000','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'BC' , 'Bumba' , 'Claudiu' , 25 , 'reprezentant' , 'OR' , TO_DATE('12.05.2001','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'CD' , 'Cornel' , 'Dinu' , 41 , 'contabil' , 'RZ' , TO_DATE('23.01.2002','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'MA' , 'Mutu' , 'Adrian' , 36 , 'sef' , 'RZ' , TO_DATE('14.05.2001','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'NI' , 'Negoita' , 'Ionut' , 38 , 'reprezentant' , 'RZ' , TO_DATE('02.09.2003','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'PA' , 'Popa' , 'Adi' , 27 , 'contabil' , 'SR' , TO_DATE('12.12.2004','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'SN' , 'Stanciu' , 'Nicusor' , 24 , 'sef' , 'SR' , TO_DATE('30.08.2003','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'CA' , 'Chipciu' , 'Alex' , 26 , 'reprezentant' , 'SR' , TO_DATE('29.01.2002','DD.MM.YYYY') , 2500 );

INSERT INTO AB_ANGAJATI2 
VALUES ( 'AD' , 'Alibec' , 'Denis' , 28 , 'contabil' , 'UN' , TO_DATE('12.04.2004','DD.MM.YYYY') , 0 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'BM' , 'Bordeianu' , 'Marius' , 25 , 'sef' , 'UN' , TO_DATE('29.08.2001','DD.MM.YYYY') , 10000 );
INSERT INTO AB_ANGAJATI2 
VALUES ( 'GO' , 'Gavrila' , 'Oana' , 22 , 'reprezentant' , 'UN' , TO_DATE('27.12.2003','DD.MM.YYYY') , 2500 );


COMMIT;

/*5. Realizati un query in care sa afisati toti angajatii care au 
salariul mai mare decat media oficiului in care lucreaza.
a. Pentru fiecare inregistrare, va trebui sa afisati numele si prenumele
angajatului, codul oficiului in care lucreaza si salariul acestuia.
b. Adaugati o coloana in care sa afisati, pentru fiecare inregistrare,
media salariala a oficiului in care lucreaza. 
[Vom numi aceasta coloana OFFICE_AVG_SAL]
c. Adaugati doua coloane in care sa afisati, pentru fiecare inregistrare:
i.cel mai mic salariu din oficiu care este mai mare decat media salariala 
a oficiului. [Vom numi aceasta coloana SMALLEST_SALARY_ABOVE_AVG_SAL]
ii.media salariala a tuturor salariilor peste media salariala a oficiului. 
[Vom numi aceasta coloana OFFICE_TOP_AVG_SAL]
d. Adaugati o coloana numita raportare in care sa afisati:
i.'over TOP_AVG', daca salariul respectivului este mai mare decat OFFICE_TOP_AVG_SAL
ii.'under TOP_AVG', daca salariul respectivului este mai mic decat OFFICE_TOP_AVG_SAL*/

SELECT X.COD_OFICIU, 
       X.NUME, 
       X.PRENUME,
       X.SALARIU,
       ROUND(X.OFFICE_AVG_SAL) AS OFFICE_AVG_SAL ,
       Y.OFFICE_TOP_AVG_SAL,
       Y.SMALLEST_SALARY_ABOVE_AVG_SAL,      
       CASE 
              WHEN X.SALARIU > Y.OFFICE_TOP_AVG_SAL THEN '> upperAVG' 
              WHEN X.SALARIU < Y.OFFICE_TOP_AVG_SAL THEN '< upperAVG'
              ELSE '= upperAvg' END AS "RAPOARTE"
FROM (
        SELECT NUME, 
               PRENUME,
               COD_OFICIU,
               SALARIU,
               AVG(SALARIU) OVER (PARTITION BY COD_OFICIU ORDER BY COD_OFICIU) OFFICE_AVG_SAL
        FROM AB_ANGAJATI2
     ) X 
     INNER JOIN
       (SELECT AB_ANGAJATI2.COD_OFICIU,
               MIN(AB_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL, 
               AVG(AB_ANGAJATI2.SALARIU) OFFICE_TOP_AVG_SAL
        FROM (
              SELECT COD_OFICIU, AVG(SALARIU) AVG_SAL
              FROM AB_ANGAJATI2 GROUP BY COD_OFICIU 
             ) s
        JOIN AB_ANGAJATI2 ON s.COD_OFICIU = AB_ANGAJATI2.COD_OFICIU
        WHERE AB_ANGAJATI2.SALARIU >= s.AVG_SAL
        GROUP BY AB_ANGAJATI2.COD_OFICIU
        ) 
        Y ON X.COD_OFICIU = Y.COD_OFICIU 
        WHERE X.SALARIU > OFFICE_AVG_SAL;  
        
        
/*6: Modificati query-ul de mai sus astfel incat sa afiseze doar inregistrarile 
din oficiile care returneaza minim doua rezultate.   */    
        
        
SELECT COD_OFICIU,
       NUME,
       PRENUME,
       SALARIU,
       ROUND(OFFICE_AVG_SAL) AS OFFICE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       Rapoarte
  FROM(
SELECT X.NUME ,
       X.PRENUME ,
       X.COD_OFICIU,
       X.SALARIU,
       X.OFFICE_AVG_SAL,
       Y.SMALLEST_SALARY_ABOVE_AVG_SAL,
       Y.OFFICE_TOP_AVG_SAL,
       CASE 
              WHEN X.SALARIU > Y.OFFICE_TOP_AVG_SAL THEN '> upperAVG' 
              WHEN X.SALARIU < Y.OFFICE_TOP_AVG_SAL THEN '< upperAVG'
              ELSE '= upperAvg' END AS "RAPOARTE" ,
       COUNT(X.COD_OFICIU) 
              OVER (PARTITION BY X.COD_OFICIU ORDER BY X.COD_OFICIU) NR_ANGAJATI      
FROM (
        SELECT NUME, 
               PRENUME,
               COD_OFICIU,
               SALARIU,
               AVG(SALARIU) OVER (PARTITION BY COD_OFICIU ORDER BY COD_OFICIU) OFFICE_AVG_SAL
        FROM AB_ANGAJATI2
     ) X 
     INNER JOIN
       (SELECT AB_ANGAJATI2.COD_OFICIU,
               MIN(AB_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL, 
               AVG(AB_ANGAJATI2.SALARIU) OFFICE_TOP_AVG_SAL
        FROM (
              SELECT COD_OFICIU, 
              AVG(SALARIU) AVG_SAL
              FROM AB_ANGAJATI2 
              GROUP BY COD_OFICIU 
             ) s
        JOIN AB_ANGAJATI2 ON s.COD_OFICIU = AB_ANGAJATI2.COD_OFICIU
        WHERE AB_ANGAJATI2.SALARIU >= s.AVG_SAL
        GROUP BY AB_ANGAJATI2.COD_OFICIU
        ) 
        Y ON X.COD_OFICIU = Y.COD_OFICIU 
        WHERE X.SALARIU > OFFICE_AVG_SAL 
       ) WHERE  NR_ANGAJATI >1;          