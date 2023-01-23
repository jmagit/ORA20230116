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

SELECT count(*) from orders;
SELECT count(*) from order_items;
SELECT count(*) from product_information;
SELECT count(*) from product_descriptions;

SELECT count(*) from orders, order_items, product_descriptions;

select * from emp_details_view;
