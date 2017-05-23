BEGIN
   DBMS_OUTPUT.put_line (plch_pkg.g_invasives.COUNT);

   plch_show_count;
END;
/

results
0
Count=0

--In interiorul pachetului exista o procedura,remove_invasives, care sterge datele din tabela plch_invasives.

DECLARE
   l_invasives   plch_pkg.invasives_t;
BEGIN
   plch_show_count;
END;
/

results

Count=0

--Datele erau sterse din tabela de procedura remove_invasives .