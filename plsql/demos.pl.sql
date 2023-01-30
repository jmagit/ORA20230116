CLEAR SCREEN
SET AUTOPRINT ON

variable saldo number;
exec :saldo := 2
print saldo
/
/*
declare
    sal number(6,2); -- employees.salary%type := 0;
    subida_salarial CONSTANT number := 2;
    comision CONSTANT number := 3;
    i PLS_INTEGER := 1;
    b BOOLEAN := true;
begin
    SELECT
        salary
    INTO sal
    FROM
        employees
    WHERE
        employee_id = 103;

    sal := i + 3.949;
    i := i + 1.5;
    i := '99,5';
    b := i > sal;
    :saldo := sal * i;
    dbms_output.put_line('El salario es ' || sal);
    dbms_output.put_line('Hola mundo');
    dbms_output.put_line('El doble salario es ' ||(2 * sal));
    dbms_output.put_line('El doble salario es ' ||(subida_salarial * sal));
    dbms_output.put_line('El doble salario es ' ||(comision * sal * subida_salarial));
    dbms_output.put_line('Entero: ' || i);
    b := false; -- i > sal;
    if b or b is not
    null
    then
    -- parte then
    else
    -- parte else   
    end
    --dbms_output.put_line('Booleano: ' || b);
    end;
*/

BEGIN <<outer>>
DECLARE
  v_sal      NUMBER(7,2) := 60000;
  v_comm     NUMBER(7,2) := v_sal * 0.20;
  v_message  VARCHAR2(255) := ' eligible for commission';
BEGIN 
 v_message := 'SALESMAN'||v_message;
  DECLARE
    	v_sal	    NUMBER(7,2) := 50000;
    	v_comm 	    NUMBER(7,2) := 0;
    	v_total_comp  NUMBER(7,2) := v_sal + v_comm;
  BEGIN 
    	 v_message := 'CLERK not'||v_message;
         dbms_output.put_line('Entero: ' || i);
    	outer.v_comm := v_sal * 0.30; 
        dbms_output.put_line('Interno: ' || v_message);
    END;
    dbms_output.put_line('externo: ' || v_message);
END;
END outer; 
/
/ print saldo
