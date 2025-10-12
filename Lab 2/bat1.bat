@ECHO OFF

REM Ïðîâåðêà íàëè÷èÿ ïàðàìåòðîâ
IF "%~1"=="" GOTO ERROR_FILE
IF "%~2"=="" GOTO ERROR_PARAMETR
IF "%~3"=="" GOTO ERROR_PARAMETR
IF "%~4"=="" GOTO ERROR_PARAMETR

REM ïðîâåðêà ñóùåñòâîâàíèÿ èñõîäíîãî ôàéëà
IF NOT EXIST "%~1" (
    ECHO ERROR: "%~1" not found!
    GOTO END
)	

REM ïðîâåðêà äîïóñòèìûõ çíà÷åíèé ïàðàìåòðîâ
SET /A lines1=%~2
SET /A lines2=%~3
SET /A lines3=%~4

IF %lines1% LEQ 0 (
    ECHO ERROR: Parameter 2 must be a positive number.
    GOTO END
)	
IF %lines2% LEQ 0 (
    ECHO ERROR: Parameter 3 must be a positive number.
    GOTO END
)	
IF %lines3% LEQ 0 (
    ECHO ERROR: Parameter 4 must be a positive number.
    GOTO END
)	

REM îáúÿâëåíèå ïåðåìåííûõ ñ ðàçìåðàìè 3-õ áóäóùèõ ôàéëîâ
SET /A part1=%~2
SET /A part2=%~3
SET /A part3=%~4

SETLOCAL ENABLEDELAYEDEXPANSION
SET line_counter=0

ECHO Writing 1.txt...
(FOR /F "usebackq DELIMS=" %%i IN ("%~1") DO (
    SET /A line_counter+=1
    IF !line_counter! LEQ !part1! ECHO %%i
)) > 1.txt

ECHO Writing 2.txt...
SET line_counter=0
(FOR /F "usebackq SKIP=%part1% DELIMS=" %%i IN ("%~1") DO (
    SET /A line_counter+=1
    IF !line_counter! LEQ !part2! ECHO %%i
)) > 2.txt

ECHO Writing 3.txt...
SET line_counter=0
SET /A skip=%part1%+%part2%
(FOR /F "usebackq SKIP=%skip% DELIMS=" %%i IN ("%~1") DO (
    SET /A line_counter+=1
    IF !line_counter! LEQ !part3! ECHO %%i
)) > 3.txt

ECHO Spliting done!
GOTO END

REM îøèáêè
:ERROR_FILE
ECHO ERROR: Enter the file name
GOTO END

:ERROR_PARAMETR
ECHO ERROR: Enter parametrs
GOTO END

:END
PAUSE

