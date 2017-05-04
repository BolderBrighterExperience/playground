
/*Afiseaza un raport cu privire la media salariului pentru persoanele angajate in anul 2003*/
SELECT AVG(SALARIU)
FROM LH_EMPLOYEES
WHERE EXTRACT(YEAR FROM DATA_ANGAJARII)=2003;

/* Creeaza un query in care sa afisezi numele intreg ("Prenume Nume") ale persoanelor care s-au angajat intr-o 
zi de weekend (sambata sau duminica).Ordoneaza query-ul dupa data angajarii, incepand cu cel mai recent angajat.*/


SELECT NUME||' '||PRENUME
FROM LH_EMPLOYEES 
WHERE to_char(DATA_ANGAJARII, 'FMDay') IN ('Sunday','Saturday')
ORDER BY DATA_ANGAJARII DESC;













