CLEAR SCREEN

DECLARE
--    TYPE tabla_type IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    TYPE tabla_type IS TABLE OF VARCHAR2(100);
--    TYPE tabla_type IS VARRAY(15) OF VARCHAR2(100);
    tabla tabla_type := tabla_type('uno', 'dos', 'tres', 'cuatro');
    tab1 tabla_type := tabla_type('uno', 'dos', 'tres', 'cuatro');
    tab2 tabla_type := tabla_type('tres', 'cuatro', 'cinco', 'seis' );

    PROCEDURE print_secuencial(heading VARCHAR2) IS
    BEGIN
       dbms_output.put_line(heading);
--        FOR indice IN 1..tabla.count LOOP
--            dbms_output.put_line(indice || ' => ' || tabla(indice));
--        END LOOP;
--        FOR indice IN tabla.first .. tabla.last LOOP
--            if tabla.exists(indice) then
--                dbms_output.put_line(indice || ' => ' || tabla(indice));
--            end if;
--        END LOOP;
--       FOR indice IN INDICES OF tabla LOOP 
--           DBMS_OUTPUT.PUT_LINE(indice || ' => '|| tabla(indice));  
--       END LOOP;
       FOR valor IN VALUES OF tabla LOOP
          DBMS_OUTPUT.PUT_LINE(valor);
       END LOOP;
--       FOR indice, valor IN PAIRS OF tabla LOOP
--          DBMS_OUTPUT.PUT_LINE(indice || ' => '|| valor);
--       END LOOP;
       
       dbms_output.put_line('---');
    END;

    PROCEDURE print_por_index(heading VARCHAR2) IS
    indice  NUMBER;
    BEGIN
        dbms_output.put_line(heading);
        indice := tabla.first;
        WHILE indice IS NOT NULL LOOP
            dbms_output.put_line(indice || ' => ' || tabla(indice));
            indice := tabla.next(indice);
        END LOOP;

        dbms_output.put_line('---');
    END;

BEGIN
--    tabla(1) := 'UNO';
--    tabla(2) := 'dos';
--    tabla(3) := 'tres';
--    tabla(4) := 'cuatro';
--    tabla := tabla_type('uno', '22', 3 => 'tres', 5 => 'cinco'); --, OTHERS => 'Otros');
--    tabla := tabla_type('uno', 3 => 'tres', 5 => 'cinco', OTHERS => 'Otros');
--    tabla := tabla_type(FOR i IN 1..5 SEQUENCE => 'ALUM ' || i);
--    tabla := tabla_type(FOR i IN 2..10 BY 2 INDEX i/2 => 'ALUM ' || i);
--    tabla := tabla_type(FOR i IN 2..10 BY 2 => 'ALUM ' || i);
    print_secuencial('Orginal');
--    tabla := tabla_type('uno', 'dos', 'tres', 'cuatro', 'cinco');
/*
tabla(1) := '1111';
    tabla.extend;
    tabla(5) := 'cinco';
    tabla.extend;
    tabla(6) := 'seis';
    tabla.delete(2, 4);
--    tabla.trim(2);
--    tabla.extend;
    --print_secuencial('Actual');
    print_por_index('Actual');
*/

    tabla := tab1 MULTISET UNION tab2;
    print_secuencial('UNION');
    tabla := tab1 MULTISET UNION DISTINCT tab2;
    print_secuencial('UNION DISTINCT');
    tabla := tab1 MULTISET INTERSECT tab2;
    print_secuencial('INTERSECT');
    tabla := tab1 MULTISET EXCEPT tab2;
    print_secuencial('EXCEPT');
    tabla := tab2 MULTISET EXCEPT tab1;
    print_secuencial('EXCEPT');

END;

