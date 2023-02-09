CREATE OR REPLACE PACKAGE    DEMOS_PKG AS 
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


CREATE OR REPLACE PACKAGE BODY    DEMOS_PKG AS
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
