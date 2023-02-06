VARIABLE b_name	VARCHAR2(25)
VARIABLE c_name	VARCHAR2(25)

exec :b_name := 'algo';

exec demos(:b_name, salida => :c_name, veces => 5);

print;

CREATE OR REPLACE PROCEDURE DEMOS(
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
    calc := veces / 0;
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
