@ECHO OFF
:: Kopijuoja profili ten kur yra idetas bat failiukas
REM.-- Prepare the Command Processor
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

:menuLOOP
echo.
echo.= Menu =================================================
echo.
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":menu_" "%~f0""') do echo.  %%B  %%C
set choice=
echo.&set /p choice=Make a choice or hit ENTER to quit: ||GOTO:EOF
echo.&call:menu_%choice%
GOTO:menuLOOP

::-----------------------------------------------------------
:: menu functions follow below here
::-----------------------------------------------------------

:menu_1 Kopijuoja visa User.profili

set laikas=Laikas: %date% %time%
set source="%USERPROFILE%"
set destination="\backup\%USERNAME%_%date%_1"
xcopy %source% %destination% /s /e /d /c /h /I
echo %laikas% 

GOTO:EOF

:menu_2 Kopijuoja visa User.profili iskyrus nematomus failus

set laikas=Laikas: %date% %time%
set source="%USERPROFILE%"
set destination="\backup\%USERNAME%_%date%_2"
xcopy %source% %destination% /s /e /d /c /I
echo %laikas% 
GOTO:EOF

:menu_3 Kopijuoja OUTLOOK pst failus (win 7)

set laikas=Laikas: %date% %time%
set source1="%USERPROFILE%\AppData\Roaming\Microsoft\Outlook"
set destination1="\backup\%USERNAME%_%date%\kontaktai"
xcopy %source1% %destination1% /s /e /d /c /h /I


set source="%USERPROFILE%\AppData\Local\Microsoft\Outlook"
set destination="\backup\%USERNAME%_%date%\pst"
xcopy %source% %destination% /s /e /d /c /h /I

echo %laikas% 
GOTO:EOF

:menu_4 Kopijuoja Firefox, Chome Profilius

set laikas=Laikas: %date% %time%
set source1="%APPDATA%\Mozilla\Firefox\Profiles"
set destination1="\backup\%USERNAME%_%date%\Firefox_Profilis"
xcopy %source1% %destination1% /s /e /d /c /h /I

set source2="%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data"
set destination2="\backup\%USERNAME%_%date%\Chrome_profilis_XP"
xcopy %source2% %destination2% /s /e /d /c /h /I 

set source="%USERPROFILE%\%LOCALAPPDATA%\Google\Chrome\User Data"
set destination="\backup\%USERNAME%_%date%\Chrome_profilis_win7-8"
xcopy %source% %destination% /s /e /d /c /h /I 

echo %laikas% 

GOTO:EOF
