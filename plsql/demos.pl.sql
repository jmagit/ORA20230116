declare
    sal number := 0;
begin
    select salary into sal
    from employees 
    where employee_id = 100;
    dbms_output.put_line('El salario es ' || sal);
    dbms_output.put_line('Hola mundo');
    dbms_output.put_line('El doble salario es ' || (2*sal));
end;