CREATE TABLE TEMP 
(
  ID NUMBER(6) NOT NULL 
, MESSAGE VARCHAR2(500) 
, CONSTRAINT TEMP_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);
/
insert into temp
select * from (
    select 1 id, 'uno' nombre from dual
    union
    select 2 id, 'dos' nombre from dual
    union
    select 3 id, 'tres' nombre from dual
)
;
    SELECT sum(salary)
    FROM employees
    WHERE employees.department_id = 50;
