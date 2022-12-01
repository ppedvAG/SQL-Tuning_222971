/*


TAB A 10000
TAB B 100000

Abfrage, die immer 100 zurückgibt?
A oder B-- A




*/


--Dateigruppe

--DB .mdf + .ldf
--und noch weitere Datendateien:  .ndf

C:\Program Files\SQL Server\MSSQL\MSS!QL.HR\Data\HR\Hozdate\hotzdata.ndf  HOT

--wie lege ich Tab auf andere DAteigruppen?
create table test(id int) ON HOT

--Wie kann ich Tab auf andere Dateigruppen verschieben?




---Partitionierte Sicht

create table u2022 (id int, jahr int, spx int)

create table u2021 (id int, jahr int, spx int)

create table u2020 (id int, jahr int, spx int)

--KW032022
--ULS_partition1 .. 31


select * from umsatz ---?

create view vUmsatz
as
select * from u2022
UNION ALL 
select * from u2021
UNION ALL
select * from u2020

select * from vUmsatz where jahr = 2021

select * from vUmsatz 

--Idee: NULL   NOT NULL

--UP DEL INS geht nur, wenn die ID kein Identity, neuer PK (id und Jahr)



--Partitionierung


--Part-f()

------------100]--------------------200]----------------------------

create partition function fZahl(int)
as
RANGE LEFT FOR VALUES(100,200)

select $partition.fzahl(117) ---2   


-- bis100  bis200 bis5000  rest


create partition scheme schZahl
as
partition fzahl to (bis100,bis200,rest)
---                                  1        2      3

create table parttab(id int identity, nummer int, spx char(4100)) on schZahl(nummer)


declare @i as int = 1

while  @i<=20000
	begin
			insert into parttab (nummer, spx) values (@i, 'XY')
			set @i+=1
	end

	set statistics io, time on


	-----100-----------200-----------------------------
	-- 100      100              19800

	select * from parttab where nummer = 500
	select * from parttab where id = 50


	--neue Grenze
	--Tab nie!!!
	--F()
	--scheme 
	--Dgruppe: bis5000


	---------100---------200----------------------5000------------------



alter partition scheme schZahl  next used bis5000
--diese DGruppe bis5000 wird noch nicht verwendet


----------100---200-------------------5000------------------split


alter partition function fZahl() split range (5000)--well done!

select * from parttab where nummer = 5001


--Grenze entfernen
---------x------------200-------------5000-------------

--TAB nie!!
--Dgruppen: nix
--Scheme: nix 
--F():ja

alter partition function fZahl() merge range(100)

select * from parttab where nummer = 117


--Einfachster Weg aktuelle Struktur zu sehen


create table archiv(id int not null, nummer int, spx char(4100)) on bis200  -- schema(spalte)--

alter table parttab switch partition 1 to archiv

select * from archiv

select * from parttab
--100MB/Sek
--Part1  1000MB --> 10Sek-- 1000000000000000000GB-- ca 0 ms

select * from parttab where nummer = 5001





--Monitoringaufzeichung



