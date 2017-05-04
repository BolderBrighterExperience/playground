

-- 1. Afiseaza numarul de angajati (din tabela employees)grupat pe departamente si job id care satisface cel putin una din urmatoarele criterii:
--> departamentul are doi sau mai multi angajati
--> salariile angajatilor din departament sunt mai mici de 500


SELECT job_id,
department_id,
COUNT(employee_id) 
FROM employees 
GROUP BY job_id,department_id,salary
HAVING (COUNT(employee_id) > = 2 OR salary < 500) 
ORDER BY department_id, job_id;


-- Afiseaza numele angajatului, functia, suma_planificata si suma_propusa . 
--Suma propusa se obtine marind suma_planificata cu 10% pentru contabili, 15% pentru manageri, 20% pentru sefi.


SELECT nume,prenume,functia, suma_planificata, CASE functia
WHEN 'contabil' then suma_planificata*1.1
WHEN 'manager' then  suma_planificata*1.15
WHEN 'sef'  then suma_planificata*1.2
ELSE suma_planificata
END AS "suma_propusa"
FROM dt_angajati;


