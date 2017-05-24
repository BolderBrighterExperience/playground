CREATE OR REPLACE TYPE plch_tool_names_t
   IS TABLE OF VARCHAR2 (100);
 /  
   DECLARE
   l_plch_tool_names_t  plch_tool_names_t := plch_tool_names_t();
    
   BEGIN 
   l_plch_tool_names_t.EXTEND(3);
   l_plch_tool_names_t(1) := 'A1';
   l_plch_tool_names_t(2) := 'A2';
   l_plch_tool_names_t(3) := 'A3';
   FOR i IN 1..l_plch_tool_names_t.COUNT 
   LOOP
   DBMS_OUTPUT.PUT_LINE(l_plch_tool_names_t(i));
  END LOOP ;

END;
/