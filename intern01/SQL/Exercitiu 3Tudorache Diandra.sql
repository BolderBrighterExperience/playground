
--1. Scrieti o interogare  ce ar modifica varsta tuturor angaja?ilor prin m?rirea cu un an. 

UPDATE DT_ANGAJATI SET Varsta=Varsta+1;

--2. Scrieti o interogare ce ar afisa: numele, prenumele, functia, si localitatea angajatilor ce sunt manageri intr-un oficiu in ordinea invers alfabeticã dupã nume si prenume.

SELECT DT_Angajati.Nume,
       DT_Angajati.Prenume, 
       DT_Angajati.Functia, 
       DT_Oficii.Localitate 
FROM DT_Angajati
JOIN DT_Oficii ON DT_Angajati.COD_ANGAJAT=DT_Oficii.Cod_MANAGER  
ORDER BY NUME DESC,PRENUME DESC;
                                                    

 --3. Scrieti o interogare ce ar afisa  regiunea cu cele mai putine oficii.
 
SELECT REGIUNEA,
       oficii 
FROM (SELECT REGIUNEA,
             COUNT(COD_OFICIU) AS oficii 
      FROM DT_OFICII 
      GROUP BY REGIUNEA 
      ORDER BY COUNT(cod_oficiu)) 
WHERE ROWNUM =1;
 


















