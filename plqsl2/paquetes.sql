clear screen;
SET SERVEROUTPUT ON;

declare 
  salario DEMOS_PKG.moneda_type;
  rango DEMOS_PKG.banda_salarial;
  edad PLS_INTEGER := 68;
begin
 if nvl(salario, 0) < DEMOS_PKG.v_salario_minimo then
    salario := DEMOS_PKG.v_salario_minimo;
 end if;
 DBMS_OUTPUT.PUT_LINE('Salario min: ' || DEMOS_PKG.v_salario_minimo);
 DBMS_OUTPUT.PUT_LINE('Salario anual: ' || DEMOS_PKG.salario_anual(salario));
 if edad > DEMOS_PKG.c_edad_jubilacion then
    DEMOS_PKG.v_salario_minimo := 0;
 end if;
 DBMS_OUTPUT.PUT_LINE('Salario min: ' || DEMOS_PKG.v_salario_minimo);
 DEMOS_PKG.add(1, 'kk');
 DBMS_OUTPUT.PUT_LINE('add');
 --DEMOS_PKG.v_privada := 0;
exception
    when DEMOS_PKG.insert_null_exception then
        DBMS_OUTPUT.PUT_LINE('Paquete: ' || SQLCODE || ', ' || SQLERRM);
end;

--select employee_id, salary, DEMOS_PKG.salario_anual(salary) from employees;

