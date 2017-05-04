--1. Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela. (prin script) 
DROP TABLE GAM_ANGAJATI2;
CREATE TABLE GAM_ANGAJATI2 AS
    SELECT * FROM GAM_ANGAJATI;

--2. Exista vreo diferenta intre cele doua tabele? Daca da, care? 
--In tabela GAM_ANGAJATI2 nu au fost importate si constrangerile de integritate.

--3. Redenumiti coloana suma_planificata in salariu. 
ALTER TABLE GAM_ANGAJATI2 
    RENAME COLUMN SUMA_PLANIFICATA TO SALARIU;
    
--4. Adaugati 3 angajati noi pentru fiecare oficiu. 
INSERT INTO GAM_ANGAJATI2 VALUES('BA','Banu','Laura',21,'contabil','BL',TO_DATE('18.01.2017','DD.MM.YYYY'),2000);
INSERT INTO GAM_ANGAJATI2 VALUES('BM','Bostenaru','Madalina',40,'sef','BL',TO_DATE('19.11.2006','DD.MM.YYYY'),8000);
INSERT INTO GAM_ANGAJATI2 VALUES('DL','Dobrescu','Laura',29,'manager','BL',TO_DATE('22.08.2016','DD.MM.YYYY'),3900);
INSERT INTO GAM_ANGAJATI2 VALUES('DA','Duimovici','Adrian',27,'manager','C',TO_DATE('09.05.2009','DD.MM.YYYY'),5400);
INSERT INTO GAM_ANGAJATI2 VALUES('DN','Dragan','Nicolae',21,'contabil','C',TO_DATE('18.08.2016','DD.MM.YYYY'),4150);
INSERT INTO GAM_ANGAJATI2 VALUES('FR','Florescu','Roxana',26,'contabil','C',TO_DATE('15.02.2014','DD.MM.YYYY'),1400);
INSERT INTO GAM_ANGAJATI2 VALUES('FA','Filip','Andrei',53,'manager','CH',TO_DATE('14.09.2000','DD.MM.YYYY'),8900);
INSERT INTO GAM_ANGAJATI2 VALUES('GD','Gavrila','Denisa',20,'reprezentant','CH',TO_DATE('18.11.2016','DD.MM.YYYY'),2000);
INSERT INTO GAM_ANGAJATI2 VALUES('GV','Gavrila','Valentina',21,'reprezentant','CH',TO_DATE('15.02.2017','DD.MM.YYYY'),1000);
INSERT INTO GAM_ANGAJATI2 VALUES('GR','Gheorghe','Roxana',37,'contabil','ED',TO_DATE('18.01.2012','DD.MM.YYYY'),3390);
INSERT INTO GAM_ANGAJATI2 VALUES('GA','Georgescu','Andreeea',26,'contabil','ED',TO_DATE('14.10.2015','DD.MM.YYYY'),2000);
INSERT INTO GAM_ANGAJATI2 VALUES('GF','Gheorghe','Florentina',24,'manager','ED',TO_DATE('12.01.2016','DD.MM.YYYY'),2000);
INSERT INTO GAM_ANGAJATI2 VALUES('GS','Gherasim','Stefan',27,'reprezentant','GL',TO_DATE('12.01.2017','DD.MM.YYYY'),2000);
INSERT INTO GAM_ANGAJATI2 VALUES('GO','Godea','Octavian',41,'contabil','GL',TO_DATE('15.11.2007','DD.MM.YYYY'),3980);
INSERT INTO GAM_ANGAJATI2 VALUES('ID','Ilie','Denisa',24,'reprezentant','GL',TO_DATE('18.01.2017','DD.MM.YYYY'),2000);
INSERT INTO GAM_ANGAJATI2 VALUES('LI','Lupu','Ion',23,'manager','OR',TO_DATE('18.01.2015','DD.MM.YYYY'),5500);
INSERT INTO GAM_ANGAJATI2 VALUES('LC','Lionte','Cozmin',61,'reprezentant','OR',TO_DATE('12.05.1987','DD.MM.YYYY'),5000);
INSERT INTO GAM_ANGAJATI2 VALUES('AI','Airinei','Vlad',26,'manager','OR',TO_DATE('18.12.2015','DD.MM.YYYY'),4000);
INSERT INTO GAM_ANGAJATI2 VALUES('MM','Mihut','Mihai',34,'contabil','RZ',TO_DATE('11.06.2005','DD.MM.YYYY'),3400);
INSERT INTO GAM_ANGAJATI2 VALUES('MA','Mihoc','Alina',23,'reprezentant','RZ',TO_DATE('23.05.2011','DD.MM.YYYY'),3200);
INSERT INTO GAM_ANGAJATI2 VALUES('MP','Mihoc','Petru',43,'sef','RZ',TO_DATE('05.06.2000','DD.MM.YYYY'),6780);
INSERT INTO GAM_ANGAJATI2 VALUES('NC','Nisioiu','Claudiu',31,'reprezentant','SR',TO_DATE('10.04.2016','DD.MM.YYYY'),2000);
INSERT INTO GAM_ANGAJATI2 VALUES('NA','Nacu','Anda',24,'contabil','SR',TO_DATE('08.02.2017','DD.MM.YYYY'),3100);
INSERT INTO GAM_ANGAJATI2 VALUES('PD','Petrescu','Dana',27,'contabil','SR',TO_DATE('01.07.2015','DD.MM.YYYY'),2600);
INSERT INTO GAM_ANGAJATI2 VALUES('RC','Radu','Crenguta',39,'sef','UN',TO_DATE('21.04.2009','DD.MM.YYYY'),5300);
INSERT INTO GAM_ANGAJATI2 VALUES('RV','Rusu','Viorel',21,'reprezentant','UN',TO_DATE('15.03.2013','DD.MM.YYYY'),1900);
INSERT INTO GAM_ANGAJATI2 VALUES('SP','Stalin','Petru',28,'manager','UN',TO_DATE('17.03.2015','DD.MM.YYYY'),4900);
COMMIT;

--5. Realizati un query in care sa afisati toti angajatii care au salariul mai mare decat media oficiului in care lucreaza. 
--a. Pentru fiecare inregistrare, va trebui sa afisati numele si prenumele angajatului, 
--codul oficiului in care lucreaza si salariul acestuia
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU
FROM   GAM_ANGAJATI2
ORDER BY COD_OFICIU;

--b. Adaugati o coloana in care sa afisati, pentru fiecare inregistrare, media salariala a oficiului in care lucreaza. 
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU, 
       OFFICE_AVG_SAL
FROM   GAM_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                            FROM  GAM_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)
                     USING (COD_OFICIU);
 
--c. Adaugati doua coloane in care sa afisati, pentru fiecare inregistrare:  
--i. cel mai mic salariu din oficiu care este mai mare decat media salariala a oficiului.  
--[Vom numi aceasta coloana SMALLEST_SALARY_ABOVE_AVG_SAL] 
SELECT NUME,
       PRENUME,
       COD_OFICIU,
       SALARIU, 
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL
FROM   GAM_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
                            FROM  GAM_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)
                     USING (COD_OFICIU)
                     JOIN (SELECT GAM_ANGAJATI2.COD_OFICIU, 
                                  MIN(GAM_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL
                           FROM ( SELECT COD_OFICIU, 
                                  ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                                  FROM GAM_ANGAJATI2 
                                  GROUP BY COD_OFICIU ) x 
                          JOIN GAM_ANGAJATI2 ON x.COD_OFICIU = GAM_ANGAJATI2.COD_OFICIU
                          WHERE GAM_ANGAJATI2.SALARIU >= x.OFFICE_AVG_SAL
                          GROUP BY GAM_ANGAJATI2.COD_OFICIU)
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
FROM   GAM_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
                            FROM  GAM_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)
                     USING (COD_OFICIU)
                     JOIN (SELECT GAM_ANGAJATI2.COD_OFICIU, 
                                  MIN(GAM_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL,
                                  ROUND(AVG(GAM_ANGAJATI2.SALARIU)) OFFICE_TOP_AVG_SAL
                           FROM ( SELECT COD_OFICIU, 
                                         ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                                  FROM GAM_ANGAJATI2 
                                  GROUP BY COD_OFICIU ) SM 
                          JOIN GAM_ANGAJATI2 ON SM.COD_OFICIU = GAM_ANGAJATI2.COD_OFICIU
                          WHERE GAM_ANGAJATI2.SALARIU >= SM.OFFICE_AVG_SAL
                          GROUP BY GAM_ANGAJATI2.COD_OFICIU)
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
FROM   GAM_ANGAJATI2 JOIN (SELECT COD_OFICIU,
                                  ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
                            FROM  GAM_ANGAJATI2
                            GROUP BY COD_OFICIU
                            ORDER BY COD_OFICIU)
                     USING (COD_OFICIU)
                     JOIN (SELECT GAM_ANGAJATI2.COD_OFICIU, 
                                  MIN(GAM_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL,
                                  ROUND(AVG(GAM_ANGAJATI2.SALARIU)) OFFICE_TOP_AVG_SAL
                           FROM ( SELECT COD_OFICIU, 
                                         ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
                                  FROM GAM_ANGAJATI2 
                                  GROUP BY COD_OFICIU ) SM 
                          JOIN GAM_ANGAJATI2 ON SM.COD_OFICIU = GAM_ANGAJATI2.COD_OFICIU
                          WHERE GAM_ANGAJATI2.SALARIU >= SM.OFFICE_AVG_SAL
                          GROUP BY GAM_ANGAJATI2.COD_OFICIU)
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
	FROM   	GAM_ANGAJATI2 	JOIN 	(SELECT COD_OFICIU,
										ROUND(AVG(SALARIU)) AS OFFICE_AVG_SAL
										FROM  GAM_ANGAJATI2
										GROUP BY COD_OFICIU
										ORDER BY COD_OFICIU)
							USING 	(COD_OFICIU)
							JOIN 	(SELECT GAM_ANGAJATI2.COD_OFICIU, 
											MIN(GAM_ANGAJATI2.SALARIU) SMALLEST_SALARY_ABOVE_AVG_SAL,
											ROUND(AVG(GAM_ANGAJATI2.SALARIU)) OFFICE_TOP_AVG_SAL
									FROM 	(SELECT COD_OFICIU, 
													ROUND(AVG(SALARIU)) OFFICE_AVG_SAL
											FROM GAM_ANGAJATI2 
											GROUP BY COD_OFICIU ) SMALL 
									JOIN GAM_ANGAJATI2 ON SMALL.COD_OFICIU = GAM_ANGAJATI2.COD_OFICIU
									WHERE GAM_ANGAJATI2.SALARIU >= SMALL.OFFICE_AVG_SAL
									GROUP BY GAM_ANGAJATI2.COD_OFICIU)
							USING (COD_OFICIU))
WHERE NR_ANGAJATI>5 AND SALARIU > OFFICE_AVG_SAL AND R<3;