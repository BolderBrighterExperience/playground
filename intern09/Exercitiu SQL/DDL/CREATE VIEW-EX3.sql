DROP VIEW view_angajati;

CREATE VIEW view_angajati AS
SELECT nume,
       data_angajarii,
       cod_oficiu
FROM angajati
WHERE cod_oficiu='OR'
WITH CHECK OPTION;







    
