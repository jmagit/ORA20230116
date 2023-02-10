clear screen;

declare
    TYPE indentificadores_array IS TABLE OF number;
    t_keys indentificadores_array;
    TYPE nombres_array IS TABLE OF varchar2(500);
    t_nombres nombres_array;
    TYPE puestos_array IS TABLE OF jobs%rowtype;
    puestos puestos_array;
   
    v_cursor SYS_REFCURSOR;
    v_sql_cmd VARCHAR2(500);
    
    iterations  CONSTANT PLS_INTEGER := 50000;
    t1  INTEGER;
    t2  INTEGER;
    t3  INTEGER;
begin
    SELECT employee_id, first_name || ' ' || last_name
    BULK COLLECT INTO t_keys, t_nombres
    FROM employees
    ORDER BY employee_id;    
    for i in 1 .. t_keys.count loop
        DBMS_OUTPUT.PUT_LINE(t_keys(i) || ' -> ' || t_nombres(i));
    end loop;
    DBMS_OUTPUT.new_line();

--    SELECT * 
--    BULK COLLECT INTO puestos
--    FROM jobs;
--    for puesto in values of puestos loop
--        DBMS_OUTPUT.PUT_LINE(puesto.job_title);
--    end loop;
--    DBMS_OUTPUT.new_line();
--    
--    v_sql_cmd := 'SELECT * FROM jobs ORDER BY job_title';
--    open v_cursor FOR v_sql_cmd;
--    loop
--        FETCH v_cursor BULK COLLECT INTO puestos LIMIT 5;
--        DBMS_OUTPUT.PUT_LINE('--- BLOQUE' );
--        for puesto in values of puestos loop
--            DBMS_OUTPUT.PUT_LINE(puesto.job_title);
--        end loop;
--        exit when v_cursor%notfound;
--    end loop;
--    close v_cursor;
--    DBMS_OUTPUT.new_line();
--
--    delete from emp where department_id = 30
--    RETURNING employee_id BULK COLLECT INTO t_keys;
--    DBMS_OUTPUT.PUT('Borrados: ');
--    for emp_id in values of t_keys loop
--        DBMS_OUTPUT.PUT(' ' || emp_id);
--    end loop;
--    DBMS_OUTPUT.new_line();DBMS_OUTPUT.new_line();
--    rollback;

--    t_nombres := nombres_array();
--    FOR i IN 1..iterations LOOP
--        t_nombres.extend;
--        t_nombres(i) := 'FOR: ' || i;
--    END LOOP;
--    t1 := DBMS_UTILITY.get_time;
--    FOR i IN 1..iterations LOOP
--        insert INTO messages(results) values(t_nombres(i));
--    END LOOP;
--    t2 := DBMS_UTILITY.get_time;
--    FORALL i IN 1..iterations
--        insert INTO messages(results) values(t_nombres(i));
--    t3 := DBMS_UTILITY.get_time;
--    
--    DBMS_OUTPUT.PUT_LINE('Execution Time (secs)');
--    DBMS_OUTPUT.PUT_LINE('---------------------');
--    DBMS_OUTPUT.PUT_LINE('FOR LOOP: ' || TO_CHAR((t2 - t1)/100));
--    DBMS_OUTPUT.PUT_LINE('FORALL:   ' || TO_CHAR((t3 - t2)/100));
--    rollback;

end;