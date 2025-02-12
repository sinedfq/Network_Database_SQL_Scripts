-- Создание последовательности
CREATE SEQUENCE myseq
START WITH 1
INCREMENT BY 1
MAXVALUE 10;

-- Создание таблицы
CREATE TABLE my_table (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50)
);

-- Вставка данных в таблицу
INSERT INTO my_table (id, name) VALUES (myseq.NEXTVAL, 'First Record');
INSERT INTO my_table (id, name) VALUES (myseq.NEXTVAL, 'Second Record');
INSERT INTO my_table (id, name) VALUES (myseq.NEXTVAL, 'Third Record');

-- Проверка вставленных данных
SELECT * FROM my_table;
