CREATE OR REPLACE TYPE plch_tool_names_t
   IS TABLE OF VARCHAR2 (100)
/

DECLARE 
    l_names   plch_tool_names_t;
BEGIN
    l_names := plch_tool_names_t('nume1', 'nume2', 'nume3');
    
    FOR i IN l_names.FIRST..l_names.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(l_names(i));
    END LOOP;
END;
/


