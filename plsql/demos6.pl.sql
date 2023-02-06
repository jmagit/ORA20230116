CLEAR SCREEN

DECLARE
   CURSOR c_emp_cursor(numdep number) IS 
       SELECT employee_id, last_name
       FROM employees
       WHERE  department_id = numdep;
    v_emp_record	c_emp_cursor%ROWTYPE;
    v_dep number := 10;
    v_dept varchar(100) := 'xIT';
    no_puedo_exception EXCEPTION;
    insert_null_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_exception, -1400);
BEGIN
    for i in 1..5 loop
        DECLARE
            interna_exception EXCEPTION;
        begin
        INSERT INTO departments (department_id, department_name) VALUES (v_dep, null);
        exception
        when insert_null_exception then 
            DBMS_OUTPUT.PUT_LINE('cannot insert NULL into');
             RAISE_APPLICATION_ERROR(-20202, 'This is not a valid manager');
           raise;

        when DUP_VAL_ON_INDEX then 
            DBMS_OUTPUT.PUT_LINE('reintento ' || i || ' con ' || v_dep);
            v_dep := v_dep + 10;
        end;
    end loop;
    
    <<repetir>>
    BEGIN
      select department_id
      into v_dep
      from Departments
      where department_name = v_dept
      ;
       DBMS_OUTPUT.PUT_LINE('department: ' || v_dep);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('no existe: ' || v_dept);
            if v_dept = 'ITx' then
                raise no_puedo_exception;
            end if;
            v_dept := 'ITx';
            goto repetir;
    END;
    
  
  OPEN c_emp_cursor(v_dep);
  FETCH c_emp_cursor INTO v_emp_record;
  WHILE c_emp_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(c_emp_cursor%ROWCOUNT || ' row => ' || v_emp_record.employee_id ||' '||v_emp_record.last_name);    
    FETCH c_emp_cursor INTO v_emp_record;
  END LOOP;
  CLOSE c_emp_cursor;
EXCEPTION
--    WHEN interna_exception THEN DBMS_OUTPUT.PUT_LINE('sin departamento');
    WHEN TOO_MANY_ROWS OR NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Esta mal el departamento');
    WHEN no_puedo_exception THEN DBMS_OUTPUT.PUT_LINE('sin departamento');
    WHEN OTHERS THEN
       CASE SQLCODE 
       WHEN 100 THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' >>>> ' || SQLERRM);
       WHEN -1422 THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' >>>> ' || SQLERRM);
       WHEN -1400 THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' >>>> ' || SQLERRM);
       else
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' >>>> ' || SQLERRM);
       END CASE;
END;
