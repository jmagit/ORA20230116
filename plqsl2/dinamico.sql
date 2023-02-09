clear screen;
DECLARE
    v_message messages%rowtype;
    v_count number := 0;
    v_procedure VARCHAR(100) := 'add'; --add, change, remove
    v_stmt VARCHAR2(500);
    FUNCTION get_columna(tabla varchar2, columna varchar2, filtro varchar2) RETURN varchar2 AS
        v_sql_cmd VARCHAR2(500);
        v_nombre varchar2(500);
    BEGIN
      v_sql_cmd:= 'select ' || columna || ' from ' || tabla 
        || ' where ' || filtro; -- || ';';
      EXECUTE IMMEDIATE v_sql_cmd INTO v_nombre;
      RETURN v_nombre;
    END;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Emp: '|| get_emp(100).last_name);
  DBMS_OUTPUT.PUT_LINE(get_columna('employees', 'last_name', 'employee_id = 100'));
  DBMS_OUTPUT.PUT_LINE(get_columna('employees', 'hire_date', 'employee_id = 150'));
  DBMS_OUTPUT.PUT_LINE(get_columna('empleados', 'empleado', 'id_empleado = 6'));
  DBMS_OUTPUT.PUT_LINE(get_columna('empleados', 'id_empleado', 'id_empleado = 6'));
  v_message.id := 100;
--  v_message.results := 'Dynamically Invoking MESSAGES_PKG.' 
--    || v_procedure || '_message()'; 
  v_message.results := '   '; 
  
  v_stmt := 'BEGIN MESSAGES_PKG.'|| v_procedure || '_message(:1, :2); END;';
  EXECUTE IMMEDIATE v_stmt USING IN OUT v_message, OUT v_count;
  --MESSAGES_PKG.add_message(v_message, v_count);
  if v_count = 0 then
    DBMS_OUTPUT.PUT_LINE('No hace nada');
  else
    DBMS_OUTPUT.PUT_LINE(v_procedure || ' ID: ' || v_message.id || 
        ' RESULTS: ' || v_message.results);
  end if;

EXCEPTION
    when MESSAGES_PKG.insert_null_exception 
        OR MESSAGES_PKG.update_null_exception 
        OR VALIDATION_PKG.invalid_data_exception
        then
        DBMS_OUTPUT.PUT_LINE('ERROR en MESSAGES_PKG: ' || SQLCODE || ', ' || SQLERRM);
        ROLLBACK;

END;
/*

DECLARE
    v_table VARCHAR(100) := 'regions_temp';
    v_count number := 0;
BEGIN
  EXECUTE IMMEDIATE 'CREATE TABLE ' || v_table || ' AS select * from regions';
  EXECUTE IMMEDIATE 'select count(*) from ' || v_table INTO v_count;
  --select count(*) into v_count from regions_temp;
  DBMS_OUTPUT.PUT_LINE(v_count || ' filas en ' || v_table);
  EXECUTE IMMEDIATE 'DROP TABLE ' || v_table || ' PURGE';
END;

DECLARE
    v_sql_cmd VARCHAR2(500);
    v_count number := 0;
    clave VARCHAR2(500) := '1';
BEGIN
  v_sql_cmd := 'select count(*) from empleados where id_empleado = ' || clave;
  DBMS_OUTPUT.PUT_LINE(v_sql_cmd);
  EXECUTE IMMEDIATE v_sql_cmd INTO v_count;
  DBMS_OUTPUT.PUT_LINE(v_count || ' borradas');
  v_sql_cmd := 'select count(*) from empleados where id_empleado = :id';
  DBMS_OUTPUT.PUT_LINE(v_sql_cmd);
  EXECUTE IMMEDIATE v_sql_cmd INTO v_count USING clave;
  DBMS_OUTPUT.PUT_LINE(v_count || ' borradas');
END;
*/