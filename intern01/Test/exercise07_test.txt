
DECLARE 
    l_names   plch_tool_names_t;
BEGIN
    l_names := plch_tool_names_t('a', 'b', 'c');
    
    FOR i IN l_names.FIRST..l_names.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(l_names(i));
    END LOOP;
END;
/
