DROP TABLE plch_invasives;
CREATE TABLE plch_invasives
(
   species_name        VARCHAR2 (100),
   original_location   VARCHAR2 (100),
   damage_done         VARCHAR2 (100)
)
/

BEGIN
   INSERT INTO plch_invasives
        VALUES ('Kudzu', 'Japan', 'Everything covered over');
   INSERT INTO plch_invasives
        VALUES ('Buckthorn', 'Europe', 'Dead birds');
   COMMIT;
END;
/

CREATE OR REPLACE PACKAGE plch_pkg
IS
   TYPE invasives_t IS TABLE OF plch_invasives%ROWTYPE
      INDEX BY PLS_INTEGER;

   g_invasives   invasives_t;

   CURSOR invasives_cur
   IS
      SELECT * FROM plch_invasives;

   PROCEDURE show_count;
END plch_pkg;
/

CREATE OR REPLACE PACKAGE BODY plch_pkg
IS
   PROCEDURE show_count
   IS
      l_count   PLS_INTEGER;
   BEGIN
      SELECT COUNT (*) INTO l_count FROM plch_invasives;

      DBMS_OUTPUT.put_line (l_count); -- 2
   END show_count;

   PROCEDURE remove_invasives
   IS
   BEGIN
      DELETE FROM plch_invasives;
   END remove_invasives; 
BEGIN
   remove_invasives;
END plch_pkg;
/

CREATE OR REPLACE PROCEDURE plch_show_count
IS
   l_count   PLS_INTEGER;
BEGIN
   SELECT COUNT (*) INTO l_count FROM plch_invasives;

   DBMS_OUTPUT.put_line ('Count=' || l_count);
END plch_show_count;
/

BEGIN
   DBMS_OUTPUT.put_line (plch_pkg.g_invasives.COUNT); -- 0

   plch_show_count; -- 2 
END;
/

DECLARE
   l_invasives   plch_pkg.invasives_t;
BEGIN
   plch_show_count; 
END;
/
--this block will display 2

