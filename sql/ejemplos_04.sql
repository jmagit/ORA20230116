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

WITH media_salario AS (
    SELECT job_id, avg(salary) media
            FROM employees
            GROUP BY job_id
), jefes AS (
SELECT d.*
FROM hr.employees e 
    RIGHT JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.employee_id is null
)
SELECT e.last_name, salary, media
FROM employees e JOIN media_salario sal ON e.job_id = sal.job_id
where media > 4000
ORDER BY 1;

WITH media_salario(trabajo, valor) AS (
    SELECT job_id, avg(salary) media
            FROM employees
            GROUP BY job_id
)
select * from media_salario;

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
from (
    SELECT department_id, last_name, salary, 1 orden
    FROM employees e
    UNION
    SELECT department_id, 'TOTAL DEPARTAMENTO', sum(salary), 2
    FROM employees e
    GROUP BY department_id
    UNION
    SELECT null, 'TOTAL EMPRESA', sum(salary), 3
    FROM employees e
)
Order by department_id,orden, last_name);

SELECT department_id, DECODE(GROUPING(department_id), 1, 'TOTAL Departments',
      employee_id), sum(salary)
FROM employees e
GROUP BY ROLLUP(department_id, employee_id);

SELECT DECODE(GROUPING(department_name), 1, 'All Departments',
      department_name) AS department_name,
   DECODE(GROUPING(job_id), 1, 'All Jobs', job_id) AS job_id,
   COUNT(*) "Total Empl", AVG(salary) * 12 "Average Sal"
   FROM employees e, departments d
   WHERE d.department_id = e.department_id
   GROUP BY CUBE (department_name, job_id)
   ORDER BY department_name, job_id;
   
SELECT * FROM (
    SELECT job_id, department_id, salary
    FROM employees
    WHERE department_id in (20,50,80,90)
) PIVOT (
    sum(salary) for department_id in (20 as "Dept 20", 50 as "Dept 50", 80 as "Dept 80", 90 as "Dept 90")
);

SELECT t.*, T1+t.T2+t3+t4 total
from
(
    SELECT * FROM (
        SELECT EXTRACT(year FROM hire_date) a�o, TO_CHAR(hire_date, 'Q') trimestre
        FROM employees
    ) PIVOT (
        count(*) for trimestre in ('1' as "T1", '2' as "T2", '3' as "T3", '4' as "T4")
    )
) t
ORDER BY 1;

SELECT * FROM jobs
    UNPIVOT (salary for tipo in (MIN_SALARY as 'min', MAX_SALARY as 'max'))
;

SELECT NVL(DECODE(GROUPING(department_id), 1, 'TOTAL Departments',
      department_id), '(Sin departamento)') AS department_idx,
   DECODE(GROUPING(job_id), 1, 'TOTAL Jobs', job_id) AS job_id,
   COUNT(*) "Total Empl", round(AVG(salary) * 12, 2) "Average Sal"
FROM employees 
GROUP BY ROLLUP (department_id, job_id, EXTRACT(year FROM hire_date))
ORDER BY department_id NULLS FIRST, job_id;

SELECT ROWNUM, ROWID, department_id, employee_id
FROM employees
ORDER BY 3, 4;

SELECT
    department_id, first_name, last_name, salary,
    (select avg(salary) from employees d where d.department_id = e.department_id) sub,
    avg(salary) OVER (PARTITION BY department_id) media
FROM employees e
where avg(salary) OVER (PARTITION BY department_id) > 4000
ORDER BY 1;

SELECT
    department_id, first_name, last_name, salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary desc) rn
FROM employees
ORDER BY 1, rn;
  
SELECT last_name, salary,
       RANK() OVER (ORDER BY salary DESC) RANK
FROM employees
ORDER BY RANK;

SELECT last_name, salary, ROUND(AVG(salary) OVER(PARTITION BY department_id),0) media
FROM employees
--where AVG(salary) OVER(PARTITION BY department_id) > 4000
ORDER BY 1;

WITH 
   dept_costs AS (
      SELECT department_name, SUM(salary) dept_total
         FROM employees e, departments d
         WHERE e.department_id = d.department_id
      GROUP BY department_name),
   avg_cost AS (
      SELECT SUM(dept_total)/COUNT(*) avg
      FROM dept_costs)
SELECT * FROM dept_costs
   WHERE dept_total >
      (SELECT avg FROM avg_cost)
      ORDER BY department_name;

WITH 
   dept_costs AS (
      SELECT department_name, SUM(salary) dept_total
         FROM employees e, departments d
         WHERE e.department_id = d.department_id
      GROUP BY department_name),
   avg_cost AS (
      SELECT SUM(dept_total)/COUNT(*) avg
      FROM dept_costs)
SELECT * FROM (SELECT department_name, SUM(salary) dept_total
         FROM employees e, departments d
         WHERE e.department_id = d.department_id
      GROUP BY department_name)
   WHERE dept_total >
      (SELECT avg FROM SELECT SUM(dept_total)/COUNT(*) avg
      FROM dept_costs)
      ORDER BY department_name; 
      
SELECT LPAD(' ',2*(LEVEL-1)) || last_name org_chart, 
        employee_id, manager_id, job_id
    FROM employees
    where employee_id = 101
    START WITH job_id = 'AD_VP' 
    CONNECT BY PRIOR employee_id = manager_id; 
    
update employees e
set 
--salary = salary * (select location_id from departamets d where e.department_id = d.department_id ),
--    COMMISSION_PCT =  COMMISSION_PCT *(select MANAGER_ID from departamets d where e.department_id = d.department_id)
(salary, COMMISSION_PCT) = (select salary * location_id, COMMISSION_PCT *MANAGER_ID from departamets d where e.department_id = d.department_id)
, job_id = 'kk'
;
select * from employees;
commit