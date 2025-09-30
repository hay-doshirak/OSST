@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

IF "%1"=="" (
    ECHO Error: enter the directory
    GOTO END
)

IF "%2"=="" (
    ECHO Error: enter the extension
    GOTO END
)

SET "TOTAL=0"
SET "EXT=%2"

IF NOT "!EXT:~0,1!"=="." SET "EXT=.%EXT%"

FOR /R "%1" %%F IN (*%EXT%) DO (
    IF EXIST "%%F" (
        SET /A TOTAL+=%%~zF
    )
)

ECHO Total size of %EXT% files : %TOTAL% byte

:END
ENDLOCAL
PAUSE