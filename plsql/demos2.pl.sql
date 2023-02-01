CLEAR SCREEN

/*
BEGIN
    << fuera >> DECLARE
        v_sal     NUMBER(7, 2) := 60000;
        v_comm    NUMBER(7, 2) := v_sal * 0.20;
        v_message VARCHAR2(255) := ' eligible for commission';
    BEGIN
        v_comm := 10;
        DECLARE
            v_sal        NUMBER(7, 2) := 50000;
            v_comm_int   NUMBER(7, 2) := 0;
            v_total_comp NUMBER(7, 2) := v_sal + v_comm;
        BEGIN
            v_message := 'CLERK not' || v_message;
            v_comm := v_sal * 0.30;
            dbms_output.put_line('Interno: ' || v_comm);
            fuera.v_comm := v_comm;
        END;

        dbms_output.put_line('externo: ' || v_comm);
    END;
END fuera;

declare
    cuantos PLS_INTEGER := 0;
    otra cuantos%type;
    v_min_salary cuantos%type := 0;
    factor number(2,2) := .90;
    id varchar(100) := 'AD_PRES';
begin
    select count(*)
    into cuantos
    from jobs
    where job_id = id
    ;
    dbms_output.put_line('cuantos: ' || cuantos);
    select min_salary * factor, min_salary, 1
    into cuantos, otra, v_min_salary
    from jobs
    where job_id = id and max_salary > v_min_salary;
    dbms_output.put_line('min_salary: ' || cuantos || ', ' || otra || ', ' || v_min_salary);
    
end;

DECLARE
    current_date DATE := sysdate;
    v_first_name employees.first_name%TYPE;
    id           employees.employee_id%TYPE;
    salario employees.salary%TYPE;
    factor       NUMBER(2, 2) :=.90;
BEGIN
    UPDATE employees
    SET
        salary = salary * factor;
    --select employees_seq.NEXTVAL into id from dual;
    dbms_output.put_line('modificados: ' || sql%ROWCOUNT);
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        salary
    ) VALUES (
        employees_seq.NEXTVAL,
        'Ruth',
        'Coress',
        'RCORES',
        current_date,
        'AD_PRES',
        4000
    );
    dbms_output.put_line('id: ' || employees_seq.currval);
    dbms_output.put_line('insertados: ' || sql%ROWCOUNT);
    id := employees_seq.currval;
    SELECT
        first_name
    INTO v_first_name
    FROM
        employees
    WHERE
        employee_id = id;

    dbms_output.put_line('nombre: ' || v_first_name);
    UPDATE employees
    SET salary = salary * factor
    --WHERE employee_id = id
    RETURNING avg(salary) into salario;
    
--    SELECT salary
--    INTO salario
--    FROM employees
--    WHERE employee_id = id;
    dbms_output.put_line('salario: ' || salario);
--    SELECT sum(salary)
--    INTO salario
--    FROM employees
--    WHERE employees.department_id = 50;
    delete empleados
    WHERE empleados.id_departamento = 100
    RETURNING sum(salario) into salario;
    
    dbms_output.put_line('total: ' || salario);
    
    ROLLBACK;
    COMMIT;
END;

<<exteno>>
declare
    cuantos PLS_INTEGER := 0;
    id varchar(100) := 'AD_PRES';
    v_min_salary cuantos%type := 0;
begin
    select count(*)
    into cuantos
    from jobs
    where job_id = id
    ;
    if id = 'AD_PRES' then
--       declare
--            v_min_salary cuantos%type := 1000;
       begin
            v_min_salar := 100;
            dbms_output.put_line('min_salary: ' ||  v_min_salary);
       end;
    end;
    
    if cuantos = 1 then
       declare
            otra cuantos%type;
            v_min_salary2 cuantos%type := 0;
            factor number(2,2) := .90;
       begin
            select min_salary * v_min_salary, min_salary, 1
            into cuantos, otra, v_min_salary2
            from jobs
            where job_id = id and max_salary > v_min_salary;
            dbms_output.put_line('min_salary: ' || cuantos || ', ' || otra || ', ' || v_min_salary);
       end;
    elsif cuantos = 0 then
        dbms_output.put_line('no se ha recuperado ninguno');
    else
        dbms_output.put_line('se han recuperado demasiados');
    end if;
    
    dbms_output.put_line('cuantos: ' || cuantos);
    --variable := 
    case 
    when cuantos in (1, 10, 20) then
        null;
    when cuantos = 10 then
        dbms_output.put_line('no se ha recuperado ninguno');
    else
        dbms_output.put_line('se han recuperado demasiados');
    end case;
end;


declare
    c1 BOOLEAN := true;
    c2 BOOLEAN := null;
begin
    if c1 and c2 then
        dbms_output.put_line('AND then');
    else
        dbms_output.put_line('AND else');
    end if;
    if c1 or c2 then
        dbms_output.put_line('OR then');
    else
        dbms_output.put_line('OR else');
    end if;
end;
*/
<<fuera>>
declare
    cont PLS_INTEGER := 0;
begin

--    loop
--        cont := cont + 1;
--        dbms_output.put_line('cont: ' || cont);
--        if cont >= 10 then
--            dbms_output.put_line('termine');
--            exit;
--            dbms_output.put_line('esto no se hace');
--        end if;
--        exit when cont >= 10;
--    end loop;
--    while cont < 10
--    loop 
--        cont := cont + 1;
--        dbms_output.put_line('cont: ' || cont);
--        if cont >= 10 then
--            dbms_output.put_line('termine');
----            exit;
----            dbms_output.put_line('esto no se hace');
--        end if;
----        exit when cont >= 10;
--    end loop;
    cont := 10;
--    for i in 1.0..10.0 by 0.5 --, 20..30
--    loop 
--        dbms_output.put_line('cont: ' || i || ', ' || fuera.cont);
--        cont := i;
----        if cont >= 10 then
----            dbms_output.put_line('termine');
----        end if;
--    end loop;
--   FOR i IN 1, REPEAT i*2 WHILE i < 100 LOOP
--      DBMS_OUTPUT.PUT_LINE(i);
--      continue when temine;
--      ...
--      continue when temine;
--      ...
--      if no temine then
--        ...
--        if no temine then
--        ...        
--        end if
--      end if
--   END LOOP;
<<externo>>
for i in 1..10 loop 
    <<interno>>
    for i in 1..10 loop
    if i > 0 then 
        dbms_output.put_line('haz algo');
        exit; 
    end if;
    exit interno when i > 0;
        
            dbms_output.put_line('cont: ' || externo.i || ', ' || i);
            --continue externo when (externo.i * i) > 60;
            goto pinta;
        end loop;
        
    end loop;
--...
<<pinta>>    
dbms_output.put_line('cont: ' ||cont);
end;


