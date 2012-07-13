
ECHO OFF
COLOR 0A
CLS
TITLE   console
IF EXIST %LOCK% (
 ECHO unlocking master console forcibly...
 DEL %LOCK%
 PING localhost -n 1 > nul
 ECHO success.
)
COLOR 0F
TITLE   master console
cmdrc.bat