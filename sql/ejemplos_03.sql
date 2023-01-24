--alter SESSION set n

SELECT * 
FROM job_grades
where 5000 BETWEEN LOWEST_SAL and HIGHEST_SAL;

select job_history.*
from job_history
where start_date BETWEEN start_date and end_date+100;

select *
from employees
where salary BETWEEN 1000 and 3000-1;

--where 1000 <= salary and  salary <= 3000;

--select 28 < 8 "kk"
--from dual;
--0-9<A-Z<a-zÁ
select *
from employees
where last_name not like first_name || '%';

select *
from employees
--WHERE job_id LIKE 'AD_P%';
WHERE not (commission_pct is null);

SELECT * FROM (select 'el 100% del producto' kk, 'martin' first_name, 'martinez' last_name from dual)
where last_name like 'M%';
--where last_name = 'martinez%';

--where last_name like first_name || '%';
--kk like '%100\%%' ESCAPE '\'
--;

select job_id, department_id, end_date - start_date duracion
from job_history
where department_id > 50
order by employee_id desc;

SET VERIFY ON;

select *
from employees
where job_id like '&val%'
order by job_id desc
OFFSET &num_page * &&rows ROWS
FETCH NEXT &rows ROWS WITH TIES
;

SELECT NEXT_DAY(sysdate,'TUESDAY') "NEXT DAY"
  FROM DUAL;

SELECT TO_CHAR(5555, '$99999.00') demo
  FROM DUAL;

select COUNT(*) from jobs;
select COUNT(*) from departments;
select COUNT(*) from employees;
select COUNT(*) from jobs, employees, departments;

SELECT * from jobs NATURAL JOIN employees NATURAL JOIN departments;
SELECT * from countries NATURAL JOIN regions;
SELECT * from employees JOIN departments USING(department_id);
SELECT * from jobs, employees, departments
where jobs.job_id = employees.job_id and employees.department_id = departments.department_id;

SELECT first_name, d.department_name, d.manager_id, 
    case when d.department_id is null then 'Si existe' else TO_CHAR(d.manager_id, '9990') end kk
from employees e 
    LEFT JOIN departments d ON e.department_id = d.department_id
;
SELECT e.*, d.*
from employees e 
    FULL JOIN departments d ON e.department_id = d.department_id AND e.manager_id IS NOT NULL
;

SELECT e.*, j.*
from employees e 
    JOIN job_grades j ON e.salary BETWEEN j.LOWEST_SAL AND j.HIGHEST_SAL
;

SELECT first_name, j.job_title, d.department_name, l.state_province, e.manager_id "Jefe Emp", 
    d.manager_id "Jefe Dept", d.department_id
from jobs j 
    INNER JOIN employees e ON j.job_id = e.job_id
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
where city = 'Seattle';

select r.region_id, min(r.region_name), count(*)
from employees e 
    INNER JOIN departments d ON e.department_id = d.department_id
    INNER JOIN locations l ON d.location_id = l.location_id
    INNER JOIN countries c ON c.country_id = l.country_id
    INNER JOIN regions r ON r.region_id = c.region_id
group by r.region_id;

SELECT e.*, m.* from employees e 
    INNER JOIN employees m ON e.manager_id = m.employee_id;


SELECT count(*) from orders;
SELECT count(*) from order_items;
SELECT count(*) from product_information;
SELECT count(*) from product_descriptions;

SELECT to_char(count(*), '999,999,999,990') from orders, order_items, product_information;

select * from emp_details_view;

SELECT distinct count(*), count(employee_id), count(commission_pct), 
    avg(commission_pct), 
--    round(sum(commission_pct)/count(commission_pct),2),
--    sum(commission_pct)/count(*),
--    sum(nvl(commission_pct, 0))/count(*)
    count(job_id),
    count(distinct job_id)
FROM employees
where salary > 5000;

SELECT department_id, job_id, max(manager_id), count(employee_id), count(*)
FROM employees
--where 'IT_PROG' <> job_id
group by department_id, job_id, manager_id
HAVING ('IT_PROG' <> job_id and count(*) >= 5) or ('IT_PROG' = job_id and count(*) < 5)
order by department_id, job_id;

select * from employees
where department_id = 50 and job_id = 'ST_MAN';

select department_id, avg(salary)
from employees
GROUP by  department_id;
select * from employees 
where salary > avg(salary);

select manager_id, avg(salary)
from employees
GROUP BY manager_id
ORDER BY 1;

SELECT manager_id, last_name, hire_date, salary,
       AVG(salary) OVER (PARTITION BY manager_id) AS c_mavg
  FROM employees
  ORDER BY manager_id, hire_date, salary;
SELECT DECODE(GROUPING(department_name), 1, 'All Departments',
      department_name) AS department_name,
   DECODE(GROUPING(job_id), 1, 'All Jobs', job_id) AS job_id,
   COUNT(*) "Total Empl", AVG(salary) * 12 "Average Sal"
   FROM employees e, departments d
   WHERE d.department_id = e.department_id
   GROUP BY ROLLUP (department_name, job_id)
   ORDER BY department_name, job_id;
   
SELECT job_id "Job", department_id "Dept",
    SUM(salary) "Sum"
FROM employees
WHERE department_id in (20,50,80,90)
GROUP BY job_id, department_id;

SELECT * FROM
(SELECT job_id, department_id, salary
FROM employees
WHERE department_id in (20,50,80,90)
) PIVOT (
    sum(salary) for department_id in (20 as "Dept 20", 50 as "Dept 50", 80 as "Dept 80", 90 as "Dept 90")
);

WITH 
   dept_costs AS (
      SELECT department_name, SUM(salary) dept_total
         FROM employees e, departments d
         WHERE e.department_id = d.department_id
      GROUP BY department_name
      ),
   avg_cost AS (
      SELECT SUM(dept_total)/COUNT(*) avg
      FROM dept_costs
      )
SELECT * FROM dept_costs
   WHERE dept_total >
      (SELECT avg FROM avg_cost)
      ORDER BY department_name;