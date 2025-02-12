DECLARE
    CURSOR c_sellers IS
        SELECT sname, comm
        FROM sal
        WHERE city != 'London'
        ORDER BY sname;

    v_seller c_sellers%ROWTYPE;  -- Переменная для хранения данных о продавце
    v_count  INTEGER := 0;        -- Счетчик для отслеживания количества выведенных продавцов
BEGIN
    -- Цикл по курсору
    FOR v_seller IN c_sellers LOOP
        
        -- Увеличиваем счетчик
        v_count := v_count + 1;

        -- Выводим данные о продавце
        DBMS_OUTPUT.PUT_LINE('Имя: ' || v_seller.sname || ', Комиссионные: ' || v_seller.comm);

        IF v_count = 2 THEN
            EXIT; 
        END IF;
    END LOOP;
END;
/
