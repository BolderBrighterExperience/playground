DROP TABLE lh_angajati2;
/*1.Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela. (prin script)*/
CREATE TABLE lh_angajati2
  AS(SELECT * FROM lh_angajati);

/*2.Tabela lh_angajati2 nu are constrangeri*/

/*3.Redenumiti coloana suma_planificata in salariu.*/
ALTER TABLE lh_angajati2
RENAME COLUMN suma_planificata TO salariu;

/*4.Adaugati 3 angajati noi pentru fiecare oficiu.*/


INSERT INTO lh_angajati2 VALUES ('DE','Dobre','Elena',35,'reprezentant','SR',To_Date('24-APR-2000','DD-MON-YYYY'),2300);
INSERT INTO lh_angajati2 VALUES ('DA','Darius','Adrian',28,'contabil','SR',To_Date('20-AUG-2004','DD-MON-YYYY'),2500);
INSERT INTO lh_angajati2 VALUES ('MA','Munteanu','Andrei',25,'reprezentant','SR',To_Date('03-FEB-2010','DD-MON-YYYY'),2000);
INSERT INTO lh_angajati2 VALUES ('HL','Horia','Laur',30,'reprezentant','UN',To_Date('17-MAY-2010','DD-MON-YYYY'),2100);
INSERT INTO lh_angajati2 VALUES ('SE','Sareanu','Elena',33,'contabil','UN',To_Date('10-SEP-2008','DD-MON-YYYY'),2400);
INSERT INTO lh_angajati2 VALUES ('DL','Dumbrava','Lavinia',27,'contabil','UN',To_Date('12-JUL-2007','DD-MON-YYYY'),2200);
INSERT INTO lh_angajati2 VALUES ('AC','Anastasie','Corina',31,'contabil','ED',To_Date('10-SEP-2008','DD-MON-YYYY'),2400);
INSERT INTO lh_angajati2 VALUES ('PA','Pandra','Denisa',28,'reprezentant','ED',To_Date('15-JAN-2009','DD-MON-YYYY'),2200);
INSERT INTO lh_angajati2 VALUES ('PM','Pandrea','Mihai',29,'reprezentant','ED',To_Date('12-JAN-2009','DD-MON-YYYY'),2300);
INSERT INTO lh_angajati2 VALUES ('PA','Pandra','Denisa',28,'contabil','CH',To_Date('30-OCT-2010','DD-MON-YYYY'),2500);
INSERT INTO lh_angajati2 VALUES ('PE','Pascu','Elena',26,'reprezentant','CH',To_Date('02-DEC-2000','DD-MON-YYYY'),2600);
INSERT INTO lh_angajati2 VALUES ('OD','Oleanu','Denisa',30,'reprezentant','CH',To_Date('22-MAR-2009','DD-MON-YYYY'),3000);
INSERT INTO lh_angajati2 VALUES ('CC','Cotiga','Cristian',35,'contabil','GL',To_Date('23-JUL-2000','DD-MON-YYYY'),3500);
INSERT INTO lh_angajati2 VALUES ('NI','Negoita','Ion',29,'reprezentant','GL',To_Date('22-JAN-2009','DD-MON-YYYY'),3100);
INSERT INTO lh_angajati2 VALUES ('BG','Buzoianu','Gabriel',37,'reprezentant','GL',To_Date('09-DEC-2007','DD-MON-YYYY'),3000);
INSERT INTO lh_angajati2 VALUES ('ZM','Zmeureanu','Adriana',28,'reprezentant','BL',TO_DATE('11-OCT-2001','DD-MON-YYYY'),2800);
INSERT INTO lh_angajati2 VALUES ('CL','Caragioiu','Laura',24,'reprezentant','BL',TO_DATE('08-NOV-2009','DD-MON-YYYY'),2500);
INSERT INTO lh_angajati2 VALUES ('CM','Caramir','Marian',32,'contabil','BL',TO_DATE('15-AUG-2002','DD-MON-YYYY'),3100);
INSERT INTO lh_angajati2 VALUES ('AA','Andrei','Ana',25,'reprezentant','C',TO_DATE('29-MAY-2010','DD-MON-YYYY'),2900);
INSERT INTO lh_angajati2 VALUES ('AC','Apostol','Cristian',31,'reprezentant','C',TO_DATE('07-MAR-2011','DD-MON-YYYY'),2700);
INSERT INTO lh_angajati2 VALUES ('GS','Grigore','Sorina',29,'contabil','C',TO_DATE('20-DEC-2007','DD-MON-YYYY'),2500);
INSERT INTO lh_angajati2 VALUES ('PA','Pandra','Denisa',28,'reprezentant','OR',TO_DATE('15-JAN-2009','DD-MON-YYYY'),2200);
INSERT INTO lh_angajati2 VALUES ('RN','Rares','Nistor',23,'reprezentant','RZ',TO_DATE('21-APR-2008','DD-MON-YYYY'),2700);
INSERT INTO lh_angajati2 VALUES ('RB','Razvan','Bogdan',29,'reprezentant','RZ',TO_DATE('11-SEP-2005','DD-MON-YYYY'),2500);
INSERT INTO lh_angajati2 VALUES ('RC','Rares','Corina',23,'contabil','RZ',TO_DATE('01-JUL-2006','DD-MON-YYYY'),4000);
INSERT INTO lh_angajati2 VALUES ('OA','Ones','Alexandra',26,'reprezentant','OR',TO_DATE('09-FEB-2008','DD-MON-YYYY'),3000);
INSERT INTO lh_angajati2 VALUES ('PG','Pandru','Gabriel',33,'contabil','OR',TO_DATE('14-JUN-2010','DD-MON-YYYY'),3500);

COMMIT;




/*5.a.Pentru fiecare inregistrare, va trebui sa afisati numele si prenumele angajatului, 
codul oficiului in care lucreaza si salariul acestuia.*/
SELECT nume, 
       prenume, 
       cod_oficiu, 
       salariu 
FROM lh_angajati2
where cod_oficiu='OR';
/*5.b.Adaugati o coloana in care sa afisati, pentru fiecare inregistrare, media salariala a oficiului in care lucreaza.*/


SELECT bb.nume, 
       bb.prenume,
       bb.salariu,
       bb.cod_oficiu,
       OFFICE_AVG_SAL
FROM lh_angajati2 bb
JOIN (SELECT t.cod_oficiu,
             ROUND(AVG(t.salariu),2) 
             OFFICE_AVG_SAL 
      FROM lh_angajati2 t  
      GROUP BY t.cod_oficiu) aa
ON(aa.cod_oficiu=bb.cod_oficiu);
	   
    
/*Adaugati o coloana cu cel mai mic salariu din oficiu care este mai mare 
decat media salariala a oficiului. [Vom numi aceasta coloana SMALLEST_SALARY_ABOVE_AVG_SAL]*/

SELECT bb.nume, 
       bb.prenume,
       bb.salariu, 
       bb.cod_oficiu, 
       OFFICE_AVG_SAL, 
       SMALLEST_SALARY_ABOVE_AVG_SAL
FROM lh_angajati2 bb
JOIN (SELECT t.cod_oficiu, 
             ROUND(AVG(t.salariu),2) OFFICE_AVG_SAL 
      FROM lh_angajati2 t  
      GROUP BY t.cod_oficiu) aa
ON(aa.cod_oficiu=bb.cod_oficiu)
JOIN ( SELECT cod_oficiu, Min(cc.salariu) AS SMALLEST_SALARY_ABOVE_AVG_SAL
        FROM   lh_angajati2 cc
        WHERE  cc.salariu > (SELECT AVG(b.salariu)
                                FROM   lh_angajati2 b
                                GROUP  BY b.cod_oficiu
                                HAVING  b.cod_oficiu = cc.cod_oficiu)
                                GROUP BY cod_oficiu) cc
ON(cc.cod_oficiu=aa.cod_oficiu)
ORDER BY bb.COD_OFICIU;



/*media salariala a tuturor salariilor peste media salariala a oficiului. [Vom numi aceasta coloana OFFICE_TOP_AVG_SAL]*/


SELECT bb.nume, 
       bb.prenume,
       bb.salariu, 
       bb.cod_oficiu, 
       OFFICE_AVG_SAL, 
       SMALLEST_SALARY_ABOVE_AVG_SAL
FROM lh_angajati2 bb
JOIN (SELECT t.cod_oficiu, 
             ROUND(AVG(t.salariu),2) OFFICE_AVG_SAL 
      FROM lh_angajati2 t  
      GROUP BY t.cod_oficiu) aa
ON(aa.cod_oficiu=bb.cod_oficiu)
JOIN ( SELECT cod_oficiu, Min(cc.salariu) AS SMALLEST_SALARY_ABOVE_AVG_SAL
        FROM   lh_angajati2 cc
        WHERE  cc.salariu > (SELECT AVG(b.salariu)
                                FROM   lh_angajati2 b
                                GROUP  BY b.cod_oficiu
                                HAVING  b.cod_oficiu = cc.cod_oficiu) 
                                GROUP BY cod_oficiu) cc
ON(cc.cod_oficiu=aa.cod_oficiu)
JOIN ( SELECT cod_oficiu, 
              AVG(cc.salariu) AS OFFICE_TOP_AVG_SAL
       FROM   lh_angajati2 cc
       WHERE  cc.salariu > (SELECT AVG(b.salariu)
                            FROM   lh_angajati2 b
                            GROUP  BY b.cod_oficiu
                            HAVING  b.cod_oficiu = cc.cod_oficiu) 
                            GROUP BY cod_oficiu) dd
ON(dd.cod_oficiu=cc.cod_oficiu)
ORDER BY cod_oficiu;

/*Adaugati o coloana numita raportare in care sa afisati:
i. 'over TOP_AVG', daca salariul respectivului este mai mare decat OFFICE_TOP_AVG_SAL
ii. 'under TOP_AVG', daca salariul respectivului este mai mic decat OFFICE_TOP_AVG_SAL*/

SELECT bb.nume, 
       bb.prenume,
       bb.salariu,
       bb.cod_oficiu, 
       OFFICE_AVG_SAL, 
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
CASE 
    WHEN salariu > OFFICE_TOP_AVG_SAL THEN '> TOP_AVG'
    WHEN salariu = OFFICE_TOP_AVG_SAL THEN ' =TOP_AVG'
    WHEN salariu < OFFICE_TOP_AVG_SAL THEN '< TOP_AVG'
END RAPORTARE
FROM lh_angajati2 bb
JOIN (SELECT t.cod_oficiu, 
             ROUND(Avg(t.salariu),2) OFFICE_AVG_SAL 
      FROM lh_angajati2 t  
      GROUP BY t.cod_oficiu) aa
ON(aa.cod_oficiu=bb.cod_oficiu)
JOIN ( SELECT cod_oficiu, Min(cc.salariu) AS SMALLEST_SALARY_ABOVE_AVG_SAL
        FROM   lh_angajati2 cc
        WHERE  cc.salariu > (SELECT AVG(b.salariu)
                                FROM   lh_angajati2 b
                                GROUP  BY b.cod_oficiu
                                HAVING  b.cod_oficiu = cc.cod_oficiu) 
                                GROUP BY cod_oficiu) cc
ON(cc.cod_oficiu=aa.cod_oficiu)
JOIN ( SELECT cod_oficiu, 
              AVG(cc.salariu) AS OFFICE_TOP_AVG_SAL
       FROM   lh_angajati2 cc
       WHERE  cc.salariu > (SELECT AVG(b.salariu)
                            FROM   lh_angajati2 b
                            GROUP  BY b.cod_oficiu
                            HAVING  b.cod_oficiu = cc.cod_oficiu) 
                            GROUP BY cod_oficiu) dd
ON(dd.cod_oficiu=cc.cod_oficiu)
WHERE salariu>OFFICE_AVG_SAL
ORDER BY cod_oficiu;


/*6 Modificati query-ul de mai sus astfel incat sa afiseze doar inregistrarile din oficiile care returneaza minim doua rezultate*/

SELECT bb.nume, 
       bb.prenume,
       bb.salariu,
       bb.cod_oficiu, 
       OFFICE_AVG_SAL, 
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
CASE 
    WHEN salariu > OFFICE_TOP_AVG_SAL THEN '> TOP_AVG'
    WHEN salariu = OFFICE_TOP_AVG_SAL THEN ' =TOP_AVG'
    WHEN salariu < OFFICE_TOP_AVG_SAL THEN '< TOP_AVG'
END RAPORTARE
FROM lh_angajati2 bb
JOIN (SELECT t.cod_oficiu, 
             ROUND(Avg(t.salariu),2) OFFICE_AVG_SAL 
      FROM lh_angajati2 t  
      GROUP BY t.cod_oficiu) aa
ON(aa.cod_oficiu=bb.cod_oficiu)
JOIN ( SELECT cod_oficiu, Min(cc.salariu) AS SMALLEST_SALARY_ABOVE_AVG_SAL
        FROM   lh_angajati2 cc
        WHERE  cc.salariu > (SELECT AVG(b.salariu)
                                FROM   lh_angajati2 b
                                GROUP  BY b.cod_oficiu
                                HAVING  b.cod_oficiu = cc.cod_oficiu) 
                                GROUP BY cod_oficiu) cc
ON(cc.cod_oficiu=aa.cod_oficiu)
JOIN ( SELECT cod_oficiu, 
              AVG(cc.salariu) AS OFFICE_TOP_AVG_SAL
       FROM   lh_angajati2 cc
       WHERE  cc.salariu > (SELECT AVG(b.salariu)
                            FROM   lh_angajati2 b
                            GROUP  BY b.cod_oficiu
                            HAVING  b.cod_oficiu = cc.cod_oficiu) 
                            GROUP BY cod_oficiu) dd
ON(dd.cod_oficiu=cc.cod_oficiu)
WHERE salariu>OFFICE_AVG_SAL
AND (SELECT Count(*) 
     FROM lh_angajati2 z 
     WHERE salariu>OFFICE_AVG_SAL 
     GROUP BY cod_oficiu  
     HAVING z.cod_oficiu=bb.cod_oficiu)>2
ORDER BY cod_oficiu;
    


    
