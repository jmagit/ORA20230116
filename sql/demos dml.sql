insert into empleados(nombre, apellidos, id_departamento, finicio, ffin)
select employees.first_name, employees.last_name, employees.department_id, hire_date, '01-01-2011' 
from employees
where EXTRACT(year from hire_date) in (2003);
select * from empleados;
commit;