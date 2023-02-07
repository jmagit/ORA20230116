--select department_id, department_name, CUENTA_EMP(department_id) empleados
--from departments;
SELECT CUENTA_EMP from dual;

clear SCREEN;

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

--WITH     (FUNCTION nombre 
--    (
--      nom IN varchar2, ape varchar2
--    ) RETURN varchar2 AS 
--    BEGIN
--      RETURN initcap(ape) || ', ' || initcap(nom);
--    END)
--select nombre(first_name, last_name) 
--from employees;

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