SELECT
    snum AS seller, 
    SUM(decode(to_char(odate,'dd.mm.yyyy'),'03.01.2010',amt,null)) "03.01.2010", 
    SUM(decode(to_char(odate,'dd.mm.yyyy'),'04.01.2010',amt,null)) "04.01.2010", 
    SUM(decode(to_char(odate,'dd.mm.yyyy'),'06.01.2010',amt,null)) "06.01.2010"
FROM ord
GROUP BY 
    snum
ORDER BY 
    snum ASC;
