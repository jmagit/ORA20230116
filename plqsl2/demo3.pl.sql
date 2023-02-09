/*
select department_id, department_name, CUENTA_EMP(department_id) empleados
from departments
where VALID_DEPTID(department_id);
SELECT CUENTA_EMP, VALID_DEPTID(999) from dual;

select department_id, department_name, CUENTA_EMP(department_id) empleados
from departments
where VALID_DEPTID_SQL(department_id) = 1;
SELECT CUENTA_EMP, VALID_DEPTID_SQL(999) from dual;
*/
clear SCREEN;
/*
declare
    v_emps number;
    FUNCTION nombre 
    (
      nom IN varchar2, ape varchar2
    ) RETURN varchar2 AS 
    BEGIN
      RETURN initcap(ape) || ', ' || initcap(nom);
    END;
begin
    v_emps:=CUENTA_EMP(30) * 10;
    DBMS_OUTPUT.PUT_LINE('var: ' || v_emps || ', func: ' || CUENTA_EMP(30));
    DBMS_OUTPUT.PUT_LINE('nombre: ' || nombre('pepito', 'grillo'));
end;

WITH FUNCTION nombre 
    (
      nom IN varchar2, ape varchar2
    ) RETURN varchar2 AS 
    BEGIN
      RETURN initcap(ape) || ', ' || initcap(nom);
    END;
select nombre(first_name, last_name) 
from employees;
*/
/*
CREATE OR REPLACE FUNCTION CUENTA_EMP 
(
  DEPT_NO IN NUMBER 
) RETURN NUMBER AS 
cont number;
BEGIN
  select count(*)
  into cont
  from employees
  where department_id = dept_no;
  --insert INTO messages(results) values('Cuenta: ' || cont);
  RETURN cont;
END CUENTA_EMP;
*/

BEGIN
    insert INTO messages(results) values('SI O SI antes de add_job');
    --add_job('AD_VP', 'kk');
    add_job('KK_KKK', 'kk', TRUE);
    insert INTO messages(results) values('SI O SI despues de add_job');
    ROLLBACK;
EXCEPTION
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Externo: ' || SQLCODE || ', ' || SQLERRM);
        ROLLBACK;
END;

/*
select * from messages order by cuando desc;
select * from jobs;
delete from jobs where upper(job_id) like 'KK%';

*/