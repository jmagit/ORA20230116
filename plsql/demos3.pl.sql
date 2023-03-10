CLEAR SCREEN

/*
begin
 for i in 1..5, 7..7, 9..10  loop
   insert into messages(results) values(i);
 end loop;
 commit;
end;
-- select * from messages;

declare
    salary number := 5000;
begin
    dbms_output.put_line('valores: ' || (salary/1000));
    dbms_output.put_line('estrellas:' || trim(rpad(' ', (salary/1000)+1, '*')));
end;
select min_salary, max_salary from jobs;
AD_PRES


declare 
    TYPE puesto IS RECORD (MINIMO jobs.min_salary%type, MAXIMO number);
    p1 puesto;
    p2 puesto := puesto(1000, 5000);
    fila jobs%rowtype;
    fila2 jobs%rowtype;
begin
    select *
    into fila
    from jobs 
    where job_id = 'AD_PRES';
    dbms_output.put_line('[' || fila.job_id || ', ' || fila.job_title || ', ' 
        || fila.min_salary || ', ' || fila.max_salary || ']');
    fila.min_salary := fila.max_salary * 0.8;
    dbms_output.put_line('[' || fila.job_id || ', ' || fila.job_title || ', ' 
        || fila.min_salary || ', ' || fila.max_salary || ']');
    select *
    into fila2
    from jobs 
    where job_id = 'AD_VP';
    if fila.min_salary > fila2.min_salary then
        dbms_output.put_line('gama mas');
    else
        dbms_output.put_line('gama mas');
    end if;
    fila := fila2;
    dbms_output.put_line('[' || fila.job_id || ', ' || fila.job_title || ', ' 
        || fila.min_salary || ', ' || fila.max_salary || ']');
    select min_salary, max_salary
    into p1
    from jobs 
    where job_id = 'AD_PRES';
    dbms_output.put_line('Puesto [' || p1.MINIMO || ', ' || p1.MAXIMO || ']');
    p1.MINIMO := fila.min_salary;
    p1.MAXIMO := fila.max_salary;
    p1 := p2;
    dbms_output.put_line('Puesto [' || p1.MINIMO || ', ' || p1.MAXIMO || ']');
end;

DECLARE
  TYPE ename_table_type IS TABLE OF
    employees.last_name%TYPE 
    INDEX BY PLS_INTEGER;
  TYPE emp IS TABLE OF
    employees%ROWTYPE 
    INDEX BY PLS_INTEGER;
  TYPE hiredate_table_type IS TABLE OF PLS_INTEGER
    INDEX BY varchar(10);
  names       ename_table_type; 
  cadenas    hiredate_table_type;
  clave PLS_INTEGER;
  valor employees.last_name%TYPE;
BEGIN
  names(7)    := 'CAMERON';
  names(3)    := 'PEPITO';
  names(1)    := 'primera';
  select employee_id, last_name
  into clave, valor
  from employees
  where job_id = 'AD_PRES';
  names(clave) := valor;
  dbms_output.put_line('Elementos: ' || names.count);
  dbms_output.put_line('Ultimo: ' || names.last || ', ' || names(names.last));
  names(100) := 'modifica';
  dbms_output.put_line('Ultimo: ' || names.last || ', ' || names.prior(names.last));
  dbms_output.put_line('Secuencia: ' || names.first || ', ' 
    || names.next(names.first) || ', ' 
    || names.prior(names.last) || ', ' 
    || names.last
    );
  names.delete(7);
  dbms_output.put_line('Secuencia: ' || names.first || ', ' 
    || names.next(names.first) || ', ' 
    || names.prior(names.last) || ', ' 
    || names.last
    );
   cadenas('uno') := 1;
   cadenas('dos') := 2;
   cadenas('tres') := 3;
   cadenas('cuatro') := 4;
   cadenas('min_salary') := 1;
   cadenas('max_salary') := 2;
  dbms_output.put_line('Secuencia: ' || cadenas.first || ', ' 
    || cadenas.next(cadenas.first) || ', ' 
    || cadenas.prior(cadenas.last) || ', ' 
    || cadenas.last
    );
   
  END; 
*/

DECLARE
    TYPE tabla_type IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
--    TYPE tabla_type IS TABLE OF VARCHAR2(100);
--    TYPE tabla_type IS VARRAY(5) OF VARCHAR2(100);
    tabla tabla_type := tabla_type('uno', 'dos', 'tres', 'cuatro');

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
--       FOR valor IN VALUES OF tabla LOOP
--          DBMS_OUTPUT.PUT_LINE(valor);
--       END LOOP;
       FOR indice, valor IN PAIRS OF tabla LOOP
          DBMS_OUTPUT.PUT_LINE(indice || ' => '|| valor);
       END LOOP;
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
--    tabla(1) := 'uno';
--    tabla(2) := 'dos';
--    tabla(3) := 'tres';
--    tabla(4) := 'cuatro';
--    tabla := tabla_type('uno', 3 => 'tres', 5 => 'cinco'); --, OTHERS => 'Otros');
    print_secuencial('Orginal');
--    tabla := tabla_type('uno', 'dos', 'tres', 'cuatro', 'cinco');
    tabla(1) := '1111';
--    tabla.extend;
    tabla(5) := 'cinco';
--    tabla.extend;
    tabla(6) := 'seis';
    tabla.delete(2, 4);
--    tabla.trim(2);
    print_secuencial('Actual');
    --print_por_index('Actual');
END;

