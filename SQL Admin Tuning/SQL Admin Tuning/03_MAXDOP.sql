--Messen von Abfragen

set statistics io, time on 
--Zeit in ms der CPU und die Dauer und Anzahl der Seiten
--Gilt nur pro Session und kan auch off gesetzt
--Messung versaut die Leistung
--Pläne: geschätzer Plan (vor Abfrage),  tats. Plan (kommt nach Abfrage), Live Plan (während der Ausführung)

--Tipp: tu nie messen, wenn es nicht sein muss!


_-MAXDOP
--SQL Server nimmt ab einem bst Kostenschwellenwert (default5) mehr Kerne her.
--Mehr Kerne? Wert des MAXDOP


select country, city , sum(freight) from ku
group by country, city

--lt Plan mehr Kerne verwendet: , CPU-Zeit = 593 ms, verstrichene Zeit = 119 ms.--lohneswert

select * from kunden

select country, city , sum(freight) from ku
group by country, city option (maxdop 1)
--, CPU-Zeit = 437 ms, verstrichene Zeit = 443 ms.


select country, city , sum(freight) from ku
group by country, city option (maxdop 2)
--, CPU-Zeit = 437 ms, verstrichene Zeit = 243 ms.


select country, city , sum(freight) from ku
group by country, city option (maxdop 4)


select country, city , sum(freight) from ku
group by country, city option (maxdop 6)


--Wie macht man es besser:

--Kostenschwellwert auf Server höher setzen: 25 (Dataware) OLTP 50
--MAXDOP 0 (bis SQL2014) ab SQL 2016 = Anzahl der Kerne  max 8