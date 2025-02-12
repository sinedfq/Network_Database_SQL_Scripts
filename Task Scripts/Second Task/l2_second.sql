DECLARE
    pdate DATE := TO_DATE('04.01.2010', 'DD.MM.YYYY'); 
    CURSOR cur IS 
        SELECT onum, odate, cnum
        FROM ORD
        WHERE odate >= pdate
        ORDER BY odate; 

    v_order cur%ROWTYPE;  

BEGIN
    -- Открываем курсор и обрабатываем его
    OPEN cur;
    
    LOOP
        FETCH cur INTO v_order;  -- Извлекаем данные из курсора
        EXIT WHEN cur%NOTFOUND;   -- Выход из цикла, если нет больше записей
        
        -- Выводим информацию о заказе
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order.onum ||
                             ', Order Date: ' || TO_CHAR(v_order.odate, 'DD.MM.YYYY') || 
                             ', Customer ID: ' || v_order.cnum);
    END LOOP;

    CLOSE cur;  -- Закрываем курсор
END;
/
