@ECHO OFF
:: Daro kopijas lokaliai ir i isorini hdd, sql backup veikia analogiskai
:: Pirmoje eiluteje aprasomas sukuriamos direktorijos pavadinimas, antroje, kas bus kopijuojama ir kur bus kopijuojama

:: net stop mssqlserver


:: Riv_gama backupas 

set RivGama="Riv_Gama_%date%"
set source="C:\test\Pirmas_katalogas"
set destination="C:\Riviles_kopija\backup\rivile\%RivGama%\"
set destination_hdd="E:\Server_2012_kopijos\rivile\%RivGama%\"
xcopy %source% %destination% /s /e /d /c /h /I
xcopy %source% %destination_hdd% /s /e /d /c /h /I


:: SQL serverio backupas

set MYSQL="MSSQL_%date%"
set source1="C:\test\Antras_katalogas"
set destination1="C:\Riviles_kopija\backup\sql\%MYSQL%\"
set destination_hdd1="E:\Server_2012_kopijos\sql\%MYSQL%\"
xcopy %source1% %destination1% /s /e /d /c /h /I
xcopy %source1% %destination_hdd1% /s /e /d /c /h /I

:: net start mssqlserver

pause
