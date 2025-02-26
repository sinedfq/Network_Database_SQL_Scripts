CREATE OR REPLACE PROCEDURE update_dep_number (
    old_dept_no IN NUMBER,
    new_dept_no IN NUMBER
) AS
    v_count NUMBER;
    -- Объявляем пользовательское исключение
    dept_not_found EXCEPTION;
BEGIN
    -- Проверяем, существует ли запись с указанным old_dept_no
    SELECT COUNT(*)
    INTO v_count
    FROM DEP
    WHERE dept_no = old_dept_no;

    -- Если запись не существует, выбрасываем пользовательское исключение
    IF v_count = 0 THEN
        RAISE dept_not_found;
    END IF;

    -- Если запись существует, выполняем обновление
    UPDATE DEP
    SET dept_no = new_dept_no
    WHERE dept_no = old_dept_no;

    DBMS_OUTPUT.PUT_LINE('Запись успешно обновлена.');

EXCEPTION
    -- Обрабатываем пользовательское исключение
    WHEN dept_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Ошибка: Запись с dept_no = ' || old_dept_no || ' не существует.');
END;
/
