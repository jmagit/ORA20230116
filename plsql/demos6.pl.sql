CLEAR SCREEN

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
  where department_name = 'IT';
  
  DBMS_OUTPUT.PUT_LINE('department: ' || v_dep);
  
  OPEN c_emp_cursor(v_dep);
  FETCH c_emp_cursor INTO v_emp_record;
  WHILE c_emp_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(c_emp_cursor%ROWCOUNT || ' row => ' || v_emp_record.employee_id ||' '||v_emp_record.last_name);    
    FETCH c_emp_cursor INTO v_emp_record;
  END LOOP;
  CLOSE c_emp_cursor;
END;
