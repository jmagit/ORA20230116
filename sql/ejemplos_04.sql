SELECT *
from employees e 
    INNER JOIN jobs j ON j.job_id = e.job_id
WHERE e.salary NOT BETWEEN j.min_salary and j.max_salary;

SELECT DISTINCT m.*
FROM employees w JOIN employees m ON w.manager_id = m.employee_id;

SELECT DISTINCT manager_id 
FROM employees 
WHERE manager_id IS NOT NULL;

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
ORDER BY 1;

SELECT e.last_name, salary, media
FROM employees e JOIN (
    SELECT job_id, avg(salary) media
    FROM employees
    GROUP BY job_id
    ) sal ON e.job_id = sal.job_id
ORDER BY 1

