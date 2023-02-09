CREATE OR REPLACE PACKAGE    VALIDATION_PKG AS 
    c_invalid_data_code CONSTANT PLS_INTEGER := -20400;
    invalid_data_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(invalid_data_exception, c_invalid_data_code);

    FUNCTION is_blank(value varchar2) RETURN BOOLEAN;
    PROCEDURE raise_if_is_blank(value varchar2, name varchar2);
END VALIDATION_PKG;
/


CREATE OR REPLACE PACKAGE BODY    VALIDATION_PKG AS
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
