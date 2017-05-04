 DROP TABLE angajati2 CASCADE CONSTRAINTS;

--1.Creati o noua tabela, *_angajati2, cu aceeasi structura si aceleasi inregistrari ca si vechea tabela. (prin script)
CREATE TABLE angajati2 AS
  (SELECT *
   FROM   angajati);

--2.Exista vreo diferenta intre cele doua tabele? Daca da, care?
--Lipsesc constrangerile de pe tabel: primary key, respectiv foreign key. Acestea se pot adauga:
ALTER TABLE angajati2 
  ADD PRIMARY KEY (cod_angajat);
ALTER TABLE angajati2
  ADD CONSTRAINT fk_cod_oficii FOREIGN KEY (cod_oficiu) REFERENCES oficii(cod_oficiu);

--3.Redenumiti coloana suma_planificata in salariu.
ALTER TABLE angajati2
  RENAME COLUMN suma_planificata TO salariu;  

--4.Adaugati 3 angajati noi pentru fiecare oficiu.
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('AB', 'Adrian', 'Baciu',23,'contabil','BL','15-JAN-01',0);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('AC', 'Ana', 'Cosma',24,'manager','BL','16-FEB-02',2500);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('AD', 'Andrei', 'Dan',25,'sef','BL','17-MAR-03',250);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('BA', 'Bogdan', 'Andrei',32,'reprezentant','C','31-JAN-01',0);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('BE', 'Bianca', 'Enache',33,'sef adjunct','C','30-DEC-00',3800);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('BF', 'Bogdan', 'Florentin',34,'contabil','C','28-FEB-02',380);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('CA', 'Claudiu', 'Anubis',40,'manager','CH','17-NOV-01',0);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('CB', 'Claudette', 'Brown',41,'sef','CH','18-OCT-01',1700);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('CD', 'Cernea', 'Dinca',42,'reprezentant','CH','19-NOV-03',170);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('DF', 'Daniel', 'Fanica',50,'sef adjunct','ED','13-JUN-00',0);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('DG', 'Dan', 'Globis',51,'contabil','ED','14-JUL-01',1900);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('DI', 'Denisa', 'Ionela',52,'manager','ED','15-AUG-02',190);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('HA', 'Herteliu', 'Anca',40,'sef','GL','21-AUG-05',0);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('HB', 'Halva', 'Bogdan',30,'reprezentant','GL','20-JUL-04',2700);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('HC', 'Hornea', 'Cyelle',20,'sef adjunct','GL','19-JUN-03',270);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('IA', 'Iancu', 'Anca',31,'contabil','OR','21-AUG-05',150);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('IB', 'Ion', 'Bogdan',41,'manager','OR','21-AUG-05',0);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('ID', 'Iosefim', 'Denisa',51,'sef','OR','21-AUG-05',1500);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('RF', 'Razvan', 'Florin',25,'reprezentant','RZ','21-OCT-05',1400);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('RG', 'Radu', 'George',35,'manager','RZ','22-NOV-06',0);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('RJ', 'Ramonca', 'Junior',45,'contabil','RZ','23-DEC-07',1400);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('SJ', 'Sorina', 'Jana',35,'reprezentant','SR','21-OCT-05',1800);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('SB', 'Sorin', 'Bogdan',45,'manager','SR','11-OCT-04',1900);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('SC', 'Sonia', 'Craciun',55,'contabil','SR','01-OCT-03',1700);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('MZ', 'Marius', 'Zuzu',22,'manager','UN','22-DEC-05',2400);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('NH', 'Nae', 'Horja',23,'contabil','UN','11-JAN-02',2500);
INSERT INTO angajati2 (cod_angajat, nume, prenume, varsta, functia, cod_oficiu, data_angajarii, salariu) 
    VALUES ('ZA', 'Zaharia', 'Ana',24,'reprezentant','UN','01-OCT-01',2700);

COMMIT;

--5. Realizati un query in care sa afisati toti angajatii care au salariul mai mare decat media oficiului in care lucreaza.
--a.Pentru fiecare inregistrare, va trebui sa afisati numele si prenumele angajatului, codul oficiului in care lucreaza si salariul acestuia.
--b. Adaugati o coloana in care sa afisati, pentru fiecare inregistrare, media salariala a oficiului in care lucreaza. [Vom numi aceasta coloana OFFICE_AVG_SAL]
--c.Adaugati doua coloane in care sa afisati, pentru fiecare inregistrare:
--i. cel mai mic salariu din oficiu care este mai mare decat media salariala a oficiului. [Vom numi aceasta coloana SMALLEST_SALARY_ABOVE_AVG_SAL]
--ii. media salariala a tuturor salariilor peste media salariala a oficiului. [Vom numi aceasta coloana OFFICE_TOP_AVG_SAL]
--d. Adaugati o coloana numita raportare in care sa afisati:
--i. 'over TOP_AVG', daca salariul respectivului este mai mare decat OFFICE_TOP_AVG_SAL
--ii. 'under TOP_AVG', daca salariul respectivului este mai mic decat OFFICE_TOP_AVG_SAL

select * from angajati2 where cod_oficiu ='BL';

-- toate 
SELECT 
    a.nume,
    a.prenume,
    a.cod_oficiu,
    a.salariu,
    (SELECT Round(Avg(b.salariu),2)
     FROM   angajati2 b
     WHERE b.cod_oficiu = a.cod_oficiu
     GROUP  BY b.cod_oficiu) AS OFFICE_AVG_SAL,
    (SELECT Min(c.salariu)
     FROM   angajati2 c
     WHERE  c.salariu > (SELECT Avg(b.salariu)
                         FROM   angajati2 b
                         WHERE b.cod_oficiu = a.cod_oficiu AND b.cod_oficiu = c.cod_oficiu
                         GROUP  BY b.cod_oficiu)) AS SMALLEST_SALARY_ABOVE_AVG_SAL,   
    (SELECT Round(Avg(b.salariu),2)
     FROM   angajati2 b
     WHERE b.salariu >  (SELECT Avg(c.salariu)
                         FROM   angajati2 c
                         WHERE c.cod_oficiu = b.cod_oficiu
                         GROUP  BY c.cod_oficiu)
     AND a.cod_oficiu = b.cod_oficiU
     GROUP  BY b.cod_oficiu) AS OFFICE_TOP_AVG_SAL,
    CASE
        WHEN a.salariu > (SELECT Avg(b.salariu)
                          FROM   angajati2 b
                          WHERE b.salariu >  (SELECT Avg(c.salariu)
                                              FROM   angajati2 c
                                              WHERE c.cod_oficiu = b.cod_oficiu
                                              GROUP  BY c.cod_oficiu)
                          AND a.cod_oficiu = b.cod_oficiu
                          GROUP  BY b.cod_oficiu) THEN 'Over TOP_AVG'
        WHEN a.salariu < (SELECT Avg(b.salariu)
                          FROM   angajati2 b
                          WHERE b.salariu >  (SELECT Avg(c.salariu)
                                              FROM   angajati2 c
                                              WHERE c.cod_oficiu = b.cod_oficiu
                                              GROUP  BY c.cod_oficiu)
                          AND a.cod_oficiu = b.cod_oficiu
                          GROUP  BY b.cod_oficiu) THEN 'Under TOP_AVG'
        ELSE '= TOP_AVG'
        END AS Raportare
FROM   angajati2 a
WHERE  a.salariu > (SELECT Avg(b.salariu)
                    FROM   angajati2 b
                    WHERE a.cod_oficiu = b.cod_oficiu
                    GROUP  BY b.cod_oficiu);                   
                    
--6: Modificati query-ul de mai sus astfel incat sa afiseze doar inregistrarile din oficiile care returneaza minim doua rezultate.

SELECT 
    a.nume,
    a.prenume,
    a.cod_oficiu,
    a.salariu,
    (SELECT Round(Avg(b.salariu),2)
     FROM   angajati2 b
     WHERE b.cod_oficiu = a.cod_oficiu
     GROUP  BY b.cod_oficiu) AS OFFICE_AVG_SAL,
    (SELECT Min(c.salariu)
     FROM   angajati2 c
     WHERE  c.salariu > (SELECT Avg(b.salariu)
                         FROM   angajati2 b
                         WHERE b.cod_oficiu = a.cod_oficiu AND b.cod_oficiu = c.cod_oficiu
                         GROUP  BY b.cod_oficiu)) AS SMALLEST_SALARY_ABOVE_AVG_SAL,   
    (SELECT Round(Avg(b.salariu),2)
     FROM   angajati2 b
     WHERE b.salariu >  (SELECT Avg(c.salariu)
                         FROM   angajati2 c
                         WHERE c.cod_oficiu = b.cod_oficiu
                         GROUP  BY c.cod_oficiu)
     AND a.cod_oficiu = b.cod_oficiU
     GROUP  BY b.cod_oficiu) AS OFFICE_TOP_AVG_SAL,
    CASE
        WHEN a.salariu > (SELECT Avg(b.salariu)
                          FROM   angajati2 b
                          WHERE b.salariu >  (SELECT Avg(c.salariu)
                                              FROM   angajati2 c
                                              WHERE c.cod_oficiu = b.cod_oficiu
                                              GROUP  BY c.cod_oficiu)
                          AND a.cod_oficiu = b.cod_oficiu
                          GROUP  BY b.cod_oficiu) THEN 'Over TOP_AVG'
        WHEN a.salariu < (SELECT Avg(b.salariu)
                          FROM   angajati2 b
                          WHERE b.salariu >  (SELECT Avg(c.salariu)
                                              FROM   angajati2 c
                                              WHERE c.cod_oficiu = b.cod_oficiu
                                              GROUP  BY c.cod_oficiu)
                          AND a.cod_oficiu = b.cod_oficiu
                          GROUP  BY b.cod_oficiu) THEN 'Under TOP_AVG'
        ELSE '= TOP_AVG'
        END AS Raportare
FROM   angajati2 a
WHERE  a.salariu > (SELECT Avg(b.salariu)
                    FROM   angajati2 b
                    WHERE a.cod_oficiu = b.cod_oficiu
                    GROUP  BY b.cod_oficiu)   
AND (SELECT COUNT(*) 
     FROM angajati2 d 
     WHERE salariu > (SELECT Avg(b.salariu)
                      FROM   angajati2 b
                      WHERE d.cod_oficiu = b.cod_oficiu
                      GROUP  BY b.cod_oficiu)
    AND d.cod_oficiu=a.cod_oficiu
    GROUP BY cod_oficiu) > 1;
                    