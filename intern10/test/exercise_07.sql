CREATE OR REPLACE TYPE plch_tool_names_t
   IS TABLE OF VARCHAR2 (100)
/

DECLARE
TYPE plch_tool_names_t IS TABLE OF VARCHAR2 (100);
t_plch_tool plch_tool_names_t;
BEGIN
    t_plch_tool := plch_tool_names_t('abc','def','ghi');
    FOR i IN 1..t_plch_tool.COUNT
    LOOP
      DBMS_OUTPUT.PUT_LINE(t_plch_tool(i));
    END LOOP;
END;
