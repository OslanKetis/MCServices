@echo off
SETLOCAL

call setenvSnd.bat

@echo on
"%SERVICE_NAME%.exe" -uninstall %SERVICE_NAME%
ENDLOCAL