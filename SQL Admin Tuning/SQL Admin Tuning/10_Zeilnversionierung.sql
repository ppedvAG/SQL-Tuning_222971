--Zeilenversionierung

massive Traffic in Tempdb kann die Folge sein

--> Fazit ein Ändern hindert das Lesen nicht mehr

ALTER DATABASE [Northwind] SET READ_COMMITTED_SNAPSHOT ON WITH NO_WAIT
GO

GO
ALTER DATABASE [Northwind] SET ALLOW_SNAPSHOT_ISOLATION ON
GO