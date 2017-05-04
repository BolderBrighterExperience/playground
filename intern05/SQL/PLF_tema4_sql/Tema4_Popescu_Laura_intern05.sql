drop table PLF_ANGAJATI2 CASCADE CONSTRAINTS;

--1. Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela.
CREATE TABLE PLF_ANGAJATI2 AS ( SELECT * FROM PLF_ANGAJATI);

--2. Exista vreo diferenta intre cele doua tabele? Daca da, care?
--Diferenta este doar de constrangere, trebuie adaugata iar.

ALTER TABLE PLF_ANGAJATI2 ADD CONSTRAINT fk_cod_oficiu2 FOREIGN KEY (cod_oficiu) REFERENCES PLF_OFICII(cod_oficiu);

--3. Redenumiti coloana suma_planificata in salariu.
ALTER TABLE PLF_ANGAJATI2
  RENAME COLUMN suma_planificata TO salariu;

--4. Adaugati 3 angajati noi pentru fiecare oficiu.
INSERT INTO PLF_ANGAJATI2 VALUES('AB','Albu','Bogdan',35,'reprezentant','BL',TO_DATE('14.04.2000','DD.MM.YYYY'),3200);
INSERT INTO PLF_ANGAJATI2 VALUES('DM','Dinca','Marian',46,'manager','BL',TO_DATE('10.10.1990','DD.MM.YYYY'),5000);
INSERT INTO PLF_ANGAJATI2 VALUES('DL','Dixie','Veronica',30,'contabil','BL',TO_DATE('21.09.2000','DD.MM.YYYY'),1500);

INSERT INTO PLF_ANGAJATI2 VALUES('FP','Florea','Paul',36,'sef','C',TO_DATE('11.10.1994','DD.MM.YYYY'),3000);
INSERT INTO PLF_ANGAJATI2 VALUES('FM','Florescu','Madalin',24,'contabil','C',TO_DATE('28.06.2000','DD.MM.YYYY'),1000);
INSERT INTO PLF_ANGAJATI2 VALUES('EL','Enache','Laura',29,'manager','C',TO_DATE('15.09.2000','DD.MM.YYYY'),2300);

INSERT INTO PLF_ANGAJATI2 VALUES('GT','Grosu','Tudor',22,'reprezentant','CH',TO_DATE('12.02.2004','DD.MM.YYYY'),500);
INSERT INTO PLF_ANGAJATI2 VALUES('HI','Hurea','Irina',33,'reprezentant','CH',TO_DATE('31.08.1997','DD.MM.YYYY'),2100);
INSERT INTO PLF_ANGAJATI2 VALUES('IN','Irimia','Nicoleta',24,'reprezentant','CH',TO_DATE('22.03.2005','DD.MM.YYYY'),600);

INSERT INTO PLF_ANGAJATI2 VALUES('IV','Iftimi','Viorel',30,'manager','ED',TO_DATE('20.05.2001','DD.MM.YYYY'),2700);
INSERT INTO PLF_ANGAJATI2 VALUES('IZ','Ivan','Zaraza',24,'sef','ED',TO_DATE('22.08.1992','DD.MM.YYYY'),4500);
INSERT INTO PLF_ANGAJATI2 VALUES('JS','Jirnea','Sorin',34,'manager','ED',TO_DATE('27.01.2000','DD.MM.YYYY'),1900);

INSERT INTO PLF_ANGAJATI2 VALUES('JV','Jurnea','Vladimir',27,'reprezentant','GL',TO_DATE('13.07.2000','DD.MM.YYYY'),450);
INSERT INTO PLF_ANGAJATI2 VALUES('KA','Klaus','Aurica',32,'reprezentant','GL',TO_DATE('20.11.1996','DD.MM.YYYY'),790);
INSERT INTO PLF_ANGAJATI2 VALUES('KL','Klaus','Liviu',26,'reprezentant','GL',TO_DATE('28.01.2007','DD.MM.YYYY'),850);

INSERT INTO PLF_ANGAJATI2 VALUES('LB','Lan','Bianca',30,'reprezentant','OR',TO_DATE('22.09.1993','DD.MM.YYYY'),1900);
INSERT INTO PLF_ANGAJATI2 VALUES('LC','Lame','Corina',27,'manager','OR',TO_DATE('19.09.1992','DD.MM.YYYY'),2300);
INSERT INTO PLF_ANGAJATI2 VALUES('LI','Liman','Ionel',44,'sef','OR',TO_DATE('05.04.1989','DD.MM.YYYY'),4700);

INSERT INTO PLF_ANGAJATI2 VALUES('LM','Liliac','Manuela',37,'manager','RZ',TO_DATE('13.12.2000','DD.MM.YYYY'),2100);
INSERT INTO PLF_ANGAJATI2 VALUES('LN','Lizeanu','Nicoleta',31,'reprezentant','RZ',TO_DATE('17.02.2007','DD.MM.YYYY'),900);
INSERT INTO PLF_ANGAJATI2 VALUES('LO','Lombar','Oana',23,'reprezentant','RZ',TO_DATE('18.03.2008','DD.MM.YYYY'),300);

INSERT INTO PLF_ANGAJATI2 VALUES('LP','Lozean','Paul',22,'reprezentant','SR',TO_DATE('12.11.2010','DD.MM.YYYY'),350);
INSERT INTO PLF_ANGAJATI2 VALUES('LV','Lunca','Virgil',39,'contabil','SR',TO_DATE('10.07.2001','DD.MM.YYYY'),1800);
INSERT INTO PLF_ANGAJATI2 VALUES('MA','Marmura','Ariana',25,'contabil','SR',TO_DATE('09.10.2002','DD.MM.YYYY'),670);

INSERT INTO PLF_ANGAJATI2 VALUES('MB','Maxim','Bogdan',26,'reprezentant','UN',TO_DATE('01.12.1999','DD.MM.YYYY'),2200);
INSERT INTO PLF_ANGAJATI2 VALUES('MN','Merdenea','Nae',35,'manager','UN',TO_DATE('26.06.2000','DD.MM.YYYY'),680);
INSERT INTO PLF_ANGAJATI2 VALUES('NT','Nefertiti','Tatiana',29,'contabil','UN',TO_DATE('17.02.2002','DD.MM.YYYY'),4320);

COMMIT;


--5. Realizati un query in care sa afisati toti angajatii care au salariul mai mare decat media oficiului in care lucreaza. 
--a. Pentru fiecare inregistrare, va trebui sa afisati numele si prenumele angajatului, 
--codul oficiului in care lucreaza si salariul acestuia
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU
FROM   PLF_ANGAJATI2
ORDER BY COD_OFICIU;

--b. Adaugati o coloana in care sa afisati, pentru fiecare inregistrare, media salariala a oficiului in care lucreaza. 
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU, 
       OFFICE_AVG_SAL
FROM   PLF_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                            FROM  PLF_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)            
                     USING (COD_OFICIU)
WHERE SALARIU > OFFICE_AVG_SAL;
 
--c. Adaugati doua coloane in care sa afisati, pentru fiecare inregistrare:  
--i. cel mai mic salariu din oficiu care este mai mare decat media salariala a oficiului.  
--[Vom numi aceasta coloana SMALLEST_SALARY_ABOVE_AVG_SAL] 
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU, 
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL
FROM   PLF_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
                            FROM  PLF_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)
                     USING (COD_OFICIU)
                     JOIN (SELECT PLF_ANGAJATI2.COD_OFICIU, 
                                  MIN(PLF_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL
                           FROM ( SELECT COD_OFICIU, 
                                  ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                                  FROM PLF_ANGAJATI2 
                                  GROUP BY COD_OFICIU ) x 
                          JOIN PLF_ANGAJATI2 ON x.COD_OFICIU = PLF_ANGAJATI2.COD_OFICIU
                          WHERE PLF_ANGAJATI2.SALARIU >= x.OFFICE_AVG_SAL
                          GROUP BY PLF_ANGAJATI2.COD_OFICIU)
                     USING (COD_OFICIU)
ORDER BY COD_OFICIU;
--ii. media salariala a tuturor salariilor peste media salariala a oficiului. 
--[Vom numi aceasta coloana OFFICE_TOP_AVG_SAL] 
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU, 
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL
FROM   PLF_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
                            FROM  PLF_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)
                     USING (COD_OFICIU)
                     JOIN (SELECT PLF_ANGAJATI2.COD_OFICIU, 
                                  MIN(PLF_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL,
                                  ROUND(AVG(PLF_ANGAJATI2.SALARIU)) OFFICE_TOP_AVG_SAL
                           FROM ( SELECT COD_OFICIU, 
                                         ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                                  FROM PLF_ANGAJATI2 
                                  GROUP BY COD_OFICIU ) y 
                          JOIN PLF_ANGAJATI2 ON y.COD_OFICIU = PLF_ANGAJATI2.COD_OFICIU
                          WHERE PLF_ANGAJATI2.SALARIU >= y.OFFICE_AVG_SAL
                          GROUP BY PLF_ANGAJATI2.COD_OFICIU)
                     USING (COD_OFICIU)
ORDER BY COD_OFICIU;
--d. Adaugati o coloana numita raportare in care sa afisati: 
--i.  'over TOP_AVG', daca salariul respectivului este mai mare decat OFFICE_TOP_AVG_SAL 
--ii. 'under TOP_AVG', daca salariul respectivului este mai mic decat OFFICE_TOP_AVG_SAL 
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU, 
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
       CASE
              WHEN SALARIU > OFFICE_TOP_AVG_SAL THEN '>TOP_AVG'
              WHEN SALARIU < OFFICE_TOP_AVG_SAL THEN '<TOP_AVG'
       ELSE '=TOP_AVG'
       END RAPORTARE
FROM   PLF_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
                            FROM  PLF_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)
                     USING (COD_OFICIU)
                     JOIN (SELECT PLF_ANGAJATI2.COD_OFICIU, 
                                  MIN(PLF_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL,
                                  ROUND(AVG(PLF_ANGAJATI2.SALARIU)) OFFICE_TOP_AVG_SAL
                           FROM ( SELECT COD_OFICIU, 
                                         ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                                  FROM PLF_ANGAJATI2 
                                  GROUP BY COD_OFICIU ) z 
                     JOIN PLF_ANGAJATI2 ON z.COD_OFICIU = PLF_ANGAJATI2.COD_OFICIU
                     WHERE PLF_ANGAJATI2.SALARIU >= z.OFFICE_AVG_SAL
                     GROUP BY PLF_ANGAJATI2.COD_OFICIU)
                     USING (COD_OFICIU)
ORDER BY COD_OFICIU;

--6: Modificati query-ul de mai sus astfel incat sa afiseze doar inregistrarile din oficiile care returneaza minim doua rezultate.
 SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU, 
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
       RAPORTARE,
       NR_ANGAJATI
FROM(SELECT NUME,
            PRENUME,
            COD_OFICIU,
            SALARIU, 
            OFFICE_AVG_SAL,
            SMALLEST_SALARY_ABOVE_AVG_SAL,
            OFFICE_TOP_AVG_SAL,
			CASE
				WHEN SALARIU > OFFICE_TOP_AVG_SAL THEN ' > TOP_AVG'
				WHEN SALARIU < OFFICE_TOP_AVG_SAL THEN ' < TOP_AVG'
				ELSE ' = TOP_AVG'
			END RAPORTARE,
			COUNT(COD_OFICIU) OVER (PARTITION BY COD_OFICIU ORDER BY COD_OFICIU) NR_ANGAJATI,
      ROW_NUMBER() OVER (PARTITION BY COD_OFICIU ORDER BY SALARIU DESC) R
	FROM   	PLF_ANGAJATI2 	JOIN 	(SELECT COD_OFICIU,
                                        ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
                                 FROM  PLF_ANGAJATI2
                                 GROUP BY COD_OFICIU
                                 ORDER BY COD_OFICIU)
                          USING 	(COD_OFICIU)
							JOIN 	(SELECT PLF_ANGAJATI2.COD_OFICIU, 
                            MIN(PLF_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL,
                            ROUND(AVG(PLF_ANGAJATI2.SALARIU)) OFFICE_TOP_AVG_SAL
                     FROM 	(SELECT COD_OFICIU, 
                                    ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                             FROM PLF_ANGAJATI2 
                             GROUP BY COD_OFICIU ) m 
              JOIN PLF_ANGAJATI2 ON m.COD_OFICIU = PLF_ANGAJATI2.COD_OFICIU
              WHERE PLF_ANGAJATI2.SALARIU >= m.OFFICE_AVG_SAL
              GROUP BY PLF_ANGAJATI2.COD_OFICIU)
							USING (COD_OFICIU))
WHERE NR_ANGAJATI > 4 AND SALARIU > OFFICE_AVG_SAL AND R<3;

