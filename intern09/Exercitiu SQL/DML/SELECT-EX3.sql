SELECT cod_oficiu,
       COUNT(cod_angajat)
FROM angajati
GROUP BY cod_oficiu;

      
SELECT * FROM (
SELECT NUME,PRENUME,data_angajarii,
ROW_NUMBER() OVER (PARTITION BY cod_oficiu ORDER BY data_angajarii ASC) as Secventa
FROM angajati);









    
