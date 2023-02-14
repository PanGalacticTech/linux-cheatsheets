@echo off
title Imogen@ImogenWren
:start
echo Attempting Connection with ImogenWren
ssh imogen@imogenwren.local
echo Closing Connection...
timeout /t 10
goto start
pause