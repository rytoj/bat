@ECHO OFF
REM.-- Prepare the Command Processor
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION


echo Batlets ver. 0.01
echo Usefull bat commands
echo --------------


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

:menu_1 Find IP netbios name

set /p ip=Enter IP adress: 
nbtstat -a %ip%

GOTO:EOF

:menu_2 System File Checker

sfc /scannow

GOTO:EOF

:menu_3 driverquery

driverquery

GOTO:EOF

:menu_4 Windows version

winver

GOTO:EOF

:menu_5 Tasklist

Tasklist

GOTO:EOF
