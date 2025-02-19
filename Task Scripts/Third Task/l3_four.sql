CREATE OR REPLACE PACKAGE Utility_Package IS
    FUNCTION Longest_Name(name1 VARCHAR2, name2 VARCHAR2, name3 VARCHAR2) RETURN VARCHAR2;
    FUNCTION Shortest_Name(name1 VARCHAR2, name2 VARCHAR2, name3 VARCHAR2) RETURN VARCHAR2;
END Utility_Package;
/

CREATE OR REPLACE PACKAGE BODY Utility_Package IS
    FUNCTION Longest_Name(name1 VARCHAR2, name2 VARCHAR2, name3 VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN CASE 
            WHEN LENGTH(name1) >= LENGTH(name2) AND LENGTH(name1) >= LENGTH(name3) THEN name1
            WHEN LENGTH(name2) >= LENGTH(name1) AND LENGTH(name2) >= LENGTH(name3) THEN name2
            ELSE name3
        END;
    END Longest_Name;
    
    FUNCTION Shortest_Name(name1 VARCHAR2, name2 VARCHAR2, name3 VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN CASE 
            WHEN LENGTH(name1) <= LENGTH(name2) AND LENGTH(name1) <= LENGTH(name3) THEN name1
            WHEN LENGTH(name2) <= LENGTH(name1) AND LENGTH(name2) <= LENGTH(name3) THEN name2
            ELSE name3
        END;
    END Shortest_Name;
END Utility_Package;
/

CREATE OR REPLACE PACKAGE Team_Package IS
    PROCEDURE Display_Names(name1 VARCHAR2, name2 VARCHAR2, name3 VARCHAR2);
END Team_Package;
/

CREATE OR REPLACE PACKAGE BODY Team_Package IS
    PROCEDURE Display_Names(name1 VARCHAR2, name2 VARCHAR2, name3 VARCHAR2) IS
        longest VARCHAR2(100);
        shortest VARCHAR2(100);
    BEGIN
        longest := Utility_Package.Longest_Name(name1, name2, name3);
        shortest := Utility_Package.Shortest_Name(name1, name2, name3);
        DBMS_OUTPUT.PUT_LINE('Самая длинная фамилия: ' || longest);
        DBMS_OUTPUT.PUT_LINE('Самая короткая фамилия: ' || shortest);
    END Display_Names;
END Team_Package;
/

-- Пример вызова процедур
BEGIN
    Team_Package.Display_Names('Иванов', 'Смирнов', 'Кузнецов');
END;
/