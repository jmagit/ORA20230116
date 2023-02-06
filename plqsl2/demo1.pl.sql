clear screen
--exec demos;

DECLARE
    cad_out varchar2(500); -- := 'kk';
    password varchar2(500); -- := 'P@$$w0d';
    e_malo EXCEPTION;
    PROCEDURE pinta_err(codigo number, msg varchar2) as 
    begin
    DBMS_OUTPUT.PUT_LINE('code: ' || SQLCODE || ', message: ' || SQLERRM);
    DBMS_OUTPUT.PUT_LINE('var: ' || cad_out);
    end;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Entra (F): ' || cad_out || ', ' || password);
    demos(password, salida => cad_out, veces => -5);
    --demos(password, 'tu', 4, password);
    DBMS_OUTPUT.PUT_LINE('Sale (F): ' || cad_out || ', ' || password);
EXCEPTION
    when e_malo then
        --DBMS_OUTPUT.PUT_LINE('Externo: ' || 'No puedo borrar');
    pinta_err(1, 'No puedo borrar');
    when OTHERS then
    pinta_err(SQLCODE, SQLERRM);
        --DBMS_OUTPUT.PUT_LINE('Externo: ' || SQLCODE || ', ' || SQLERRM);
end;