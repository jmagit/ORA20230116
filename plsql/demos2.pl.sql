BEGIN
    << fuera >> DECLARE
        v_sal     NUMBER(7, 2) := 60000;
        v_comm    NUMBER(7, 2) := v_sal * 0.20;
        v_message VARCHAR2(255) := ' eligible for commission';
    BEGIN
        v_comm := 10;
        DECLARE
            v_sal        NUMBER(7, 2) := 50000;
            v_comm_int   NUMBER(7, 2) := 0;
            v_total_comp NUMBER(7, 2) := v_sal + v_comm;
        BEGIN
            v_message := 'CLERK not' || v_message;
            v_comm := v_sal * 0.30;
            dbms_output.put_line('Interno: ' || v_comm);
            fuera.v_comm := v_comm;
        END;

        dbms_output.put_line('externo: ' || v_comm);
    END;
END fuera;