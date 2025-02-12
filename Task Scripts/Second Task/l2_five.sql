CREATE SEQUENCE seller_id_seq
START WITH 5000
INCREMENT BY 2;

CREATE TABLE sellers(
    s_id NUMBER PRIMARY KEY,
    s_name VARCHAR(200),
    min_ord_cost INTEGER
);

DECLARE
    CURSOR seller_cursor IS
        SELECT snum, MIN(amt) AS min_order_cost
        FROM ord
        GROUP BY snum;
        
    v_snum sellers.s_name%TYPE;
    v_min_order_cost sellers.min_ord_cost%TYPE;
BEGIN
    FOR seller_record IN seller_cursor LOOP
        v_snum := seller_record.snum;
        v_min_order_cost := seller_record.min_order_cost;

        INSERT INTO sellers (s_id, s_name, min_ord_cost)
        VALUES (seller_id_seq.NEXTVAL, v_snum, v_min_order_cost);
    END LOOP;
    
    COMMIT; -- Подтверждение транзакции
END;
/
