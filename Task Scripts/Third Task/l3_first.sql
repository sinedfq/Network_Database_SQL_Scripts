CREATE TABLE DEP (
    dept_no NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100),
    loc VARCHAR2(100)
);

CREATE OR REPLACE PROCEDURE update_dep_number (
    old_dept_no IN NUMBER,
    new_dept_no IN NUMBER
) AS
BEGIN
    UPDATE DEP
    SET dept_no = new_dept_no
    WHERE dept_no = old_dept_no;
END;
/

-- Пример вызова процедуры
BEGIN
    update_dep_number(10, 20);
END;
/
