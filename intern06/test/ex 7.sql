
CREATE OR REPLACE TYPE plch_tool_names_t
   IS TABLE OF VARCHAR2 (100);
/

DECLARE
    col_tab  plch_tool_names_t := plch_tool_names_t();
BEGIN
    col_tab.EXTEND(3);
    col_tab(1) := 'aaaaa';
    col_tab(2) := 'bbbbb';
    col_tab(3) := 'ccccc';
    
    FOR i IN 1 .. col_tab.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(col_tab(i));
    END LOOP;
END;
/
