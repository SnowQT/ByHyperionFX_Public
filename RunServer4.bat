@echo off
@title RP Server #4
:iniServer
echo.
echo Hyperion Network
echo https://byhyperion.net
echo.
echo.
echo Initiating Server 4 [Port:30142]
echo %date%
echo.
echo %time% : Launching Server
FXServer +set citizen_dir %~dp0\citizen\ +exec server4.cfg +set sv_LicenseKey XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo %time% : Server was shut down..
timeout /t 2 >nul
echo %time% : Attempting to restart server...
timeout /t 3 >nul
echo.
goto iniServer