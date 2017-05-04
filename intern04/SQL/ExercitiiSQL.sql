--1. Afisati toti angajatii mai tineri decat managerii lor si diferenta de varsta dintre cei doi.

SELECT  a1.nume,
        a1.prenume,
        (a2.varsta-a1.varsta) AS diferenta
FROM angajati a1
JOIN oficii o ON o.cod_oficiu = a1.cod_oficiu
JOIN angajati a2 ON o.cod_manager = a2.cod_angajat
WHERE a1.varsta < a2.varsta;

--2. Afisati „n / a“ in cazul in care campul commission_pct din tabela employees contine o valoare nula. In caz contrar, se va returna „Completed“.

SELECT  first_name,
        last_name,
        NVL2(commission_pct, 'Completed', 'n/a') 
FROM employees;