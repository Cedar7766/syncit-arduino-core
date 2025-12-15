@echo off
set SRC=%~1
set DEST_DIR=%~2
set NAME=%~3

if "%SRC%"=="" goto :eof
if "%DEST_DIR%"=="" goto :eof
if "%NAME%"=="" goto :eof
if not exist "%SRC%" goto :eof

if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"
copy /Y "%SRC%" "%DEST_DIR%\%NAME%_noboot.hex" >nul
