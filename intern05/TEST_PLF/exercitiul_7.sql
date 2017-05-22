I execute this statement:

CREATE OR REPLACE TYPE plch_tool_names_t
   IS TABLE OF VARCHAR2 (100)
/

--CREATE TYPE plch_tool_names_tab AS OBJECT ( a1 VARCHAR(100));

CREATE TABLE plch_tool_names_tab ( a1 VARCHAR(100) ) ;

INSERT INTO plch_tool_names_tab VALUES ( ' Castelul Peles ');
INSERT INTO plch_tool_names_tab VALUES ( ' Vlad Tepes ' );
INSERT INTO plch_tool_names_tab VALUES ( ' Castelul Bran ' );

Write a block that adds 3 values in a collection of the given type.
Iterate on the collection and display the values you added in previous step.