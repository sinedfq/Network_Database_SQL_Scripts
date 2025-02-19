CREATE OR REPLACE FUNCTION format_amount (amt IN NUMBER) RETURN VARCHAR2 IS
    rub NUMBER;
    kop NUMBER;
    result VARCHAR2(50);
BEGIN
    rub := TRUNC(amt);
    kop := ROUND((amt - rub) * 100);
    
    result := rub || ' ' || CASE
        WHEN rub MOD 10 = 1 AND rub MOD 100 <> 11 THEN 'рубль'
        WHEN rub MOD 10 IN (2,3,4) AND rub MOD 100 NOT IN (12,13,14) THEN 'рубля'
        ELSE 'рублей'
    END || ' ' ||
    kop || ' ' || CASE
        WHEN kop MOD 10 = 1 AND kop MOD 100 <> 11 THEN 'копейка'
        WHEN kop MOD 10 IN (2,3,4) AND kop MOD 100 NOT IN (12,13,14) THEN 'копейки'
        ELSE 'копеек'
    END;
    
    RETURN result;
END;
/

-- Пример использования функции в SELECT
SELECT onum, format_amount(AMT) FROM ord;