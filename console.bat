
@ECHO OFF
COLOR 0A
CLS
TITLE   console

ECHO initializing...
SET Path=win32;%Path%
SET LOCK=win32\master.lock
PING localhost -n 1 > nul

IF EXIST "%LOCK%" (
 ECHO detected locking master console.
 ECHO running temporary console...
 COLOR F0
 TITLE   temporary console
 CMD.EXE /Q /K win32\cmdrc.bat

) ELSE (
 ECHO locking master console...
 ECHO locked > %LOCK%
 PING localhost -n 1 > nul
 ECHO success.
 COLOR 0F
 TITLE   master console
 CMD.EXE /Q /K win32\cmdrc.bat
 ECHO unlocking master console...
 DEL %LOCK%
 PING localhost -n 1 > nul
 ECHO success.

)