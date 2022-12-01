--DBSetting


/*
Mindestgröße .. auf einen Wert den man erwartet am Ende der DB Lebenszeit


Dwfaultwerte sind grausam: 8 MB + 64MB Wachstum
                                                  8 MB  + 64 MB 


bis SQL 2014: Daten 5 MB + 1MB   Log 2 MB + 10%


Wachstum eher im Bereich 1024MB

Das Logfile.. hier erst recht

dbcc loginfo()-- Anzhal der Logfile ..nicht mehr als 3000 bzw 6000

--was wäre wenn 10000...

--zuerst entweder sichern des Logfile oder Wiederherstellungsmodel auf Einfach
--verkleinern auf 1 MB (versuchen)
--dann auf korrektes Maß ca 25% der DAtendateien
--dann Wachstum auf 1024MB
--Modell auf urspr Modell und dann Vollsicherung





*/