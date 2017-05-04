



--1.Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela. (prin script)
DROP table GL_ANGAJATI2;

CREATE table GL_ANGAJATI2
AS SELECT * FROM GL_ANGAJATI;


--2 Diferenta dintre cele doua tabele este ca tabelul GL_ANGAJATI2 nu include constrangerile intalnite in tabelul initial

--3 Redenumiti coloana suma_planificata in salariu.
ALTER table GL_ANGAJATI2
RENAME column SUMA_PLANIFICATA to SALARIU;

--4 Adaugati 3 angajati noi pentru fiecare oficiu

INSERT INTO GL_ANGAJATI2 VALUES ('BE', 'Bucataru', 'Emil', 30, 'contabil', 'BL', TO_DATE('18.01.2000','DD.MM.YYYY'),2500.00);
INSERT INTO GL_ANGAJATI2 VALUES ('BR', 'Bucur', 'Radu', 28, 'reprezentant', 'BL', TO_DATE('30.06.2003','DD.MM.YYYY'),2800.00);
INSERT INTO GL_ANGAJATI2 VALUES ('CE', 'Cozma', 'Eugen', 26, 'reprezentant', 'BL', TO_DATE('17.11.2002','DD.MM.YYYY'), 2000.00);
INSERT INTO GL_ANGAJATI2 VALUES ('DI', 'Dodon', 'Ioana', 34, 'contabil', 'C', TO_DATE('20.02.2001','DD.MM.YYYY'),4000.00);
INSERT INTO GL_ANGAJATI2 VALUES ('DG', 'Dutca', 'George', 35, 'reprezentant', 'C', TO_DATE('12.02.1999','DD.MM.YYYY'),3250.00);
INSERT INTO GL_ANGAJATI2 VALUES ('FR', 'Fetescu', 'Raluca', 37, 'contabil', 'C', TO_DATE('12.02.1995','DD.MM.YYYY'),4500.00);
INSERT INTO GL_ANGAJATI2 VALUES ('FG', 'Florea', 'Georgiana', 23, 'reprezentant', 'CH', TO_DATE('13.08.2000','DD.MM.YYYY'), 2500.00);
INSERT INTO GL_ANGAJATI2 VALUES('GO','Grozea','Oana',20,'reprezentant','CH',TO_DATE('04.08.2000','DD.MM.YYYY'),1900.00);
INSERT INTO GL_ANGAJATI2 VALUES('GN','Gomoja','Nicolae',32,'reprezentant','CH',TO_DATE('13.06.2005','DD.MM.YYYY'),3250.00);
INSERT INTO GL_ANGAJATI2 VALUES('GF','Grozavu','Florina',29,'reprezentant','ED',TO_DATE('28.04.2000','DD.MM.YYYY'),2500.00);
INSERT INTO GL_ANGAJATI2 VALUES('GE','Grosu','Eugen',42,'sef','ED',TO_DATE('07.02.1999','DD.MM.YYYY'),5000.00);
INSERT INTO GL_ANGAJATI2 VALUES('GA','Graur','Alexandru',35,'reprezentant','ED',TO_DATE('18.08.2004','DD.MM.YYYY'),3500.00);
INSERT INTO GL_ANGAJATI2 VALUES('HS','Harea','Sorin',25,'contabil','GL',TO_DATE('30.03.2009','DD.MM.YYYY'),2200.00);
INSERT INTO GL_ANGAJATI2 VALUES('LM','Lungu','Mihai',42,'sef adjunc','GL',TO_DATE('07.02.1999','DD.MM.YYYY'),0);
INSERT INTO GL_ANGAJATI2 VALUES('LF','Lisnic','Florin',29,'contabil','GL',TO_DATE('13.09.2002','DD.MM.YYYY'),3351.00);
INSERT INTO GL_ANGAJATI2 VALUES('MD','Mutu','Dorina',38,'reprezentant','OR',TO_DATE('09.02.1997','DD.MM.YYYY'),3000.00);
INSERT INTO GL_ANGAJATI2 VALUES('MM','Muresanu','Mihaela',34,'reprezentant','OR',TO_DATE('06.04.2003','DD.MM.YYYY'),3500.00);
INSERT INTO GL_ANGAJATI2 VALUES('NI','Nanu','Ionut',45,'reprezentant','OR',TO_DATE('09.02.1999','DD.MM.YYYY'),4500.00);
INSERT INTO GL_ANGAJATI2 VALUES('PV','Prisacaru','Valentina',27,'reprezentant','RZ',TO_DATE('18.03.2003','DD.MM.YYYY'),2750.00);
INSERT INTO GL_ANGAJATI2 VALUES('RS','Rusu','Sorina',35,'reprezentant','RZ',TO_DATE('18.09.2009','DD.MM.YYYY'),3500.00);
INSERT INTO GL_ANGAJATI2 VALUES('SO','Speriatu','Oana',31,'contabil','RZ',TO_DATE('15.01.2002','DD.MM.YYYY'),4800.00);
INSERT INTO GL_ANGAJATI2 VALUES('ME','Mutu','Eugenia',36,'reprezentant','SR',TO_DATE('09.05.1999','DD.MM.YYYY'),2500.00);
INSERT INTO GL_ANGAJATI2 VALUES('SS','Stoica','Sorina',35,'reprezentant','SR',TO_DATE('06.03.2004','DD.MM.YYYY'),3500.00);
INSERT INTO GL_ANGAJATI2 VALUES('NS','Nanu','Silviu',45,'reprezentant','SR',TO_DATE('09.08.1998','DD.MM.YYYY'),4500.00);
INSERT INTO GL_ANGAJATI2 VALUES('PO','Prisacaru','Oana',27,'reprezentant','UN',TO_DATE('18.05.2001','DD.MM.YYYY'),2750.00);
INSERT INTO GL_ANGAJATI2 VALUES('DD','Dumitrescu','Dorina',35,'reprezentant','UN',TO_DATE('18.08.2001','DD.MM.YYYY'),3500.00);
INSERT INTO GL_ANGAJATI2 VALUES('BA','Bobe','Ana',31,'contabil','UN',TO_DATE('15.01.2002','DD.MM.YYYY'),4500.00);

COMMIT;





/*5 Realizati un query in care sa afisati toti angajatii care au
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
    ii.'under TOP_AVG', daca salariul respectivului este mai mic decat OFFICE_TOP_AVG_SAL */



SELECT 	a.cod_oficiu,
				a.cod_angajat,
				a.nume,
				a.prenume,
				a.salariu,
				b.OFFICE_AVG_SAL,
				c1.SMALLEST_SALARY_ABOVE_AVG_SAL ,
				c2.OFFICE_TOP_AVG_SALARY,
				CASE
						WHEN a.salariu > c2.OFFICE_TOP_AVG_SALARY THEN '>TOP_AVG'
						WHEN a.salariu < c2.OFFICE_TOP_AVG_SALARY THEN '<TOP_AVG'
						ELSE '=TOP_AVG'
				END AS raportare,
				COUNT(a.cod_oficiu)over (PARTITION BY a.cod_oficiu ORDER BY a.cod_oficiu) AS numar_angajati
		FROM 	gl_angajati2 a
		INNER JOIN
					(SELECT cod_angajat,
							cod_oficiu,
							ROUND(AVG(salariu) over(PARTITION BY cod_oficiu )) AS OFFICE_AVG_SAL
					FROM gl_angajati2
					GROUP BY cod_oficiu,
							cod_angajat,
							salariu
					) b
				ON b.cod_angajat= a.cod_angajat
		INNER JOIN
					(SELECT cod_angajat,
							x.cod_oficiu,
							ROUND(MIN(x.salariu) over (PARTITION BY cod_oficiu)) AS SMALLEST_SALARY_ABOVE_AVG_SAL,
							x.avg_med
					FROM (SELECT cod_angajat,
								cod_oficiu,
								salariu,
								ROUND(AVG(salariu) over (PARTITION BY cod_oficiu))AS avg_med
						  FROM gl_angajati2
						  GROUP BY cod_oficiu,
									cod_angajat,
									salariu
										) x
						  WHERE x.salariu>x.avg_med
						  GROUP BY x.cod_oficiu,
								   x.cod_angajat,
								   x.avg_med,
								   salariu
										) c1
				ON a.cod_angajat=c1.cod_angajat
		INNER JOIN
					(SELECT x.cod_angajat,
							x.cod_oficiu,
							ROUND(AVG(x.salariu) over(PARTITION BY cod_oficiu)) AS OFFICE_TOP_AVG_SALARY,
							x.avg_med
					FROM (SELECT 
								cod_oficiu,
								cod_angajat,
								salariu,
								ROUND(AVG(salariu) over(PARTITION BY cod_oficiu ))AS avg_med
						FROM gl_angajati2
						GROUP BY cod_oficiu,
								 cod_angajat,
								 salariu
										) x
						WHERE x.salariu>x.avg_med
						GROUP BY x.cod_oficiu,
						x.cod_angajat,
						x.avg_med,
						salariu
										) c2
				ON c2.cod_angajat = a.cod_angajat
;



/*6: Modificati query-ul de mai sus astfel incat sa afiseze doar inregistrarile din oficiile care returneaza minim doua rezultate.*/


SELECT 	cod_oficiu,
		cod_angajat,
		nume,
		prenume,
		salariu,
		OFFICE_AVG_SAL,
		SMALLEST_SALARY_ABOVE_AVG_SAL ,
		OFFICE_TOP_AVG_SALARY,
		raportare
FROM( SELECT 	a.cod_oficiu,
				a.cod_angajat,
				a.nume,
				a.prenume,
				a.salariu,
				b.OFFICE_AVG_SAL,
				c1.SMALLEST_SALARY_ABOVE_AVG_SAL ,
				c2.OFFICE_TOP_AVG_SALARY,
				CASE
						WHEN a.salariu > c2.OFFICE_TOP_AVG_SALARY THEN '>TOP_AVG'
						WHEN a.salariu < c2.OFFICE_TOP_AVG_SALARY THEN '<TOP_AVG'
						ELSE '=TOP_AVG'
				END AS raportare,
				COUNT(a.cod_oficiu)over (PARTITION BY a.cod_oficiu ORDER BY a.cod_oficiu) AS numar_angajati
		FROM 	gl_angajati2 a
		INNER JOIN
					(SELECT cod_angajat,
							cod_oficiu,
							ROUND(AVG(salariu) over(PARTITION BY cod_oficiu )) AS OFFICE_AVG_SAL
					FROM gl_angajati2
					GROUP BY cod_oficiu,
							cod_angajat,
							salariu
					) b
				ON b.cod_angajat= a.cod_angajat
		INNER JOIN
					(SELECT cod_angajat,
							x.cod_oficiu,
							ROUND(MIN(x.salariu) over (PARTITION BY cod_oficiu)) AS SMALLEST_SALARY_ABOVE_AVG_SAL,
							x.avg_med
					FROM (SELECT cod_angajat,
								cod_oficiu,
								salariu,
								ROUND(AVG(salariu) over (PARTITION BY cod_oficiu))AS avg_med
						  FROM gl_angajati2
						  GROUP BY cod_oficiu,
									cod_angajat,
									salariu
										) x
						  WHERE x.salariu>x.avg_med
						  GROUP BY x.cod_oficiu,
								   x.cod_angajat,
								   x.avg_med,
								   salariu
										) c1
				ON a.cod_angajat=c1.cod_angajat
		INNER JOIN
					(SELECT x.cod_angajat,
							x.cod_oficiu,
							ROUND(AVG(x.salariu) over(PARTITION BY cod_oficiu)) AS OFFICE_TOP_AVG_SALARY,
							x.avg_med
					FROM (SELECT 
								cod_oficiu,
								cod_angajat,
								salariu,
								ROUND(AVG(salariu) over(PARTITION BY cod_oficiu ))AS avg_med
						FROM gl_angajati2
						GROUP BY cod_oficiu,
								 cod_angajat,
								 salariu
										) x
						WHERE x.salariu>x.avg_med
						GROUP BY x.cod_oficiu,
						x.cod_angajat,
						x.avg_med,
						salariu
										) c2
				ON c2.cod_angajat = a.cod_angajat
)
where numar_angajati>1;














