--CASE EXPRESSIONS
SET SERVEROUTPUT ON
DEFINE p_grade = a
DECLARE
    v_grade CHAR(1) := UPPER('&p_grade');
    v_appraisal VARCHAR2(20);
BEGIN
    v_appraisal :=  
        CASE v_grade
            WHEN 'A' THEN 'Excellent'
            WHEN 'B' THEN 'Very Good'
            WHEN 'C' THEN 'Good'
            ELSE 'No such grade'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade ||' Appraisal ' || v_appraisal);
END;