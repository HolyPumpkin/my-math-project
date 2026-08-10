@echo off
setlocal
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0setup.ps1" %*
set "MMAT_EXIT_CODE=%ERRORLEVEL%"
if not "%MMAT_EXIT_CODE%"=="0" pause
exit /b %MMAT_EXIT_CODE%
