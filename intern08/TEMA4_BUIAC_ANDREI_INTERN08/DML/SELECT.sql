
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
              SELECT COD_OFICIU, AVG(SALARIU) AVG_SAL
              FROM AB_ANGAJATI2 GROUP BY COD_OFICIU 
             ) s
        JOIN AB_ANGAJATI2 ON s.COD_OFICIU = AB_ANGAJATI2.COD_OFICIU
        WHERE AB_ANGAJATI2.SALARIU >= s.AVG_SAL
        GROUP BY AB_ANGAJATI2.COD_OFICIU
        ) 
        Y ON X.COD_OFICIU = Y.COD_OFICIU 
        WHERE X.SALARIU > OFFICE_AVG_SAL 
       ) WHERE  NR_ANGAJATI >1;          