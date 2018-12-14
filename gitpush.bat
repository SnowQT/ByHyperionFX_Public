@echo off
:loop
cls
set /p title="Commit msg: "
set /p desc="Descript msg: "
IF "%title%"=="" ( 
    cls
    echo Du skal skrive commit msg, vent venligst...
    Timeout /T 2 /NoBreak>nul
    goto loop
) ELSE (
    goto next
)
:next
git add .
IF "%desc%"=="" ( 
	git commit -m "%title%";
) ELSE (
    git commit -m "%title%" -m "%desc%";
)
git push
pause