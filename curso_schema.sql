--------------------------------------------------------
-- Archivo creado  - viernes-febrero-10-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type CADENAS_TABLE_TYP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "HR"."CADENAS_TABLE_TYP" 
AS TABLE OF VARCHAR2(500);

/
--------------------------------------------------------
--  DDL for Type RANGO_MONEDA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "HR"."RANGO_MONEDA" AS OBJECT 
( minimo  NUMBER(8,2),
        maximo  NUMBER(8,2)
)

/
--------------------------------------------------------
--  DDL for Sequence DEMO
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEMO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMPLEADOS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLEADOS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 223 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "HR"."COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2 BYTE), 
	"COUNTRY_NAME" VARCHAR2(40 BYTE), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50;

   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
   COMMENT ON COLUMN "HR"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
   COMMENT ON TABLE "HR"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
  GRANT SELECT ON "HR"."COUNTRIES" TO "OE";
  GRANT REFERENCES ON "HR"."COUNTRIES" TO "OE";
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "HR"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
   COMMENT ON TABLE "HR"."DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
  GRANT SELECT ON "HR"."DEPARTMENTS" TO "OE";
--------------------------------------------------------
--  DDL for Table EMP
--------------------------------------------------------

  CREATE TABLE "HR"."EMP" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."EMP"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "HR"."EMP"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMP"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMP"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "HR"."EMP"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "HR"."EMP"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "HR"."EMP"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
   COMMENT ON COLUMN "HR"."EMP"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "HR"."EMP"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
   COMMENT ON COLUMN "HR"."EMP"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "HR"."EMP"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
   COMMENT ON TABLE "HR"."EMP"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
--------------------------------------------------------
--  DDL for Table EMPLEADOS
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLEADOS" 
   (	"ID_EMPLEADO" NUMBER(4,0), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"APELLIDOS" VARCHAR2(100 BYTE), 
	"SALARIO" NUMBER(7,2) DEFAULT 1080.00, 
	"ACTIVO" CHAR(1 BYTE) DEFAULT 'V', 
	"FINICIO" DATE DEFAULT SYSDATE, 
	"FFIN" DATE, 
	"ID_DEPARTAMENTO" NUMBER(4,0), 
	"EMPLEADO" VARCHAR2(151 BYTE) GENERATED ALWAYS AS ("NOMBRE"||' '||"APELLIDOS") VIRTUAL 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."EMPLEADOS"."ACTIVO" IS '
';
   COMMENT ON COLUMN "HR"."EMPLEADOS"."FINICIO" IS '
';
   COMMENT ON TABLE "HR"."EMPLEADOS"  IS 'Demo del curso';
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
   COMMENT ON TABLE "HR"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
  GRANT SELECT ON "HR"."EMPLOYEES" TO "OE";
  GRANT REFERENCES ON "HR"."EMPLOYEES" TO "OE";
  GRANT SELECT ON "HR"."EMPLOYEES" TO "CURSOPL";
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "HR"."JOBS" 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."JOBS"."JOB_ID" IS 'Primary key of jobs table.';
   COMMENT ON COLUMN "HR"."JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
   COMMENT ON COLUMN "HR"."JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
   COMMENT ON COLUMN "HR"."JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
   COMMENT ON TABLE "HR"."JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
  GRANT SELECT ON "HR"."JOBS" TO "OE";
--------------------------------------------------------
--  DDL for Table JOB_GRADES
--------------------------------------------------------

  CREATE TABLE "HR"."JOB_GRADES" 
   (	"GRADE" CHAR(1 BYTE), 
	"LOWEST_SAL" NUMBER(8,2), 
	"HIGHEST_SAL" NUMBER(8,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "HR"."JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
   COMMENT ON TABLE "HR"."JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
  GRANT SELECT ON "HR"."JOB_HISTORY" TO "OE";
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "HR"."LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40 BYTE), 
	"POSTAL_CODE" VARCHAR2(12 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE_PROVINCE" VARCHAR2(25 BYTE), 
	"COUNTRY_ID" CHAR(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
   COMMENT ON COLUMN "HR"."LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
   COMMENT ON COLUMN "HR"."LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
   COMMENT ON COLUMN "HR"."LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
   COMMENT ON COLUMN "HR"."LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
   COMMENT ON COLUMN "HR"."LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
   COMMENT ON TABLE "HR"."LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
  GRANT SELECT ON "HR"."LOCATIONS" TO "OE";
  GRANT REFERENCES ON "HR"."LOCATIONS" TO "OE";
--------------------------------------------------------
--  DDL for Table LOG
--------------------------------------------------------

  CREATE TABLE "HR"."LOG" 
   (	"DATE_OF_ACTION" DATE, 
	"USER_ID" VARCHAR2(20 BYTE), 
	"PACKAGE_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MESSAGES
--------------------------------------------------------

  CREATE TABLE "HR"."MESSAGES" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"RESULTS" VARCHAR2(500 BYTE), 
	"CUANDO" TIMESTAMP (6) DEFAULT sysdate, 
	"KK" VARCHAR2(20 BYTE) DEFAULT 'valor'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "HR"."REGIONS" 
   (	"REGION_ID" NUMBER, 
	"REGION_NAME" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."REGIONS"."REGION_ID" IS 'Primary key of regions table.';
   COMMENT ON COLUMN "HR"."REGIONS"."REGION_NAME" IS 'Names of regions. Locations are in the countries of these regions.';
   COMMENT ON TABLE "HR"."REGIONS"  IS 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';
--------------------------------------------------------
--  DDL for Table TEMP
--------------------------------------------------------

  CREATE TABLE "HR"."TEMP" 
   (	"ID" NUMBER(6,0), 
	"MESSAGE" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View JEFES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."JEFES" ("EMPLOYEE_ID", "FIRST_NAME", "LAST_NAME", "EMAIL", "PHONE_NUMBER", "HIRE_DATE", "JOB_ID", "SALARY", "COMMISSION_PCT", "MANAGER_ID", "DEPARTMENT_ID") AS 
  SELECT DISTINCT m."EMPLOYEE_ID",m."FIRST_NAME",m."LAST_NAME",m."EMAIL",m."PHONE_NUMBER",m."HIRE_DATE",m."JOB_ID",m."SALARY",m."COMMISSION_PCT",m."MANAGER_ID",m."DEPARTMENT_ID"
FROM hr.employees w JOIN hr.employees m ON w.manager_id = m.employee_id
;
--------------------------------------------------------
--  DDL for View MALA
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."MALA" ("ID", "RESULTS", "CUANDO", "KK") AS 
  SELECT "ID","RESULTS","CUANDO","KK"   
FROM messages
;
REM INSERTING into HR.COUNTRIES
SET DEFINE OFF;
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina','2');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia','3');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil','2');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada','2');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CH','Switzerland','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China','3');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DK','Denmark','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt','4');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('FR','France','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IL','Israel','4');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IN','India','3');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IT','Italy','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('JP','Japan','3');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('KW','Kuwait','4');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ML','Malaysia','3');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('MX','Mexico','2');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria','4');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NL','Netherlands','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SG','Singapore','3');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('UK','United Kingdom','1');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('US','United States of America','2');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia','4');
Insert into HR.COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe','4');
REM INSERTING into HR.DEPARTMENTS
SET DEFINE OFF;
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('10','Administration','200','1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('20','Marketing','201','1800');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('30','Purchasing','114','1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('40','Human Resources','203','2400');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('50','Shipping','121','1500');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('60','IT','103','1400');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('70','Public Relations','204','2700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('80','Sales','145','2500');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('90','Executive','100','1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('100','Finance','108','1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('110','Accounting','205','1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('120','Treasury',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('130','Corporate Tax',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('140','Control And Credit',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('150','Shareholder Services',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('160','Benefits',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('170','Manufacturing',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('180','Construction',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('190','Contracting',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('200','Operations',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('210','IT Support',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('220','NOC',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('230','IT Helpdesk',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('240','Government Sales',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('250','Retail Sales',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('260','Recruiting',null,'1700');
Insert into HR.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('270','Payroll',null,'1700');
REM INSERTING into HR.EMP
SET DEFINE OFF;
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('100','Steven','King','SKING','515.123.4567',to_date('17/06/03','DD/MM/RR'),'AD_PRES','24000',null,null,'666');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('101','Neena','Kochhar','NKOCHHAR','515.123.4568',to_date('21/09/05','DD/MM/RR'),'AD_VP','17000',null,'100','90');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('102','Lex','De Haan','LDEHAAN','515.123.4569',to_date('13/01/01','DD/MM/RR'),'AD_VP','17000',null,'100','90');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('103','Alexander','Hunold','AHUNOLD','590.423.4567',to_date('03/01/06','DD/MM/RR'),'IT_PROG','9000',null,'102','60');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('104','Bruce','Ernst','BERNST','590.423.4568',to_date('21/05/07','DD/MM/RR'),'IT_PROG','6000',null,'103','60');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('105','David','Austin','DAUSTIN','590.423.4569',to_date('25/06/05','DD/MM/RR'),'IT_PROG','4800',null,'103','60');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('106','Valli','Pataballa','VPATABAL','590.423.4560',to_date('05/02/06','DD/MM/RR'),'IT_PROG','4800',null,'103','60');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('107','Diana','Lorentz','DLORENTZ','590.423.5567',to_date('07/02/07','DD/MM/RR'),'IT_PROG','4200',null,'103','60');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('108','Nancy','Greenberg','NGREENBE','515.124.4569',to_date('17/08/02','DD/MM/RR'),'FI_MGR','12008',null,'101','100');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('109','Daniel','Faviet','DFAVIET','515.124.4169',to_date('16/08/02','DD/MM/RR'),'FI_ACCOUNT','9000',null,'108','100');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('110','John','Chen','JCHEN','515.124.4269',to_date('28/09/05','DD/MM/RR'),'FI_ACCOUNT','8200',null,'108','100');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('111','Ismael','Sciarra','ISCIARRA','515.124.4369',to_date('30/09/05','DD/MM/RR'),'FI_ACCOUNT','7700',null,'108','100');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('112','Jose Manuel','Urman','JMURMAN','515.124.4469',to_date('07/03/06','DD/MM/RR'),'FI_ACCOUNT','7800',null,'108','100');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('113','Luis','Popp','LPOPP','515.124.4567',to_date('07/12/07','DD/MM/RR'),'FI_ACCOUNT','6900',null,'108','100');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('114','Den','Raphaely','DRAPHEAL','515.127.4561',to_date('07/12/02','DD/MM/RR'),'PU_MAN','11000',null,'100','30');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('115','Alexander','Khoo','AKHOO','515.127.4562',to_date('18/05/03','DD/MM/RR'),'PU_CLERK','3100',null,'114','30');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('116','Shelli','Baida','SBAIDA','515.127.4563',to_date('24/12/05','DD/MM/RR'),'PU_CLERK','2900',null,'114','30');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('117','Sigal','Tobias','STOBIAS','515.127.4564',to_date('24/07/05','DD/MM/RR'),'PU_CLERK','2800',null,'114','30');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('118','Guy','Himuro','GHIMURO','515.127.4565',to_date('15/11/06','DD/MM/RR'),'PU_CLERK','2600',null,'114','30');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('119','Karen','Colmenares','KCOLMENA','515.127.4566',to_date('10/08/07','DD/MM/RR'),'PU_CLERK','2500',null,'114','30');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('120','Matthew','Weiss','MWEISS','650.123.1234',to_date('18/07/04','DD/MM/RR'),'ST_MAN','8000',null,'100','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('121','Adam','Fripp','AFRIPP','650.123.2234',to_date('10/04/05','DD/MM/RR'),'ST_MAN','8200',null,'100','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('122','Payam','Kaufling','PKAUFLIN','650.123.3234',to_date('01/05/03','DD/MM/RR'),'ST_MAN','7900',null,'100','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('123','Shanta','Vollman','SVOLLMAN','650.123.4234',to_date('10/10/05','DD/MM/RR'),'ST_MAN','6500',null,'100','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('124','Kevin','Mourgos','KMOURGOS','650.123.5234',to_date('16/11/07','DD/MM/RR'),'ST_MAN','5800',null,'100','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('125','Julia','Nayer','JNAYER','650.124.1214',to_date('16/07/05','DD/MM/RR'),'ST_CLERK','3200',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('126','Irene','Mikkilineni','IMIKKILI','650.124.1224',to_date('28/09/06','DD/MM/RR'),'ST_CLERK','2700',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('127','James','Landry','JLANDRY','650.124.1334',to_date('14/01/07','DD/MM/RR'),'ST_CLERK','2400',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('128','Steven','Markle','SMARKLE','650.124.1434',to_date('08/03/08','DD/MM/RR'),'ST_CLERK','2200',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('129','Laura','Bissot','LBISSOT','650.124.5234',to_date('20/08/05','DD/MM/RR'),'ST_CLERK','3300',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('130','Mozhe','Atkinson','MATKINSO','650.124.6234',to_date('30/10/05','DD/MM/RR'),'ST_CLERK','2800',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('131','James','Marlow','JAMRLOW','650.124.7234',to_date('16/02/05','DD/MM/RR'),'ST_CLERK','2500',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('132','TJ','Olson','TJOLSON','650.124.8234',to_date('10/04/07','DD/MM/RR'),'ST_CLERK','2100',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('133','Jason','Mallin','JMALLIN','650.127.1934',to_date('14/06/04','DD/MM/RR'),'ST_CLERK','3300',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('134','Michael','Rogers','MROGERS','650.127.1834',to_date('26/08/06','DD/MM/RR'),'ST_CLERK','2900',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('135','Ki','Gee','KGEE','650.127.1734',to_date('12/12/07','DD/MM/RR'),'ST_CLERK','2400',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('136','Hazel','Philtanker','HPHILTAN','650.127.1634',to_date('06/02/08','DD/MM/RR'),'ST_CLERK','2200',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('137','Renske','Ladwig','RLADWIG','650.121.1234',to_date('14/07/03','DD/MM/RR'),'ST_CLERK','3600',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('138','Stephen','Stiles','SSTILES','650.121.2034',to_date('26/10/05','DD/MM/RR'),'ST_CLERK','3200',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('139','John','Seo','JSEO','650.121.2019',to_date('12/02/06','DD/MM/RR'),'ST_CLERK','2700',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('140','Joshua','Patel','JPATEL','650.121.1834',to_date('06/04/06','DD/MM/RR'),'ST_CLERK','2500',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('141','Trenna','Rajs','TRAJS','650.121.8009',to_date('17/10/03','DD/MM/RR'),'ST_CLERK','3500',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('142','Curtis','Davies','CDAVIES','650.121.2994',to_date('29/01/05','DD/MM/RR'),'ST_CLERK','3100',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('143','Randall','Matos','RMATOS','650.121.2874',to_date('15/03/06','DD/MM/RR'),'ST_CLERK','2600',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('144','Peter','Vargas','PVARGAS','650.121.2004',to_date('09/07/06','DD/MM/RR'),'ST_CLERK','2500',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('145','John','Russell','JRUSSEL','011.44.1344.429268',to_date('01/10/04','DD/MM/RR'),'SA_MAN','14000','0,4','100','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('146','Karen','Partners','KPARTNER','011.44.1344.467268',to_date('05/01/05','DD/MM/RR'),'SA_MAN','13500','0,3','100','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('147','Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',to_date('10/03/05','DD/MM/RR'),'SA_MAN','12000','0,3','100','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('148','Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',to_date('15/10/07','DD/MM/RR'),'SA_MAN','11000','0,3','100','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('149','Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_date('29/01/08','DD/MM/RR'),'SA_MAN','10500','0,2','100','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('150','Peter','Tucker','PTUCKER','011.44.1344.129268',to_date('30/01/05','DD/MM/RR'),'SA_REP','10000','0,3','145','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('151','David','Bernstein','DBERNSTE','011.44.1344.345268',to_date('24/03/05','DD/MM/RR'),'SA_REP','9500','0,25','145','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('152','Peter','Hall','PHALL','011.44.1344.478968',to_date('20/08/05','DD/MM/RR'),'SA_REP','9000','0,25','145','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('153','Christopher','Olsen','COLSEN','011.44.1344.498718',to_date('30/03/06','DD/MM/RR'),'SA_REP','8000','0,2','145','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('154','Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',to_date('09/12/06','DD/MM/RR'),'SA_REP','7500','0,2','145','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('155','Oliver','Tuvault','OTUVAULT','011.44.1344.486508',to_date('23/11/07','DD/MM/RR'),'SA_REP','7000','0,15','145','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('156','Janette','King','JKING','011.44.1345.429268',to_date('30/01/04','DD/MM/RR'),'SA_REP','10000','0,35','146','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('157','Patrick','Sully','PSULLY','011.44.1345.929268',to_date('04/03/04','DD/MM/RR'),'SA_REP','9500','0,35','146','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('158','Allan','McEwen','AMCEWEN','011.44.1345.829268',to_date('01/08/04','DD/MM/RR'),'SA_REP','9000','0,35','146','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('159','Lindsey','Smith','LSMITH','011.44.1345.729268',to_date('10/03/05','DD/MM/RR'),'SA_REP','8000','0,3','146','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('160','Louise','Doran','LDORAN','011.44.1345.629268',to_date('15/12/05','DD/MM/RR'),'SA_REP','7500','0,3','146','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('161','Sarath','Sewall','SSEWALL','011.44.1345.529268',to_date('03/11/06','DD/MM/RR'),'SA_REP','7000','0,25','146','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('162','Clara','Vishney','CVISHNEY','011.44.1346.129268',to_date('11/11/05','DD/MM/RR'),'SA_REP','10500','0,25','147','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('163','Danielle','Greene','DGREENE','011.44.1346.229268',to_date('19/03/07','DD/MM/RR'),'SA_REP','9500','0,15','147','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('164','Mattea','Marvins','MMARVINS','011.44.1346.329268',to_date('24/01/08','DD/MM/RR'),'SA_REP','7200','0,1','147','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('165','David','Lee','DLEE','011.44.1346.529268',to_date('23/02/08','DD/MM/RR'),'SA_REP','6800','0,1','147','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('166','Sundar','Ande','SANDE','011.44.1346.629268',to_date('24/03/08','DD/MM/RR'),'SA_REP','6400','0,1','147','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('167','Amit','Banda','ABANDA','011.44.1346.729268',to_date('21/04/08','DD/MM/RR'),'SA_REP','6200','0,1','147','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('168','Lisa','Ozer','LOZER','011.44.1343.929268',to_date('11/03/05','DD/MM/RR'),'SA_REP','11500','0,25','148','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('169','Harrison','Bloom','HBLOOM','011.44.1343.829268',to_date('23/03/06','DD/MM/RR'),'SA_REP','10000','0,2','148','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('170','Tayler','Fox','TFOX','011.44.1343.729268',to_date('24/01/06','DD/MM/RR'),'SA_REP','9600','0,2','148','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('171','William','Smith','WSMITH','011.44.1343.629268',to_date('23/02/07','DD/MM/RR'),'SA_REP','7400','0,15','148','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('172','Elizabeth','Bates','EBATES','011.44.1343.529268',to_date('24/03/07','DD/MM/RR'),'SA_REP','7300','0,15','148','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('173','Sundita','Kumar','SKUMAR','011.44.1343.329268',to_date('21/04/08','DD/MM/RR'),'SA_REP','6100','0,1','148','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('174','Ellen','Abel','EABEL','011.44.1644.429267',to_date('11/05/04','DD/MM/RR'),'SA_REP','11000','0,3','149','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('175','Alyssa','Hutton','AHUTTON','011.44.1644.429266',to_date('19/03/05','DD/MM/RR'),'SA_REP','8800','0,25','149','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('176','Jonathon','Taylor','JTAYLOR','011.44.1644.429265',to_date('24/03/06','DD/MM/RR'),'SA_REP','8600','0,2','149','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('177','Jack','Livingston','JLIVINGS','011.44.1644.429264',to_date('23/04/06','DD/MM/RR'),'SA_REP','8400','0,2','149','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('178','Kimberely','Grant','KGRANT','011.44.1644.429263',to_date('24/05/07','DD/MM/RR'),'SA_REP','7000','0,15','149',null);
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('179','Charles','Johnson','CJOHNSON','011.44.1644.429262',to_date('04/01/08','DD/MM/RR'),'SA_REP','6200','0,1','149','80');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('180','Winston','Taylor','WTAYLOR','650.507.9876',to_date('24/01/06','DD/MM/RR'),'SH_CLERK','3200',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('181','Jean','Fleaur','JFLEAUR','650.507.9877',to_date('23/02/06','DD/MM/RR'),'SH_CLERK','3100',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('182','Martha','Sullivan','MSULLIVA','650.507.9878',to_date('21/06/07','DD/MM/RR'),'SH_CLERK','2500',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('183','Girard','Geoni','GGEONI','650.507.9879',to_date('03/02/08','DD/MM/RR'),'SH_CLERK','2800',null,'120','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('184','Nandita','Sarchand','NSARCHAN','650.509.1876',to_date('27/01/04','DD/MM/RR'),'SH_CLERK','4200',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('185','Alexis','Bull','ABULL','650.509.2876',to_date('20/02/05','DD/MM/RR'),'SH_CLERK','4100',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('186','Julia','Dellinger','JDELLING','650.509.3876',to_date('24/06/06','DD/MM/RR'),'SH_CLERK','3400',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('187','Anthony','Cabrio','ACABRIO','650.509.4876',to_date('07/02/07','DD/MM/RR'),'SH_CLERK','3000',null,'121','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('188','Kelly','Chung','KCHUNG','650.505.1876',to_date('14/06/05','DD/MM/RR'),'SH_CLERK','3800',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('189','Jennifer','Dilly','JDILLY','650.505.2876',to_date('13/08/05','DD/MM/RR'),'SH_CLERK','3600',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('190','Timothy','Gates','TGATES','650.505.3876',to_date('11/07/06','DD/MM/RR'),'SH_CLERK','2900',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('191','Randall','Perkins','RPERKINS','650.505.4876',to_date('19/12/07','DD/MM/RR'),'SH_CLERK','2500',null,'122','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('192','Sarah','Bell','SBELL','650.501.1876',to_date('04/02/04','DD/MM/RR'),'SH_CLERK','4000',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('193','Britney','Everett','BEVERETT','650.501.2876',to_date('03/03/05','DD/MM/RR'),'SH_CLERK','3900',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('194','Samuel','McCain','SMCCAIN','650.501.3876',to_date('01/07/06','DD/MM/RR'),'SH_CLERK','3200',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('195','Vance','Jones','VJONES','650.501.4876',to_date('17/03/07','DD/MM/RR'),'SH_CLERK','2800',null,'123','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('196','Alana','Walsh','AWALSH','650.507.9811',to_date('24/04/06','DD/MM/RR'),'SH_CLERK','3100',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('197','Kevin','Feeney','KFEENEY','650.507.9822',to_date('23/05/06','DD/MM/RR'),'SH_CLERK','3000',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('198','Donald','OConnell','DOCONNEL','650.507.9833',to_date('21/06/07','DD/MM/RR'),'SH_CLERK','2600',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('199','Douglas','Grant','DGRANT','650.507.9844',to_date('13/01/08','DD/MM/RR'),'SH_CLERK','2600',null,'124','50');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('200','Jennifer','Whalen','JWHALEN','515.123.4444',to_date('17/09/03','DD/MM/RR'),'AD_ASST','4400',null,'101','10');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('201','Michael','Hartstein','MHARTSTE','515.123.5555',to_date('17/02/04','DD/MM/RR'),'MK_MAN','13000',null,'100','20');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('202','Pat','Fay','PFAY','603.123.6666',to_date('17/08/05','DD/MM/RR'),'MK_REP','6000',null,'201','20');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('203','Susan','Mavris','SMAVRIS','515.123.7777',to_date('07/06/02','DD/MM/RR'),'HR_REP','6500',null,'101','40');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('204','Hermann','Baer','HBAER','515.123.8888',to_date('07/06/02','DD/MM/RR'),'PR_REP','10000',null,'101','70');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('205','Shelley','Higgins','SHIGGINS','515.123.8080',to_date('07/06/02','DD/MM/RR'),'AC_MGR','12008',null,'101','110');
Insert into HR.EMP (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('206','William','Gietz','WGIETZ','515.123.8181',to_date('07/06/02','DD/MM/RR'),'AC_ACCOUNT','8300',null,'205','110');
REM INSERTING into HR.EMPLEADOS
SET DEFINE OFF;
Insert into HR.EMPLEADOS (ID_EMPLEADO,NOMBRE,APELLIDOS,SALARIO,ACTIVO,FINICIO,FFIN,ID_DEPARTAMENTO,EMPLEADO) values ('1','Lex','De Haan','1080','V',to_date('27/01/23','DD/MM/RR'),null,'90','Lex De Haan');
Insert into HR.EMPLEADOS (ID_EMPLEADO,NOMBRE,APELLIDOS,SALARIO,ACTIVO,FINICIO,FFIN,ID_DEPARTAMENTO,EMPLEADO) values ('2','Nancy','Greenberg','1080','V',to_date('27/01/23','DD/MM/RR'),null,'100','Nancy Greenberg');
Insert into HR.EMPLEADOS (ID_EMPLEADO,NOMBRE,APELLIDOS,SALARIO,ACTIVO,FINICIO,FFIN,ID_DEPARTAMENTO,EMPLEADO) values ('3','Daniel','Faviet','1080','V',to_date('27/01/23','DD/MM/RR'),null,'100','Daniel Faviet');
Insert into HR.EMPLEADOS (ID_EMPLEADO,NOMBRE,APELLIDOS,SALARIO,ACTIVO,FINICIO,FFIN,ID_DEPARTAMENTO,EMPLEADO) values ('4','Den','Raphaely','1080','V',to_date('27/01/23','DD/MM/RR'),null,'30','Den Raphaely');
Insert into HR.EMPLEADOS (ID_EMPLEADO,NOMBRE,APELLIDOS,SALARIO,ACTIVO,FINICIO,FFIN,ID_DEPARTAMENTO,EMPLEADO) values ('5','Susan','Mavris','1080','V',to_date('27/01/23','DD/MM/RR'),null,'40','Susan Mavris');
Insert into HR.EMPLEADOS (ID_EMPLEADO,NOMBRE,APELLIDOS,SALARIO,ACTIVO,FINICIO,FFIN,ID_DEPARTAMENTO,EMPLEADO) values ('6','Hermann','Baer','1080','V',to_date('27/01/23','DD/MM/RR'),null,'70','Hermann Baer');
REM INSERTING into HR.EMPLOYEES
SET DEFINE OFF;
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('100','Steven','King','SKING','515.123.4567',to_date('17/06/03','DD/MM/RR'),'AD_PRES','24000',null,null,'90');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('101','Neena','Kochhar','NKOCHHAR','515.123.4568',to_date('21/09/05','DD/MM/RR'),'AD_VP','17000',null,'100','90');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('102','Lex','De Haan','LDEHAAN','515.123.4569',to_date('13/01/01','DD/MM/RR'),'AD_VP','17000',null,'100','90');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('103','Alexander','Hunold','AHUNOLD','590.423.4567',to_date('03/01/06','DD/MM/RR'),'IT_PROG','9000',null,'102','60');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('104','Bruce','Ernst','BERNST','590.423.4568',to_date('21/05/07','DD/MM/RR'),'IT_PROG','6000',null,'103','60');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('105','David','Austin','DAUSTIN','590.423.4569',to_date('25/06/05','DD/MM/RR'),'IT_PROG','4800',null,'103','60');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('106','Valli','Pataballa','VPATABAL','590.423.4560',to_date('05/02/06','DD/MM/RR'),'IT_PROG','4800',null,'103','60');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('107','Diana','Lorentz','DLORENTZ','590.423.5567',to_date('07/02/07','DD/MM/RR'),'IT_PROG','4200',null,'103','60');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('108','Nancy','Greenberg','NGREENBE','515.124.4569',to_date('17/08/02','DD/MM/RR'),'FI_MGR','12008',null,'101','100');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('109','Daniel','Faviet','DFAVIET','515.124.4169',to_date('16/08/02','DD/MM/RR'),'FI_ACCOUNT','9000',null,'108','100');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('110','John','Chen','JCHEN','515.124.4269',to_date('28/09/05','DD/MM/RR'),'FI_ACCOUNT','8200',null,'108','100');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('111','Ismael','Sciarra','ISCIARRA','515.124.4369',to_date('30/09/05','DD/MM/RR'),'FI_ACCOUNT','7700',null,'108','100');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('112','Jose Manuel','Urman','JMURMAN','515.124.4469',to_date('07/03/06','DD/MM/RR'),'FI_ACCOUNT','7800',null,'108','100');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('113','Luis','Popp','LPOPP','515.124.4567',to_date('07/12/07','DD/MM/RR'),'FI_ACCOUNT','6900',null,'108','100');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('114','Den','Raphaely','DRAPHEAL','515.127.4561',to_date('07/12/02','DD/MM/RR'),'PU_MAN','11000',null,'100','30');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('115','Alexander','Khoo','AKHOO','515.127.4562',to_date('18/05/03','DD/MM/RR'),'PU_CLERK','3100',null,'114','30');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('116','Shelli','Baida','SBAIDA','515.127.4563',to_date('24/12/05','DD/MM/RR'),'PU_CLERK','2900',null,'114','30');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('117','Sigal','Tobias','STOBIAS','515.127.4564',to_date('24/07/05','DD/MM/RR'),'PU_CLERK','2800',null,'114','30');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('118','Guy','Himuro','GHIMURO','515.127.4565',to_date('15/11/06','DD/MM/RR'),'PU_CLERK','2600',null,'114','30');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('119','Karen','Colmenares','KCOLMENA','515.127.4566',to_date('10/08/07','DD/MM/RR'),'PU_CLERK','2500',null,'114','30');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('120','Matthew','Weiss','MWEISS','650.123.1234',to_date('18/07/04','DD/MM/RR'),'ST_MAN','8000',null,'100','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('121','Adam','Fripp','AFRIPP','650.123.2234',to_date('10/04/05','DD/MM/RR'),'ST_MAN','8200',null,'100','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('122','Payam','Kaufling','PKAUFLIN','650.123.3234',to_date('01/05/03','DD/MM/RR'),'ST_MAN','7900',null,'100','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('123','Shanta','Vollman','SVOLLMAN','650.123.4234',to_date('10/10/05','DD/MM/RR'),'ST_MAN','6500',null,'100','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('124','Kevin','Mourgos','KMOURGOS','650.123.5234',to_date('16/11/07','DD/MM/RR'),'ST_MAN','5800',null,'100','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('125','Julia','Nayer','JNAYER','650.124.1214',to_date('16/07/05','DD/MM/RR'),'ST_CLERK','3200',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('126','Irene','Mikkilineni','IMIKKILI','650.124.1224',to_date('28/09/06','DD/MM/RR'),'ST_CLERK','2700',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('127','James','Landry','JLANDRY','650.124.1334',to_date('14/01/07','DD/MM/RR'),'ST_CLERK','2400',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('128','Steven','Markle','SMARKLE','650.124.1434',to_date('08/03/08','DD/MM/RR'),'ST_CLERK','2200',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('129','Laura','Bissot','LBISSOT','650.124.5234',to_date('20/08/05','DD/MM/RR'),'ST_CLERK','3300',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('130','Mozhe','Atkinson','MATKINSO','650.124.6234',to_date('30/10/05','DD/MM/RR'),'ST_CLERK','2800',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('131','James','Marlow','JAMRLOW','650.124.7234',to_date('16/02/05','DD/MM/RR'),'ST_CLERK','2500',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('132','TJ','Olson','TJOLSON','650.124.8234',to_date('10/04/07','DD/MM/RR'),'ST_CLERK','2100',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('133','Jason','Mallin','JMALLIN','650.127.1934',to_date('14/06/04','DD/MM/RR'),'ST_CLERK','3300',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('134','Michael','Rogers','MROGERS','650.127.1834',to_date('26/08/06','DD/MM/RR'),'ST_CLERK','2900',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('135','Ki','Gee','KGEE','650.127.1734',to_date('12/12/07','DD/MM/RR'),'ST_CLERK','2400',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('136','Hazel','Philtanker','HPHILTAN','650.127.1634',to_date('06/02/08','DD/MM/RR'),'ST_CLERK','2200',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('137','Renske','Ladwig','RLADWIG','650.121.1234',to_date('14/07/03','DD/MM/RR'),'ST_CLERK','3600',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('138','Stephen','Stiles','SSTILES','650.121.2034',to_date('26/10/05','DD/MM/RR'),'ST_CLERK','3200',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('139','John','Seo','JSEO','650.121.2019',to_date('12/02/06','DD/MM/RR'),'ST_CLERK','2700',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('140','Joshua','Patel','JPATEL','650.121.1834',to_date('06/04/06','DD/MM/RR'),'ST_CLERK','2500',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('141','Trenna','Rajs','TRAJS','650.121.8009',to_date('17/10/03','DD/MM/RR'),'ST_CLERK','3500',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('142','Curtis','Davies','CDAVIES','650.121.2994',to_date('29/01/05','DD/MM/RR'),'ST_CLERK','3100',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('143','Randall','Matos','RMATOS','650.121.2874',to_date('15/03/06','DD/MM/RR'),'ST_CLERK','2600',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('144','Peter','Vargas','PVARGAS','650.121.2004',to_date('09/07/06','DD/MM/RR'),'ST_CLERK','2500',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('145','John','Russell','JRUSSEL','011.44.1344.429268',to_date('01/10/04','DD/MM/RR'),'SA_MAN','14000','0,4','100','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('146','Karen','Partners','KPARTNER','011.44.1344.467268',to_date('05/01/05','DD/MM/RR'),'SA_MAN','13500','0,3','100','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('147','Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',to_date('10/03/05','DD/MM/RR'),'SA_MAN','12000','0,3','100','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('148','Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',to_date('15/10/07','DD/MM/RR'),'SA_MAN','11000','0,3','100','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('149','Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_date('29/01/08','DD/MM/RR'),'SA_MAN','10500','0,2','100','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('150','Peter','Tucker','PTUCKER','011.44.1344.129268',to_date('30/01/05','DD/MM/RR'),'SA_REP','10000','0,3','145','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('151','David','Bernstein','DBERNSTE','011.44.1344.345268',to_date('24/03/05','DD/MM/RR'),'SA_REP','9500','0,25','145','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('152','Peter','Hall','PHALL','011.44.1344.478968',to_date('20/08/05','DD/MM/RR'),'SA_REP','9000','0,25','145','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('153','Christopher','Olsen','COLSEN','011.44.1344.498718',to_date('30/03/06','DD/MM/RR'),'SA_REP','8000','0,2','145','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('154','Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',to_date('09/12/06','DD/MM/RR'),'SA_REP','7500','0,2','145','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('155','Oliver','Tuvault','OTUVAULT','011.44.1344.486508',to_date('23/11/07','DD/MM/RR'),'SA_REP','7000','0,15','145','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('156','Janette','King','JKING','011.44.1345.429268',to_date('30/01/04','DD/MM/RR'),'SA_REP','10000','0,35','146','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('157','Patrick','Sully','PSULLY','011.44.1345.929268',to_date('04/03/04','DD/MM/RR'),'SA_REP','9500','0,35','146','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('158','Allan','McEwen','AMCEWEN','011.44.1345.829268',to_date('01/08/04','DD/MM/RR'),'SA_REP','9000','0,35','146','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('159','Lindsey','Smith','LSMITH','011.44.1345.729268',to_date('10/03/05','DD/MM/RR'),'SA_REP','8000','0,3','146','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('160','Louise','Doran','LDORAN','011.44.1345.629268',to_date('15/12/05','DD/MM/RR'),'SA_REP','7500','0,3','146','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('161','Sarath','Sewall','SSEWALL','011.44.1345.529268',to_date('03/11/06','DD/MM/RR'),'SA_REP','7000','0,25','146','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('162','Clara','Vishney','CVISHNEY','011.44.1346.129268',to_date('11/11/05','DD/MM/RR'),'SA_REP','10500','0,25','147','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('163','Danielle','Greene','DGREENE','011.44.1346.229268',to_date('19/03/07','DD/MM/RR'),'SA_REP','9500','0,15','147','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('164','Mattea','Marvins','MMARVINS','011.44.1346.329268',to_date('24/01/08','DD/MM/RR'),'SA_REP','7200','0,1','147','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('165','David','Lee','DLEE','011.44.1346.529268',to_date('23/02/08','DD/MM/RR'),'SA_REP','6800','0,1','147','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('166','Sundar','Ande','SANDE','011.44.1346.629268',to_date('24/03/08','DD/MM/RR'),'SA_REP','6400','0,1','147','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('167','Amit','Banda','ABANDA','011.44.1346.729268',to_date('21/04/08','DD/MM/RR'),'SA_REP','6200','0,1','147','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('168','Lisa','Ozer','LOZER','011.44.1343.929268',to_date('11/03/05','DD/MM/RR'),'SA_REP','11500','0,25','148','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('169','Harrison','Bloom','HBLOOM','011.44.1343.829268',to_date('23/03/06','DD/MM/RR'),'SA_REP','10000','0,2','148','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('170','Tayler','Fox','TFOX','011.44.1343.729268',to_date('24/01/06','DD/MM/RR'),'SA_REP','9600','0,2','148','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('171','William','Smith','WSMITH','011.44.1343.629268',to_date('23/02/07','DD/MM/RR'),'SA_REP','7400','0,15','148','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('172','Elizabeth','Bates','EBATES','011.44.1343.529268',to_date('24/03/07','DD/MM/RR'),'SA_REP','7300','0,15','148','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('173','Sundita','Kumar','SKUMAR','011.44.1343.329268',to_date('21/04/08','DD/MM/RR'),'SA_REP','6100','0,1','148','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('174','Ellen','Abel','EABEL','011.44.1644.429267',to_date('11/05/04','DD/MM/RR'),'SA_REP','11000','0,3','149','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('175','Alyssa','Hutton','AHUTTON','011.44.1644.429266',to_date('19/03/05','DD/MM/RR'),'SA_REP','8800','0,25','149','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('176','Jonathon','Taylor','JTAYLOR','011.44.1644.429265',to_date('24/03/06','DD/MM/RR'),'SA_REP','8600','0,2','149','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('177','Jack','Livingston','JLIVINGS','011.44.1644.429264',to_date('23/04/06','DD/MM/RR'),'SA_REP','8400','0,2','149','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('178','Kimberely','Grant','KGRANT','011.44.1644.429263',to_date('24/05/07','DD/MM/RR'),'SA_REP','7000','0,15','149',null);
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('179','Charles','Johnson','CJOHNSON','011.44.1644.429262',to_date('04/01/08','DD/MM/RR'),'SA_REP','6200','0,1','149','80');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('180','Winston','Taylor','WTAYLOR','650.507.9876',to_date('24/01/06','DD/MM/RR'),'SH_CLERK','3200',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('181','Jean','Fleaur','JFLEAUR','650.507.9877',to_date('23/02/06','DD/MM/RR'),'SH_CLERK','3100',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('182','Martha','Sullivan','MSULLIVA','650.507.9878',to_date('21/06/07','DD/MM/RR'),'SH_CLERK','2500',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('183','Girard','Geoni','GGEONI','650.507.9879',to_date('03/02/08','DD/MM/RR'),'SH_CLERK','2800',null,'120','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('184','Nandita','Sarchand','NSARCHAN','650.509.1876',to_date('27/01/04','DD/MM/RR'),'SH_CLERK','4200',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('185','Alexis','Bull','ABULL','650.509.2876',to_date('20/02/05','DD/MM/RR'),'SH_CLERK','4100',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('186','Julia','Dellinger','JDELLING','650.509.3876',to_date('24/06/06','DD/MM/RR'),'SH_CLERK','3400',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('187','Anthony','Cabrio','ACABRIO','650.509.4876',to_date('07/02/07','DD/MM/RR'),'SH_CLERK','3000',null,'121','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('188','Kelly','Chung','KCHUNG','650.505.1876',to_date('14/06/05','DD/MM/RR'),'SH_CLERK','3800',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('189','Jennifer','Dilly','JDILLY','650.505.2876',to_date('13/08/05','DD/MM/RR'),'SH_CLERK','3600',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('190','Timothy','Gates','TGATES','650.505.3876',to_date('11/07/06','DD/MM/RR'),'SH_CLERK','2900',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('191','Randall','Perkins','RPERKINS','650.505.4876',to_date('19/12/07','DD/MM/RR'),'SH_CLERK','2500',null,'122','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('192','Sarah','Bell','SBELL','650.501.1876',to_date('04/02/04','DD/MM/RR'),'SH_CLERK','4000',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('193','Britney','Everett','BEVERETT','650.501.2876',to_date('03/03/05','DD/MM/RR'),'SH_CLERK','3900',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('194','Samuel','McCain','SMCCAIN','650.501.3876',to_date('01/07/06','DD/MM/RR'),'SH_CLERK','3200',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('195','Vance','Jones','VJONES','650.501.4876',to_date('17/03/07','DD/MM/RR'),'SH_CLERK','2800',null,'123','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('196','Alana','Walsh','AWALSH','650.507.9811',to_date('24/04/06','DD/MM/RR'),'SH_CLERK','3100',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('197','Kevin','Feeney','KFEENEY','650.507.9822',to_date('23/05/06','DD/MM/RR'),'SH_CLERK','3000',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('198','Donald','OConnell','DOCONNEL','650.507.9833',to_date('21/06/07','DD/MM/RR'),'SH_CLERK','2600',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('199','Douglas','Grant','DGRANT','650.507.9844',to_date('13/01/08','DD/MM/RR'),'SH_CLERK','2600',null,'124','50');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('200','Jennifer','Whalen','JWHALEN','515.123.4444',to_date('17/09/03','DD/MM/RR'),'AD_ASST','4400',null,'101','10');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('201','Michael','Hartstein','MHARTSTE','515.123.5555',to_date('17/02/04','DD/MM/RR'),'MK_MAN','13000',null,'100','20');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('202','Pat','Fay','PFAY','603.123.6666',to_date('17/08/05','DD/MM/RR'),'MK_REP','6000',null,'201','20');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('203','Susan','Mavris','SMAVRIS','515.123.7777',to_date('07/06/02','DD/MM/RR'),'HR_REP','6500',null,'101','40');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('204','Hermann','Baer','HBAER','515.123.8888',to_date('07/06/02','DD/MM/RR'),'PR_REP','10000',null,'101','70');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('205','Shelley','Higgins','SHIGGINS','515.123.8080',to_date('07/06/02','DD/MM/RR'),'AC_MGR','12008',null,'101','110');
Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('206','William','Gietz','WGIETZ','515.123.8181',to_date('07/06/02','DD/MM/RR'),'AC_ACCOUNT','8300',null,'205','110');
REM INSERTING into HR.JOBS
SET DEFINE OFF;
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President','20080','40000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President','15000','30000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant','3000','6000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager','8200','16000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant','4200','9000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager','8200','16000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant','4200','9000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager','10000','20080');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative','6000','12008');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager','8000','15000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk','2500','5500');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager','5500','8500');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk','2008','5000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk','2500','5500');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer','4000','10000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager','9000','15000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative','4000','9000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative','4000','9000');
Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative','4500','10500');
REM INSERTING into HR.JOB_GRADES
SET DEFINE OFF;
Insert into HR.JOB_GRADES (GRADE,LOWEST_SAL,HIGHEST_SAL) values ('A','1000','2999');
Insert into HR.JOB_GRADES (GRADE,LOWEST_SAL,HIGHEST_SAL) values ('B','3000','5999');
Insert into HR.JOB_GRADES (GRADE,LOWEST_SAL,HIGHEST_SAL) values ('C','6000','9999');
Insert into HR.JOB_GRADES (GRADE,LOWEST_SAL,HIGHEST_SAL) values ('D','10000','14999');
Insert into HR.JOB_GRADES (GRADE,LOWEST_SAL,HIGHEST_SAL) values ('E','15000','24999');
Insert into HR.JOB_GRADES (GRADE,LOWEST_SAL,HIGHEST_SAL) values ('F','25000','40000');
REM INSERTING into HR.JOB_HISTORY
SET DEFINE OFF;
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('102',to_date('13/01/01','DD/MM/RR'),to_date('24/07/06','DD/MM/RR'),'IT_PROG','60');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('101',to_date('21/09/97','DD/MM/RR'),to_date('27/10/01','DD/MM/RR'),'AC_ACCOUNT','110');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('101',to_date('28/10/01','DD/MM/RR'),to_date('15/03/05','DD/MM/RR'),'AC_MGR','110');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('201',to_date('17/02/04','DD/MM/RR'),to_date('19/12/07','DD/MM/RR'),'MK_REP','20');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('114',to_date('24/03/06','DD/MM/RR'),to_date('31/12/07','DD/MM/RR'),'ST_CLERK','50');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('122',to_date('01/01/07','DD/MM/RR'),to_date('31/12/07','DD/MM/RR'),'ST_CLERK','50');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('200',to_date('17/09/95','DD/MM/RR'),to_date('17/06/01','DD/MM/RR'),'AD_ASST','90');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('176',to_date('24/03/06','DD/MM/RR'),to_date('31/12/06','DD/MM/RR'),'SA_REP','80');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('176',to_date('01/01/07','DD/MM/RR'),to_date('31/12/07','DD/MM/RR'),'SA_MAN','80');
Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('200',to_date('01/07/02','DD/MM/RR'),to_date('31/12/06','DD/MM/RR'),'AC_ACCOUNT','90');
REM INSERTING into HR.LOCATIONS
SET DEFINE OFF;
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1000','1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1100','93091 Calle della Testa','10934','Venice',null,'IT');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1200','2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1300','9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1400','2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1500','2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1600','2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1700','2004 Charade Rd','98199','Seattle','Washington','US');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1800','147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1900','6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2000','40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2100','1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2200','12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2300','198 Clementi North','540198','Singapore',null,'SG');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2400','8204 Arthur St',null,'London',null,'UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2500','Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2600','9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2700','Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2800','Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2900','20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3000','Murtenstrasse 921','3095','Bern','BE','CH');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3100','Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into HR.LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3200','Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
REM INSERTING into HR.LOG
SET DEFINE OFF;
REM INSERTING into HR.MESSAGES
SET DEFINE OFF;
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('74','Cuenta: 1',to_timestamp('07/02/23 12:08:16,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('25','1',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('26','2',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('27','3',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('28','4',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('29','5',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('30','7',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('31','9',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('32','10',to_timestamp('01/02/23 17:59:07,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('96','SI O SI antes de add_job',to_timestamp('07/02/23 18:49:43,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('88','SI O SI antes de add_job',to_timestamp('07/02/23 18:41:36,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
Insert into HR.MESSAGES (ID,RESULTS,CUANDO,KK) values ('73','ERROR: -20202 >>>> ORA-20202: This is not a valid manager',to_timestamp('06/02/23 17:02:51,000000000','DD/MM/RR HH24:MI:SSXFF'),'defecto');
REM INSERTING into HR.REGIONS
SET DEFINE OFF;
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values ('1','Europe');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values ('2','Americas');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values ('3','Asia');
Insert into HR.REGIONS (REGION_ID,REGION_NAME) values ('4','Middle East and Africa');
REM INSERTING into HR.TEMP
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."COUNTRY_C_ID_PK" ON "HR"."COUNTRIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPT_ID_PK" ON "HR"."DEPARTMENTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPLEADOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPLEADOS_PK" ON "HR"."EMPLEADOS" ("ID_EMPLEADO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPLEADOS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPLEADOS_UK1" ON "HR"."EMPLEADOS" ("NOMBRE", "APELLIDOS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMAIL_UK" ON "HR"."EMPLOYEES" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMP_ID_PK" ON "HR"."EMPLOYEES" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JHIST_EMP_ID_ST_DATE_PK" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOBGRADES_GRADE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JOBGRADES_GRADE_PK" ON "HR"."JOB_GRADES" ("GRADE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JOB_ID_PK" ON "HR"."JOBS" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."LOC_ID_PK" ON "HR"."LOCATIONS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MESSAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."MESSAGES_PK" ON "HR"."MESSAGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."REG_ID_PK" ON "HR"."REGIONS" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TEMP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."TEMP_PK" ON "HR"."TEMP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_JOB_IX" ON "HR"."JOB_HISTORY" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_EMPLOYEE_IX" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_CITY_IX" ON "HR"."LOCATIONS" ("CITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_COUNTRY_IX" ON "HR"."LOCATIONS" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_JOB_IX" ON "HR"."EMPLOYEES" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "HR"."DEPT_LOCATION_IX" ON "HR"."DEPARTMENTS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_STATE_PROVINCE_IX" ON "HR"."LOCATIONS" ("STATE_PROVINCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_DEPARTMENT_IX" ON "HR"."JOB_HISTORY" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_MANAGER_IX" ON "HR"."EMPLOYEES" ("MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_NAME_IX" ON "HR"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_DEPARTMENT_IX" ON "HR"."EMPLOYEES" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPLEADOS_INDEX_FECHAS
--------------------------------------------------------

  CREATE INDEX "HR"."EMPLEADOS_INDEX_FECHAS" ON "HR"."EMPLEADOS" ("FINICIO" DESC, "FFIN" DESC) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger EMPLEADOS_ANTES_ROW
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."EMPLEADOS_ANTES_ROW" 
BEFORE DELETE OR INSERT OR UPDATE ON HR.EMPLEADOS 
FOR EACH ROW 
BEGIN
    IF inserting THEN
        dbms_output.put_line('EMPLEADOS_ANTES_ROW INSERTING: ' || :new.EMPLEADO);
        :new.NOMBRE := upper(:new.NOMBRE);
        :new.apellidos := upper(:new.apellidos);
    ELSIF updating THEN
        dbms_output.put_line('EMPLEADOS_ANTES_ROW UPDATING: ' || :new.id_empleado);
    ELSE
        dbms_output.put_line('EMPLEADOS_ANTES_ROW DELETING: ' || :old.id_empleado);
        if :old.activo = 'V' then
        RAISE_APPLICATION_ERROR(-20666, 'Invalid data: No se pueden borrar empleados activos.');
        end if;
    END IF;
END;
/
ALTER TRIGGER "HR"."EMPLEADOS_ANTES_ROW" DISABLE;
--------------------------------------------------------
--  DDL for Trigger EMPLEADOS_ANTES_STMT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."EMPLEADOS_ANTES_STMT" BEFORE
    DELETE OR INSERT OR UPDATE ON hr.empleados
BEGIN
    IF inserting THEN
        dbms_output.put_line('EMPLEADOS_ANTES_STMT INSERTING');
    ELSIF updating THEN
        dbms_output.put_line('EMPLEADOS_ANTES_STMT UPDATING');
    ELSE
        dbms_output.put_line('EMPLEADOS_ANTES_STMT DELETING');
    END IF;
END;
/
ALTER TRIGGER "HR"."EMPLEADOS_ANTES_STMT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EMPLEADOS_COMPUESTO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."EMPLEADOS_COMPUESTO" 
FOR DELETE ON EMPLEADOS
COMPOUND TRIGGER
    cont PLS_INTEGER;
BEFORE STATEMENT IS
    BEGIN
      cont:=0;
    END BEFORE STATEMENT;
AFTER EACH ROW IS
    BEGIN
      cont:=cont+1;
    END AFTER EACH ROW;
AFTER STATEMENT IS
    BEGIN
      if cont > 1 then
        raise TOO_MANY_ROWS;
      end if;
    END AFTER STATEMENT;
END;
/
ALTER TRIGGER "HR"."EMPLEADOS_COMPUESTO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EMPLEADOS_DESPUES_ROW
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."EMPLEADOS_DESPUES_ROW" 
AFTER DELETE OR INSERT OR UPDATE ON HR.EMPLEADOS 
REFERENCING OLD AS original NEW as actual
FOR EACH ROW 
BEGIN
    IF inserting THEN
        dbms_output.put_line('EMPLEADOS_DESPUES_ROW INSERTING: ' || :actual.id_empleado);
    ELSIF updating THEN
        dbms_output.put_line('EMPLEADOS_DESPUES_ROW UPDATING: ' || :actual.id_empleado);
    ELSE
        dbms_output.put_line('EMPLEADOS_DESPUES_ROW DELETING: ' || :original.id_empleado);
    END IF;
END;
/
ALTER TRIGGER "HR"."EMPLEADOS_DESPUES_ROW" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EMPLEADOS_DESPUES_STMT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."EMPLEADOS_DESPUES_STMT" 
AFTER
    DELETE OR INSERT OR UPDATE ON hr.empleados
BEGIN
    IF inserting THEN
        dbms_output.put_line('EMPLEADOS_DESPUES_STMT INSERTING');
    ELSIF updating THEN
        dbms_output.put_line('EMPLEADOS_DESPUES_STMT UPDATING');
    ELSE
        dbms_output.put_line('EMPLEADOS_DESPUES_STMT DELETING');
    END IF;
END;
/
ALTER TRIGGER "HR"."EMPLEADOS_DESPUES_STMT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EMPLEADOS_INTOCABLES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."EMPLEADOS_INTOCABLES" 
BEFORE DELETE OR UPDATE ON HR.EMPLEADOS 
FOR EACH ROW 
 WHEN (1 in (new.id_empleado, old.id_empleado)) BEGIN
    RAISE_APPLICATION_ERROR (-20069, 'Intocable');
END;
/
ALTER TRIGGER "HR"."EMPLEADOS_INTOCABLES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EMPLEADOS_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."EMPLEADOS_TRG" 
BEFORE INSERT ON EMPLEADOS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID_EMPLEADO IS NULL THEN
      --SELECT EMPLEADOS_SEQ.NEXTVAL INTO :NEW.ID_EMPLEADO FROM SYS.DUAL;
      :NEW.ID_EMPLEADO := EMPLEADOS_SEQ.NEXTVAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HR"."EMPLEADOS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER "HR"."SECURE_EMPLOYEES" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "HR"."UPDATE_JOB_HISTORY" 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER "HR"."UPDATE_JOB_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."ADD_JOB" 
(
  P_JOB_ID IN JOBS.JOB_ID%type,
  P_JOB_TITLE IN JOBS.JOB_TITLE%type,
  P_AUTOCOMMIT BOOLEAN := FALSE
) IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF P_JOB_ID NOT LIKE '__$__%' ESCAPE '$' OR P_JOB_ID <> UPPER(P_JOB_ID) THEN
        RAISE_APPLICATION_ERROR(-20666, 'Invalid data: El formato del identificador debe ser XX_XXXX ...');
    END IF;
    IF TRIM(P_JOB_TITLE) IS NULL OR LENGTH(TRIM(P_JOB_TITLE)) < 2 THEN
        RAISE_APPLICATION_ERROR(-20666, 'Invalid data: Title ...');
    END IF;
    INSERT INTO JOBS(JOB_ID, JOB_TITLE)
    VALUES(P_JOB_ID, P_JOB_TITLE);
--    IF P_AUTOCOMMIT THEN
        COMMIT;
--    END IF;
END ADD_JOB ;

/
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure DEMOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."DEMOS" (
    entrada_salida in out VARCHAR2,
    nombre in varchar2 := 'MUNDO', 
    veces NUMBER default 1,
    salida out VARCHAR2
) AS 
  v_nombre varchar2(100);
  calc number;
  e_malo EXCEPTION;
BEGIN
    if veces < 0 then
        raise e_malo;
    end if;
    calc := veces / CUENTA_EMP(30);
    DBMS_OUTPUT.PUT_LINE('Entra: ' || salida || ', ' || entrada_salida);
    v_nombre:= upper(nombre);
    for i in 1..veces loop
      DBMS_OUTPUT.PUT_LINE('HOLA ' || v_nombre);
    end loop;
    salida := 'HOLA ' || v_nombre;
    entrada_salida := 'Cotilleo ' || entrada_salida;
    DBMS_OUTPUT.PUT_LINE('Sale: ' || salida || ', ' || entrada_salida);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Interno: ' || SQLERRM);
        raise;
    WHEN e_malo THEN
        RAISE_APPLICATION_ERROR(-20202, 'No puedo borrar');
END DEMOS;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  DDL for Package DEMOS_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "HR"."DEMOS_PKG" AS 
    SUBTYPE moneda_type is NUMBER(8,2);
    TYPE banda_salarial IS RECORD (
        minimo moneda_type,
        maximo moneda_type
    );
    c_edad_jubilacion CONSTANT NUMBER := 67;
    v_salario_minimo NUMBER := 1080;
    v_numero_de_pagas NUMBER := 14;
    insert_null_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_exception, -1400);
    
    PROCEDURE add(p_fila in out employees%rowtype, p_count out number);
    PROCEDURE add(p_employee_id employees.employee_id%type, p_last_name employees.last_name%type);
    PROCEDURE change(p_fila in out employees%rowtype, p_count out number);
    PROCEDURE remove(p_fila in out employees%rowtype, p_count out number);

    FUNCTION salario_anual (
        salario NUMBER
    ) RETURN NUMBER;
END DEMOS_PKG;

/
--------------------------------------------------------
--  DDL for Package EMP_ADMIN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "HR"."EMP_ADMIN" AUTHID DEFINER AS
  -- Declare public type, cursor, and exception:
  TYPE EmpRecTyp IS RECORD (emp_id NUMBER, sal NUMBER);
  CURSOR desc_salary RETURN EmpRecTyp;
  invalid_salary EXCEPTION;

  -- Declare public subprograms:

  FUNCTION hire_employee (
    last_name       VARCHAR2,
    first_name      VARCHAR2,
    email           VARCHAR2,
    phone_number    VARCHAR2,
    job_id          VARCHAR2,
    salary          NUMBER,
    commission_pct  NUMBER,
    manager_id      NUMBER,
    department_id   NUMBER
  ) RETURN NUMBER;

  -- Overload preceding public subprogram:
  PROCEDURE fire_employee (emp_id NUMBER);
  PROCEDURE fire_employee (emp_email VARCHAR2);

  PROCEDURE raise_salary (emp_id NUMBER, amount NUMBER);
  FUNCTION nth_highest_salary (n NUMBER) RETURN EmpRecTyp;
END emp_admin;

/
--------------------------------------------------------
--  DDL for Package EMP_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "HR"."EMP_PKG" AS
    SUBTYPE moneda_type is NUMBER(8,2);
    TYPE banda_salarial IS RECORD (
        minimo moneda_type,
        maximo moneda_type
    );
    c_edad_jubilacion CONSTANT NUMBER := 67;
    v_salario_minimo NUMBER := 1080;
    v_numero_de_pagas NUMBER := 14;
    FUNCTION salario_anual (
        salario NUMBER
    ) RETURN NUMBER;

    TYPE timerec IS RECORD (
        minutes SMALLINT,
        hours   SMALLINT
    );
    TYPE transrec IS RECORD (
        category VARCHAR2(10),
        account  INT,
        amount   REAL,
        time_of  timerec
    );
    minimum_balance CONSTANT REAL := 10.00;
    number_processed INT;
    insufficient_funds EXCEPTION;
    PRAGMA exception_init ( insufficient_funds, -4097 );
    insert_null_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_exception, -1400);
END emp_pkg;

/
--------------------------------------------------------
--  DDL for Package MESSAGES_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "HR"."MESSAGES_PKG" AS 
    insert_null_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_exception, -1400);
    update_null_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(update_null_exception, -1407);

    PROCEDURE add_message(p_fila in out messages%rowtype, p_count out number);
    PROCEDURE change_message(p_fila in out messages%rowtype, p_count out number);
    PROCEDURE remove_message(p_fila in out messages%rowtype, p_count out number);
END MESSAGES_PKG;

/
--------------------------------------------------------
--  DDL for Package VALIDATION_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "HR"."VALIDATION_PKG" AS 
    c_invalid_data_code CONSTANT PLS_INTEGER := -20400;
    invalid_data_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(invalid_data_exception, c_invalid_data_code);

    FUNCTION is_blank(value varchar2) RETURN BOOLEAN;
    PROCEDURE raise_if_is_blank(value varchar2, name varchar2);
END VALIDATION_PKG;

/
--------------------------------------------------------
--  DDL for Package Body DEMOS_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "HR"."DEMOS_PKG" AS
  v_privada PLS_INTEGER := 0;
  
  PROCEDURE raise_error(message varchar2);
  
  PROCEDURE add(p_fila in out employees%rowtype, p_count out number) AS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('add fila');
    raise_error('Pasa algo');
    -- TAREA: Se necesita implantación para PROCEDURE DEMOS_PKG.add
    NULL;
  END add;

  PROCEDURE add(p_employee_id employees.employee_id%type, p_last_name employees.last_name%type) AS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('add columnas');
    raise_error('Pasa algo');
    -- TAREA: Se necesita implantación para PROCEDURE DEMOS_PKG.add
    NULL;
  END add;

  PROCEDURE change(p_fila in out employees%rowtype, p_count out number) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE DEMOS_PKG.change
    NULL;
  END change;

  PROCEDURE remove(p_fila in out employees%rowtype, p_count out number) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE DEMOS_PKG.remove
    NULL;
  END remove;

  FUNCTION salario_anual (
        salario NUMBER
    ) RETURN NUMBER AS
  BEGIN
    return v_numero_de_pagas * salario;
  END salario_anual;
  
  PROCEDURE raise_error(message varchar2) AS
  BEGIN
    raise insert_null_exception;
    NULL;
  END raise_error;


    begin
        select min(min_salary) 
        into v_salario_minimo
        from jobs;

END DEMOS_PKG;

/
--------------------------------------------------------
--  DDL for Package Body EMP_ADMIN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "HR"."EMP_ADMIN" AS
  number_hired  NUMBER;  -- private variable, visible only in this package

  -- Define cursor declared in package specification:

  CURSOR desc_salary RETURN EmpRecTyp IS
    SELECT employee_id, salary
    FROM employees
    ORDER BY salary DESC;

  -- Define subprograms declared in package specification:

  FUNCTION hire_employee (
    last_name       VARCHAR2,
    first_name      VARCHAR2,
    email           VARCHAR2,
    phone_number    VARCHAR2,
    job_id          VARCHAR2,
    salary          NUMBER,
    commission_pct  NUMBER,
    manager_id      NUMBER,
    department_id   NUMBER
  ) RETURN NUMBER
  IS
    new_emp_id NUMBER;
  BEGIN
    new_emp_id := employees_seq.NEXTVAL;
    INSERT INTO employees (
      employee_id,
      last_name,
      first_name,
      email,
      phone_number,
      hire_date,
      job_id,
      salary,
      commission_pct,
      manager_id,
      department_id
    )
    VALUES (
      new_emp_id,
      hire_employee.last_name,
      hire_employee.first_name,
      hire_employee.email,
      hire_employee.phone_number,
      SYSDATE,
      hire_employee.job_id,
      hire_employee.salary,
      hire_employee.commission_pct,
      hire_employee.manager_id,
      hire_employee.department_id
    );
    number_hired := number_hired + 1;
    DBMS_OUTPUT.PUT_LINE('The number of employees hired is ' 
                         || TO_CHAR(number_hired) );   
    RETURN new_emp_id;
  END hire_employee;

  PROCEDURE fire_employee (emp_id NUMBER) IS
  BEGIN
    DELETE FROM employees WHERE employee_id = emp_id;
  END fire_employee;

  PROCEDURE fire_employee (emp_email VARCHAR2) IS
  BEGIN
    DELETE FROM employees WHERE email = emp_email;
  END fire_employee;

  -- Define private function, available only inside package:

  FUNCTION sal_ok (
    jobid VARCHAR2,
    sal NUMBER
  ) RETURN BOOLEAN
  IS
    min_sal NUMBER;
    max_sal NUMBER;
  BEGIN
    SELECT MIN(salary), MAX(salary)
    INTO min_sal, max_sal
    FROM employees
    WHERE job_id = jobid;

    RETURN (sal >= min_sal) AND (sal <= max_sal);
  END sal_ok;

  PROCEDURE raise_salary (
    emp_id NUMBER,
    amount NUMBER
  )
  IS
    sal NUMBER(8,2);
    jobid VARCHAR2(10);
  BEGIN
    SELECT job_id, salary INTO jobid, sal
    FROM employees
    WHERE employee_id = emp_id;

    IF sal_ok(jobid, sal + amount) THEN  -- Invoke private function
      UPDATE employees
      SET salary = salary + amount
      WHERE employee_id = emp_id;
    ELSE
      RAISE invalid_salary;
    END IF;
  EXCEPTION
    WHEN invalid_salary THEN
      DBMS_OUTPUT.PUT_LINE ('The salary is out of the specified range.');
  END raise_salary;

  FUNCTION nth_highest_salary (
    n NUMBER
  ) RETURN EmpRecTyp
  IS
    emp_rec  EmpRecTyp;
  BEGIN
    OPEN desc_salary;
    FOR i IN 1..n LOOP
      FETCH desc_salary INTO emp_rec;
    END LOOP;
    CLOSE desc_salary;
    RETURN emp_rec;
  END nth_highest_salary;

BEGIN  -- initialization part of package body
   INSERT INTO log (date_of_action, user_id, package_name)
   VALUES (SYSDATE, USER, 'EMP_ADMIN');
   number_hired := 0;
END emp_admin;

/
--------------------------------------------------------
--  DDL for Package Body EMP_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "HR"."EMP_PKG" AS
    FUNCTION salario_anual(salario NUMBER) 
    RETURN NUMBER as
    begin
     return v_numero_de_pagas * salario;
    end;
    
    begin
        select min(min_salary) 
        into v_salario_minimo
        from jobs;
END EMP_PKG;

/
--------------------------------------------------------
--  DDL for Package Body MESSAGES_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "HR"."MESSAGES_PKG" AS

    PROCEDURE add_message(p_fila in out messages%rowtype, p_count out number) as 
    begin
        insert into messages(results) 
            values(p_fila.results)
            returning id, results, cuando INTO p_fila.id, p_fila.results, p_fila.cuando ;
        p_count := sql%rowcount;
    end;
    PROCEDURE change_message(p_fila in out messages%rowtype, p_count out number) as 
    begin
        update messages
            set results = p_fila.results, cuando = sysdate
            where id = p_fila.id
            returning id, results, cuando INTO p_fila.id, p_fila.results, p_fila.cuando ;
        p_count := sql%rowcount;
    end;
    PROCEDURE remove_message(p_fila in out messages%rowtype, p_count out number) as 
    begin
        delete from messages
            where id = p_fila.id;
        p_count := sql%rowcount;
    end;

END MESSAGES_PKG;

/
--------------------------------------------------------
--  DDL for Package Body VALIDATION_PKG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "HR"."VALIDATION_PKG" AS
  PROCEDURE raise_invalid_data_exception(message varchar2) AS
  BEGIN
    RAISE_APPLICATION_ERROR(c_invalid_data_code, 'Invalid data: ' || message);
  END raise_invalid_data_exception;

  FUNCTION is_blank(value varchar2) RETURN BOOLEAN AS
  BEGIN
    RETURN TRIM(value) IS NULL;
  END is_blank;

  PROCEDURE raise_if_is_blank(value varchar2, name varchar2) AS
  BEGIN
    if is_blank(value) then
        raise_invalid_data_exception(name || ' no puede ser nulo o en blanco.');
    end if;
  END raise_if_is_blank;

END VALIDATION_PKG;

/
--------------------------------------------------------
--  DDL for Function BOOL2NUMBER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."BOOL2NUMBER" 
(
  VALOR IN BOOLEAN 
) RETURN NUMBER AS 
BEGIN
    IF VALOR THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
END BOOL2NUMBER;

/
--------------------------------------------------------
--  DDL for Function CUENTA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."CUENTA" 
(
  DEPT_NO IN NUMBER 
) RETURN NUMBER AUTHID CURRENT_USER  AS 
cont number;
BEGIN
  select count(*)
  into cont
  from employees
  where department_id = dept_no;
  --insert INTO messages(results) values('Cuenta: ' || cont);
  RETURN cont;
END CUENTA;

/

  GRANT EXECUTE ON "HR"."CUENTA" TO "CURSOPL";
--------------------------------------------------------
--  DDL for Function CUENTA_EMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."CUENTA_EMP" 
(
  DEPT_NO IN NUMBER:=10 
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

/
--------------------------------------------------------
--  DDL for Function GET_EMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."GET_EMP" ( p_emp_id NUMBER )
RETURN employees%ROWTYPE IS
  v_stmt VARCHAR2(200);
  v_emprec employees%ROWTYPE;
BEGIN
  v_stmt := 'SELECT * FROM employees ' ||
            'WHERE employee_id = :p_emp_id';
  EXECUTE IMMEDIATE v_stmt INTO v_emprec USING p_emp_id ;
  RETURN v_emprec;
END;

/
--------------------------------------------------------
--  DDL for Function VALID_DEPTID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."VALID_DEPTID" 
(
  DEPT_NO IN departments.department_id%type
) RETURN BOOLEAN AS 
    v_dummy PLS_INTEGER;
BEGIN
    select 1
    into v_dummy
    from departments
    where department_id = DEPT_NO;
    RETURN true;
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN false;
END VALID_DEPTID;

/
--------------------------------------------------------
--  DDL for Function VALID_DEPTID_SQL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."VALID_DEPTID_SQL" 
(
  DEPT_NO IN departments.department_id%type
) RETURN PLS_INTEGER AS 
    v_dummy PLS_INTEGER;
BEGIN
    if VALID_DEPTID(DEPT_NO) then
        RETURN 1;
    else
        RETURN 0;
    end if;
--    select 1
--    into v_dummy
--    from departments
--    where department_id = DEPT_NO;
--    RETURN 1;
--EXCEPTION
--    WHEN NO_DATA_FOUND THEN RETURN 0;
END VALID_DEPTID_SQL;

/
--------------------------------------------------------
--  DDL for Synonymn PEDIDOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "HR"."PEDIDOS" FOR "OE"."ORDERS";
--------------------------------------------------------
--  DDL for Synonymn S_EMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "HR"."S_EMP" FOR "HR"."EMPLOYEES";
--------------------------------------------------------
--  Constraints for Table EMP
--------------------------------------------------------

  ALTER TABLE "HR"."EMP" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMP" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMP" MODIFY ("HIRE_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMP" MODIFY ("JOB_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MESSAGES
--------------------------------------------------------

  ALTER TABLE "HR"."MESSAGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MESSAGES" MODIFY ("RESULTS" NOT NULL ENABLE);
  ALTER TABLE "HR"."MESSAGES" ADD CONSTRAINT "MESSAGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MESSAGES" MODIFY ("CUANDO" NOT NULL ENABLE);
  ALTER TABLE "HR"."MESSAGES" MODIFY ("KK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "HR"."REGIONS" MODIFY ("REGION_ID" CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX "HR"."REG_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" MODIFY ("COUNTRY_ID" CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOB_GRADES
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_GRADES" MODIFY ("LOWEST_SAL" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_GRADES" MODIFY ("HIGHEST_SAL" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_GRADES" ADD CONSTRAINT "JOBGRADES_GRADE_PK" PRIMARY KEY ("GRADE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLEADOS
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLEADOS" MODIFY ("ID_EMPLEADO" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLEADOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLEADOS" MODIFY ("APELLIDOS" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLEADOS" MODIFY ("SALARIO" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLEADOS" MODIFY ("FINICIO" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLEADOS" MODIFY ("ID_DEPARTAMENTO" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_PK" PRIMARY KEY ("ID_EMPLEADO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_UK_NOMBRE_APELLIDOS" UNIQUE ("NOMBRE", "APELLIDOS")
  USING INDEX (CREATE UNIQUE INDEX "HR"."EMPLEADOS_UK1" ON "HR"."EMPLEADOS" ("NOMBRE", "APELLIDOS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" )  ENABLE;
  ALTER TABLE "HR"."EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_CHK_NOMBRE_CORTO" CHECK (LENGTH(nombre) > 1) ENABLE;
  ALTER TABLE "HR"."EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_CHK_ACTIVO" CHECK (activo is null or activo in ('V', 'F')) ENABLE;
  ALTER TABLE "HR"."EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_CHK_FECHAS" CHECK (FFIN IS NULL OR FINICIO <=  FFIN) ENABLE;
--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("EMPLOYEE_ID" CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("START_DATE" CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("END_DATE" CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("JOB_ID" CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE")
  USING INDEX "HR"."JHIST_EMP_ID_ST_DATE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" MODIFY ("CITY" CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX "HR"."LOC_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TEMP
--------------------------------------------------------

  ALTER TABLE "HR"."TEMP" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."TEMP" ADD CONSTRAINT "TEMP_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX "HR"."DEPT_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "HR"."JOBS" MODIFY ("JOB_TITLE" CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX "HR"."JOB_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("LAST_NAME" CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("EMAIL" CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("HIRE_DATE" CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("JOB_ID" CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX "HR"."EMP_EMP_ID_PK"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "HR"."REGIONS" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "HR"."LOCATIONS" ("LOCATION_ID") ENABLE;
  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLEADOS
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_FK_DEPARTAMENTO" FOREIGN KEY ("ID_DEPARTAMENTO")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "HR"."COUNTRIES" ("COUNTRY_ID") ENABLE;
