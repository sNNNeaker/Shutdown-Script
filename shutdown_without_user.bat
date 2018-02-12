@echo off & setlocal ENABLEDELAYEDEXPANSION
echo #########################################
echo #
echo #		Shutdown Script w/ active user detection
echo #
echo #		Version: 0.2
echo #
echo #		by Peer Scholz - https://github.com/sNNNeaker
echo #
echo #########################################

echo # set variables
set server=%computername%
set countactive=0
set countDisconnected=0

echo # detecting
for /f "tokens=1,2,3" %%k IN ('qwinsta /server:%server% ^| findstr "Aktiv"') DO @(
	set connection=%%k
	set user=%%l
	set id=%%m
	set /a countactive +=1
	echo User '!user!' ist noch aktiv !
)

echo # doing

if !countactive! gtr 0 (
	echo At least one user is still active, shutdown abborted.
	goto :end
) else (

	for /f "tokens=1,2" %%k IN ('qwinsta /server:%server% ^| findstr "Getr\."') DO @(
	set /a countDisconnected +=1
	echo Trenne inaktive Verbindung von '%%k'.
	rwinsta %%l /server:!servername!
	)

        echo Starte Shutdown des Servers ...
	shutdown.exe -s -t 5

)

:end
echo # exit