@echo off
@title RP Server #1
:iniServer
echo.
echo Hyperion Network
echo https://byhyperion.net
echo.
echo.
echo Initiating Server 1 [Port:30139]
echo %date%
echo.
echo %time% : Searching for Cache...
rmdir /S /Q cache
timeout /t 2 >nul
echo %time% : Cache Cleared!
echo %time% : Launching Server
FXServer +set citizen_dir %~dp0\citizen\ +exec server1.cfg +set sv_LicenseKey XXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo %time% : Server was shut down..
timeout /t 2 >nul
echo %time% : Attempting to restart server...
timeout /t 3 >nul
echo.
goto iniServer