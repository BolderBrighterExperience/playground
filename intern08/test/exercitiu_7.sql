CREATE OR REPLACE TYPE plch_tool_names_t
   IS TABLE OF VARCHAR2 (100)
/



CREATE TABLE plch_tool_names_tab ( a1 VARCHAR(100) ) ;

INSERT INTO plch_tool_names_tab VALUES ( ' A1');
INSERT INTO plch_tool_names_tab VALUES ( ' A2 ' );
INSERT INTO plch_tool_names_tab VALUES ( ' A3 ' );