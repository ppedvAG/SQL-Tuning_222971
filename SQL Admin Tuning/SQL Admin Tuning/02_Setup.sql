/*
Volumewartungstask

---------------------------------------------
111111111111111111111100000000000
---------------------------------------------

SQL Dienst soll das selber erledigen! und dann keine Ausnullung mehr

Ist mir wurscht!-- weil ich die DB so  gro� mache, dass die n�chsten 3  Jahre keine Vergr��erung stattfindet


Windows --> Lokale Sicherhetisrichtlinie



Datenbank
Daten und Logfiles sollte man trennen.. --> 2 pyhsikalische HDDs

F�r jede DB eigens �berlegen.. viele LDFS auf einem Datentr�ger sind nicht besonders schnell


TEMPDB m�chte mehr Dateiene haben (Anzahl der Kerne , aber nie mehr als 8 )
am besten eig HDDs und Daten von Logfiles trennen

Warum 8 Dateien 
und Warum T1117 und T1118

MAXDOP
maximale Anzahl der Kerne pro ABfrage (max 8 , sonst Anzah der Kerne)
fr�her 0-- alle
Verwaltungsaufwand!!


Arbeitsspeicher
MAX: das OS braucht Luft (RAM) zu arbeiten  (mind 2GB bis 10GB)
MIN: 0 gilt erst wenn erreicht


Wird die VM ver�ndert im Sinne: mehr oder weniger Kerne, bzw RAM
dann sollte auch im SQL Server folgendes korrigiert werden:

Anzahl der tempdb Dateien (max 8)
MAXDOP = Anzahl der Kerne (Max8)
Max RAM (Anpassen auf das neue Niveau abzgl OS)


