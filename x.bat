@echo off
set NUM=0 1 2 3 4 5 6 7 8 9 A B C D E F
@REM for %%x in (%NUM%) do ( 
@REM   color 0%%x
@REM   timeout 1 >nul
@REM   echo color -- 0%%x
@REM   echo Change
@REM )
    @REM 0 = Black       8 = Gray
    @REM 1 = Blue        9 = Light Blue
    @REM 2 = Green       A = Light Green
    @REM 3 = Aqua        B = Light Aqua
    @REM 4 = Red         C = Light Red
    @REM 5 = Purple      D = Light Purple
    @REM 6 = Yellow      E = Light Yellow
    @REM 7 = White       F = Bright White

@Echo Off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
call :colorEcho 0e "Hello "
call :colorEcho 0a " World"
pause
exit
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i

