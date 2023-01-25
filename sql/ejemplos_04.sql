SELECT d.*
FROM hr.employees e 
    RIGHT JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.employee_id is null;

SELECT *
FROM hr.departments
WHERE department_id not in (
    SELECT distinct department_id
    FROM hr.employees
    WHERE department_id is not null
    --order by department_id
);

SELECT *
FROM hr.departments d
WHERE NOT EXISTS(
    SELECT 1
    FROM hr.employees e
    WHERE d.department_id = e.department_id and e.department_id is not null
);


SELECT *
from employees e 
    INNER JOIN jobs j ON j.job_id = e.job_id
WHERE e.salary NOT BETWEEN j.min_salary and j.max_salary;

SELECT DISTINCT m.*
FROM hr.employees w JOIN hr.employees m ON w.manager_id = m.employee_id;

SELECT *
FROM hr.employees
where employee_id in (
    SELECT manager_id 
    FROM hr.employees 
    WHERE manager_id IS NOT NULL
);

SELECT salary
FROM employees m
WHERE m.employee_id = 100; -- e.manager_id;

SELECT first_name, d.department_name, d.manager_id, 
    case when d.department_id is null then 'Si existe' else TO_CHAR(d.manager_id, '9990') end kk
from employees e 
    LEFT JOIN departments d ON e.department_id = d.department_id
;
SELECT first_name, d.department_name, d.manager_id, 
    nvl2(d.department_id, TO_CHAR(d.manager_id, '9990'), 'Sin departamento') Jefe
from employees e 
    LEFT JOIN departments d ON e.department_id = d.department_id
;

SELECT job_id, avg(salary) media
FROM employees
GROUP BY job_id;


SELECT e.last_name "Employee", e.hire_date, e.hire_date - (SELECT hire_date FROM employees WHERE last_name = 'Davies') diff
FROM employees e
WHERE e.hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Davies')
ORDER BY 2;

SELECT e.last_name "Employee", salary, (SELECT avg(salary) FROM employees i WHERE i.job_id = e.job_id) media
FROM employees e
where (SELECT avg(salary) FROM employees i WHERE i.job_id = e.job_id) > 4000
ORDER BY 1;

SELECT e.last_name, salary, media
FROM employees e JOIN (
        SELECT job_id, avg(salary) media
        FROM employees
        GROUP BY job_id
    ) sal ON e.job_id = sal.job_id
where media > 4000
ORDER BY 1;

SELECT e.last_name, salary, media
FROM employees e JOIN (
        SELECT job_id, avg(salary) media
        FROM employees
        GROUP BY job_id
    ) sal ON e.job_id = sal.job_id
ORDER BY 1;

SELECT d.department_id id_dept, d.department_name, 1 consulta
FROM departments d 
    JOIN locations l USING (location_id)
WHERE LOWER(l.city) = 'toronto'
MINUS
SELECT 60, 'IT', 2 from dual
UNION
SELECT d.department_id, d.department_name, 2
FROM employees e 
    JOIN departments d ON e.department_id = d.department_id
WHERE e.job_id = 'IT_PROG'
ORDER BY 1
UNION
SELECT 1 department_id, 'Falso' from dual
ORDER BY 1;
select department_id, last_name, salary
from (SELECT department_id, last_name, salary, 1 orden
FROM employees e
UNION
SELECT department_id, 'TOTAL', sum(salary), 2
FROM employees e
GROUP BY department_id
Order by department_id,orden, last_name);