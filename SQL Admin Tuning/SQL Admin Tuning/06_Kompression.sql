create table test1( id int identity, spx char(4100))

-- 1 DS braucht 1 Seiten

insert into test1
select 'XY'
GO 20000


dbcc showcontig('test1')
--- Mittlere Seitendichte (voll).....................: 50.79%    bei 20000 Seiten

set statistics io, time on
select * from test1 where id = 100


--Neustart des SQL Server: RAM :  1000
set statistics io, time on
select * from northwind..test1

--RAM des SQL Server:  + 160MB
--CPU:  445    Dauer: 2353      Seiten : 20000 

--Kompression:

--Zeilenkompression kürzt DAtentyoen und bringt nun DS in weniger Seiten 
--Seitenkomplression: zuerst Zeilenkompression Kompression mit Präfixlago..

--Nach Neustart: RAM  gleich höher

--Seiten: weniger ..31 
--RAM: weniger  
--CPU: weniger
-- Dauer:  weniger


--Praxis:  Kompressionsrate 40 bis 60%--> CPU eher mehr und evtl längere Dauer
--Warum :  zu Gunsten anderer Tabellendaten .. 
--also zb Archivtabellen mit wenigen Zugriffen


--