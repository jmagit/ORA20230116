CLEAR SCREEN
/*
DECLARE
   CURSOR c_emp_cursor IS 
       SELECT employee_id, last_name 
       FROM employees
       WHERE  department_id =30;
    TYPE tabla_type IS TABLE OF c_emp_cursor%ROWTYPE INDEX BY PLS_INTEGER;
    empleados tabla_type;
    v_empno employees.employee_id%TYPE;
    v_lname employees.last_name%TYPE;
    v_emp_record	c_emp_cursor%ROWTYPE;
BEGIN
  OPEN c_emp_cursor;
  LOOP
--    FETCH c_emp_cursor 
--    INTO v_empno, v_lname;
--    EXIT WHEN c_emp_cursor%NOTFOUND;
--    DBMS_OUTPUT.PUT_LINE( v_empno ||' '||v_lname);    
    FETCH c_emp_cursor 
    INTO v_emp_record;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    empleados(v_emp_record.employee_id) := v_emp_record;
--    DBMS_OUTPUT.PUT_LINE( v_emp_record.employee_id ||' '||v_emp_record.last_name);    
  END LOOP;
  CLOSE c_emp_cursor;
  
  for emp in VALUES OF empleados LOOP
    DBMS_OUTPUT.PUT_LINE( emp.employee_id ||' '||emp.last_name);
  end loop;
  DBMS_OUTPUT.PUT_LINE( '......');
  for emp in VALUES OF empleados LOOP
    DBMS_OUTPUT.PUT_LINE( emp.employee_id ||' '||emp.last_name);
  end loop;
  DBMS_OUTPUT.PUT_LINE( '......');
  DBMS_OUTPUT.PUT_LINE( empleados(118).employee_id ||' '||empleados(118).last_name);
END;

DECLARE
   CURSOR c_emp_cursor IS 
       SELECT employee_id, last_name 
       FROM employees
       WHERE  department_id =30;
BEGIN
  for v_emp_record in c_emp_cursor loop
    DBMS_OUTPUT.PUT_LINE( v_emp_record.employee_id ||' '||v_emp_record.last_name);
  end loop;
END;

BEGIN
  for v_emp_record in (SELECT employee_id, last_name 
       FROM employees
       WHERE  department_id =30) loop
    DBMS_OUTPUT.PUT_LINE( v_emp_record.employee_id ||' '||v_emp_record.last_name);
  end loop;
END;

*/

DECLARE
   CURSOR c_emp_cursor(numdep number) IS 
       SELECT employee_id, last_name 
       FROM employees
       WHERE  department_id = numdep;
    v_emp_record	c_emp_cursor%ROWTYPE;
    v_dep number := null;
BEGIN
  select department_id
  into v_dep
  from Departments
  where department_name = 'Shipping';
  DBMS_OUTPUT.PUT_LINE('department: ' || v_dep);
  
  OPEN c_emp_cursor(v_dep);
  FETCH c_emp_cursor INTO v_emp_record;
  WHILE c_emp_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(c_emp_cursor%ROWCOUNT || ' row => ' || v_emp_record.employee_id ||' '||v_emp_record.last_name);    
    FETCH c_emp_cursor INTO v_emp_record;
  END LOOP;
  CLOSE c_emp_cursor;
END;
