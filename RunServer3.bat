@echo off
@title RP Server #3
:iniServer
echo.
echo Hyperion Network
echo https://byhyperion.net
echo.
echo.
echo Initiating Server 3 [Port:30141]
echo %time% : Launching Server
FXServer +set citizen_dir %~dp0\citizen\ +exec server3.cfg +set sv_LicenseKey XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo %time% : Server was shut down..
timeout /t 2 >nul
echo %time% : Attempting to restart server...
timeout /t 3 >nul
echo.
goto iniServer