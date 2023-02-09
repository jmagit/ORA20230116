CREATE OR REPLACE PACKAGE MESSAGES_PKG AS 
    insert_null_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_exception, -1400);
    update_null_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(update_null_exception, -1407);

    PROCEDURE add_message(p_fila in out messages%rowtype, p_count out number);
    PROCEDURE change_message(p_fila in out messages%rowtype, p_count out number);
    PROCEDURE remove_message(p_fila in out messages%rowtype, p_count out number);
END MESSAGES_PKG;
/


CREATE OR REPLACE PACKAGE BODY    MESSAGES_PKG AS
    PROCEDURE add_message(p_fila in out messages%rowtype, p_count out number) as 
    begin
        VALIDATION_PKG.raise_if_is_blank(p_fila.results, 'results');
        insert into messages(results) 
            values(p_fila.results)
            returning id, results, cuando INTO p_fila;
        p_count := sql%rowcount;
    end;
    PROCEDURE change_message(p_fila in out messages%rowtype, p_count out number) as 
    begin
        update messages
            set results = p_fila.results, cuando = sysdate
            where id = p_fila.id
            returning id, results, cuando INTO p_fila;
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
