DROP TABLE ap_angajati2;
--Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela. (prin script)
CREATE TABLE ap_angajati2 
    AS (SELECT * FROM ap_angajati);

--Exista vreo diferenta intre cele doua tabele? Daca da, care?
--Da, cea de a2a tabela nu contine constrangeri

--Redenumiti coloana suma_planificata in salariu. 
ALTER TABLE ap_angajati2
    RENAME COLUMN suma_planificata
    TO salariu;
    
--Adaugati 3 angajati noi pentru fiecare oficiu
INSERT INTO AP_ANGAJATI2 VALUES('AM','Avram','Maria',24,'manager','BL',TO_DATE('12.01.2000','dd.MM.yyyy'),4000);
INSERT INTO AP_ANGAJATI2 VALUES('PC','Popescu','Cristina',30,'contabil','BL',TO_DATE('20.01.2007','dd.MM.yyyy'),3200);
INSERT INTO AP_ANGAJATI2 VALUES('PS','Popa','Bogdan',24,'manager','BL',TO_DATE('07.02.2010','dd.MM.yyyy'),2300);
INSERT INTO AP_ANGAJATI2 VALUES('AC','Alexandru','Cristian',32,'sef','C',TO_DATE('28.04.2010','dd.MM.yyyy'),6000);
INSERT INTO AP_ANGAJATI2 VALUES('HA','Horeja','Ana',22,'reprezentat','C',TO_DATE('20.06.2008','dd.MM.yyyy'),2800);
INSERT INTO AP_ANGAJATI2 VALUES('MG','Mihai','George',34,'manager','C',TO_DATE('18.04.2012','dd.MM.yyyy'),3800);
INSERT INTO AP_ANGAJATI2 VALUES('ME','Militaru','Eugen',29,'reprezentant','CH',TO_DATE('25.10.2000','dd.MM.yyyy'),5000);
INSERT INTO AP_ANGAJATI2 VALUES('PE','Popa','Eugen',38,'mananger','CH',TO_DATE('28.09.2006','dd.MM.yyyy'),2000);
INSERT INTO AP_ANGAJATI2 VALUES('RA','Radulescu','Alina',45,'manager','CH',TO_DATE('17.02.2003','dd.MM.yyyy'),7600);
INSERT INTO AP_ANGAJATI2 VALUES('IA','Ivan','Alex',42,'contabil','ED',TO_DATE('08.01.2014','dd.MM.yyyy'),4000);
INSERT INTO AP_ANGAJATI2 VALUES('VF','Vija','Florin',31,'reprezentant','ED',TO_DATE('20.09.2014','dd.MM.yyyy'),3200);
INSERT INTO AP_ANGAJATI2 VALUES('EM','Enescu','Mihaela',25,'reprezentant','ED',TO_DATE('15.02.2016','dd.MM.yyyy'),3250);
INSERT INTO AP_ANGAJATI2 VALUES('BA','Buiac','Andrei',40,'reprezentant','GL',TO_DATE('01.04.2007','dd.MM.yyyy'),1800);
INSERT INTO AP_ANGAJATI2 VALUES('GL','Glodeanu','Liviu',41,'contabil','GL',TO_DATE('22.08.2008','dd.MM.yyyy'),2500);
INSERT INTO AP_ANGAJATI2 VALUES('SG','Sacasanu','George',42,'reprezentant','GL',TO_DATE('09.06.2009','dd.MM.yyyy'),3500);
INSERT INTO AP_ANGAJATI2 VALUES('GA','Gherca','Ana',26,'manager','OR',TO_DATE('10.08.2012','dd.MM.yyyy'),2900);
INSERT INTO AP_ANGAJATI2 VALUES('SC','Stancu','Catalina',38,'reprezentant','OR',TO_DATE('30.04.2009','dd.MM.yyyy'),3250);
INSERT INTO AP_ANGAJATI2 VALUES('TD','Tudorache','Diana',32,'reprezentant','OR',TO_DATE('19.05.2017','dd.MM.yyyy'),4000);
INSERT INTO AP_ANGAJATI2 VALUES('DR','Datcu','Roxana',24,'manager','RZ',TO_DATE('10.08.2012','dd.MM.yyyy'),5600);
INSERT INTO AP_ANGAJATI2 VALUES('FF','Frincu','Filip',28,'manager','RZ',TO_DATE('30.04.2009','dd.MM.yyyy'),2200);
INSERT INTO AP_ANGAJATI2 VALUES('FV','Frujina','Vlad',45,'contabil','RZ',TO_DATE('19.05.2017','dd.MM.yyyy'),3000);
INSERT INTO AP_ANGAJATI2 VALUES('IM','Ion','Maria',42,'contabil','SR',TO_DATE('11.09.2013','dd.MM.yyyy'),2000);
INSERT INTO AP_ANGAJATI2 VALUES('VM','Vasioiu','Mihaela',32,'reprezentant','SR',TO_DATE('31.01.2008','dd.MM.yyyy'),3800);
INSERT INTO AP_ANGAJATI2 VALUES('CM','Coman','Mihai',46,'contabil','SR',TO_DATE('19.05.2018','dd.MM.yyyy'),4250);
INSERT INTO AP_ANGAJATI2 VALUES('MS','Mihaiu','Sorin',31,'reprezentant','UN',TO_DATE('12.08.2012','dd.MM.yyyy'),4500);
INSERT INTO AP_ANGAJATI2 VALUES('MA','Matei','Alexandru',36,'reprezentant','UN',TO_DATE('30.04.2009','dd.MM.yyyy'),2400);
INSERT INTO AP_ANGAJATI2 VALUES('ZA','Zamfiroiu','Alin',40,'reprezentant','UN',TO_DATE('20.02.2017','dd.MM.yyyy'),3900);

COMMIT;

-- Realizati un query in care sa afisati toti angajatii care au salariul mai mare decat media oficiului in care lucreaza.
--a.Pentru fiecare inregistrare, va trebui sa afisati numele si prenumele angajatului, codul oficiului in care lucreaza si salariul acestuia.
SELECT nume,
       prenume,  
       cod_oficiu,
       salariu
FROM ap_angajati2;
--b. Adaugati o coloana in care sa afisati, pentru fiecare inregistrare, media salariala a oficiului in care lucreaza. [Vom numi aceasta coloana OFFICE_AVG_SAL]
SELECT nume,
       prenume,  
       t1.cod_oficiu,
       salariu,
       OFFICE_AVG_SAL
FROM ap_angajati2 t1
JOIN (SELECT cod_oficiu,ROUND(AVG(salariu)) OFFICE_AVG_SAL
      FROM ap_angajati2
      GROUP BY cod_oficiu) t2
ON(t1.cod_oficiu=t2.cod_oficiu);

--c.Adaugati doua coloane in care sa afisati, pentru fiecare inregistrare:  
--i. cel mai mic salariu din oficiu care este mai mare decat media salariala a oficiului.[Vom numi aceasta coloana SMALLEST_SALARY_ABOVE_AVG_SAL] 
--ii. media salariala a tuturor salariilor peste media salariala a oficiului. [Vom numi aceasta coloana OFFICE_TOP_AVG_SAL]
SELECT nume,
       prenume,  
       t1.cod_oficiu,
       salariu,
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
CASE 
WHEN salariu > OFFICE_TOP_AVG_SAL THEN 'OVER TOP_AVG'
WHEN salariu = OFFICE_TOP_AVG_SAL THEN '=TOP_AVG'
WHEN salariu < OFFICE_TOP_AVG_SAL THEN 'UNDER TOP_AVG'
END RAPORTARE
FROM ap_angajati2 t1
JOIN (SELECT cod_oficiu,ROUND(AVG(salariu)) OFFICE_AVG_SAL
      FROM ap_angajati2
      GROUP BY cod_oficiu) t2
ON(t1.cod_oficiu=t2.cod_oficiu)
JOIN(SELECT cod_oficiu, MIN(salariu)  SMALLEST_SALARY_ABOVE_AVG_SAL
     FROM ap_angajati2 a
     WHERE salariu > (SELECT AVG(salariu) FROM ap_angajati2 b GROUP BY cod_oficiu HAVING a.cod_oficiu=b.cod_oficiu)
     GROUP BY cod_oficiu) t3
ON(t2.cod_oficiu=t3.cod_oficiu)
JOIN(SELECT cod_oficiu, ROUND(AVG(salariu)) OFFICE_TOP_AVG_SAL
     FROM ap_angajati2 c
     WHERE salariu > (SELECT AVG(salariu) FROM ap_angajati2 d GROUP BY cod_oficiu HAVING c.cod_oficiu=d.cod_oficiu) 
     GROUP BY cod_oficiu) t4
ON(t3.cod_oficiu=t4.cod_oficiu);

--Modificati query-ul de mai sus astfel incat sa afiseze doar inregistrarile din oficiile care returneaza minim doua rezultate. 
SELECT nume,
       prenume,  
       t1.cod_oficiu,
       salariu,
       OFFICE_AVG_SAL,
       SMALLEST_SALARY_ABOVE_AVG_SAL,
       OFFICE_TOP_AVG_SAL,
CASE 
WHEN salariu > OFFICE_TOP_AVG_SAL THEN 'OVER TOP_AVG'
WHEN salariu = OFFICE_TOP_AVG_SAL THEN '=TOP_AVG'
WHEN salariu < OFFICE_TOP_AVG_SAL THEN 'UNDER TOP_AVG'
END RAPORTARE
FROM ap_angajati2 t1
JOIN (SELECT cod_oficiu, ROUND(AVG(salariu)) OFFICE_AVG_SAL
      FROM ap_angajati2
      GROUP BY cod_oficiu) t2
ON(t1.cod_oficiu=t2.cod_oficiu)
JOIN(SELECT cod_oficiu,  MIN(salariu) SMALLEST_SALARY_ABOVE_AVG_SAL
     FROM ap_angajati2 a
     WHERE salariu > (SELECT AVG(salariu) 
                      FROM ap_angajati2 b 
                      GROUP BY cod_oficiu 
                      HAVING a.cod_oficiu=b.cod_oficiu)
     GROUP BY cod_oficiu)t3
ON(t1.cod_oficiu=t3.cod_oficiu)
JOIN(SELECT cod_oficiu, 
     ROUND(AVG(salariu)) OFFICE_TOP_AVG_SAL
     FROM ap_angajati2 c
     WHERE salariu > (SELECT AVG(salariu) 
                      FROM ap_angajati2 d 
                      GROUP BY cod_oficiu
                      HAVING c.cod_oficiu=d.cod_oficiu) 
     GROUP BY cod_oficiu) t4
ON(t1.cod_oficiu=t4.cod_oficiu)
WHERE   salariu > OFFICE_AVG_SAL AND (SELECT COUNT(cod_angajat) 
                                      FROM ap_angajati2 e
                                      WHERE salariu > OFFICE_AVG_SAL 
                                      GROUP BY cod_oficiu 
                                      HAVING e.cod_oficiu=t1.cod_oficiu)>=2
ORDER BY cod_oficiu;


      
  
   
   
    