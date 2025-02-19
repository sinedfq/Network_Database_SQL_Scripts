-- Создание пакета Sales_Package
CREATE OR REPLACE PACKAGE Sales_Package IS
    PROCEDURE Count_Sellers(city_name VARCHAR2);
    PROCEDURE Count_Customers(city_name VARCHAR2);
END Sales_Package;
/

-- Создание тела пакета Sales_Package
CREATE OR REPLACE PACKAGE BODY Sales_Package IS
    PROCEDURE Count_Sellers(city_name VARCHAR2) IS
        seller_count NUMBER;
        CURSOR seller_cursor IS
            SELECT COUNT(*) FROM SAL WHERE CITY = city_name;
    BEGIN
        OPEN seller_cursor;
        FETCH seller_cursor INTO seller_count;
        CLOSE seller_cursor;
        
        DBMS_OUTPUT.PUT_LINE('Количество продавцов в городе ' || city_name || ': ' || seller_count);
    END Count_Sellers;

    PROCEDURE Count_Customers(city_name VARCHAR2) IS
        customer_count NUMBER;
        CURSOR customer_cursor IS
            SELECT COUNT(*) FROM CUST WHERE CITY = city_name;
    BEGIN
        OPEN customer_cursor;
        FETCH customer_cursor INTO customer_count;
        CLOSE customer_cursor;
        
        DBMS_OUTPUT.PUT_LINE('Количество покупателей в городе ' || city_name || ': ' || customer_count);
    END Count_Customers;
END Sales_Package;
/

-- Пример вызова процедур
BEGIN
    Sales_Package.Count_Sellers('Moscow');
    Sales_Package.Count_Customers('Moscow');
END;
/
