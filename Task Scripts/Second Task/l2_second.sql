DECLARE
    CURSOR cur (pDate VARCHAR2) IS 
        SELECT onum, odate, cnum
        FROM ORD
        WHERE TO_CHAR(odate, 'dd.mm.yyyy') = pDate
        ORDER BY odate;

    v_order cur%ROWTYPE;  
    v_date VARCHAR2(10) := '04.01.2010';

BEGIN
    OPEN cur(v_date);
    
    LOOP
        FETCH cur INTO v_order;  
        EXIT WHEN cur%NOTFOUND;   
        
        -- Выводим информацию о заказе
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order.onum 
                             || ', Order Date: ' || TO_CHAR(v_order.odate, 'DD.MM.YYYY')  
                             || ', Customer ID: ' || v_order.cnum);
    END LOOP;

    CLOSE cur;  -- Закрываем курсор
END;
/
