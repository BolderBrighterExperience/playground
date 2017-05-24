--(in a different session) What will display this block call? Explain why:
BEGIN
   DBMS_OUTPUT.put_line (plch_pkg.g_invasives.COUNT);

   plch_show_count;
END;
/

/*AFISEAZA :
0
Count=0
 Procedura 'remove_invazives' din package, sterge totul din tabelul 'plch_invasives'.
*/

--(in a different session) What will display this block call? Explain why:
DECLARE
   l_invasives   plch_pkg.invasives_t;
BEGIN
   plch_show_count;
END;
/

/*AFISEAZA :
Count=0
 Pentru ca , datele au fost deja sterse din tabelul 'plch_invasives'.
*/
