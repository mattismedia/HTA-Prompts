@echo off
setlocal
set regpath=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{E999B723-79AD-478C-BC6D-634A20920482}
set regvalue=DisplayVersion
set regdata=4.6.2.24020
reg query "%regpath%" /v "%regvalue%" | find /i "%regdata%"
if errorlevel 1 GOTO MISSING

Exit /B 0

:MISSING
Start /Wait mshta.exe "%~dp0APPV Alert.hta"
Exit /B 0
