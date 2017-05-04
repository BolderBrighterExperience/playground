--write a pl/sql block to print information about a given employee
SET SERVEROUTPUT ON
DEFINE
    p_empid = 7
DECLARE
    emp_record gam_employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp_record
    FROM gam_employees
    WHERE id_emp = &p_empid;
    
    DBMS_OUTPUT.PUT_LINE('Id: '||emp_record.id_emp ||
                         ' Nume: ' || emp_record.nume ||
                         ' Prenume: ' || emp_record.prenume ||
                         ' Data nasterii: '||emp_record.data_nasterii ||
                         ' Data angajare: '||emp_record.data_angajare||
                         ' Gen: '||emp_record.gen||
                         ' Salariu: '||emp_record.salariul||
                         ' Id dep: '||emp_record.id_dept);
END;