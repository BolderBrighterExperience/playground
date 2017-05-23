SELECT * FROM ap_angajati
ORDER BY
          CASE WHEN  varsta < 30 THEN data_angajarii END ASC,
          CASE WHEN varsta > 30 THEN functia END ASC; 
          
CREATE VIEW view_employees
AS 
SELECT first_name, salary
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Executive')
WITH CHECK OPTION;

