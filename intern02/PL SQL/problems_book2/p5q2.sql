--print each dep name on the screen
--incorporating an INDEX BY table
SET SERVEROUTPUT ON
DECLARE
    TYPE gam_dept_table_type is table of gam_departments.denumire_dep%TYPE
    INDEX BY BINARY_INTEGER;
    my_dept_table gam_dept_table_type;
    v_count NUMBER(2);
    v_dep_no gam_departments.id_dept%TYPE;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM gam_departments;
    FOR i IN 1..v_count
    LOOP
      IF i=1 THEN 
          v_dep_no := 1;
      ELSIF i=2 THEN 
          v_dep_no := 2;
      ELSIF i=3 THEN 
          v_dep_no := 3;
      ELSIF i=4 THEN 
          v_dep_no := 4;
      ELSE
          v_dep_no := 5;
      END IF;
    SELECT denumire_dep 
      INTO my_dept_table(i)
      FROM gam_departments
      WHERE id_dept=v_dep_no;
    END LOOP;
    
    FOR i IN 1..v_count
    LOOP
      DBMS_OUTPUT.PUT_LINE(my_dept_table(i));
    END LOOP;
END;