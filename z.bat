@ECHO OFF
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

:: ECHO OFF
:: Define vars
::spc has 20 spaces
set spc=     

cls
:: Skip over with this by using the following line commented or not
GOTO PROMPT_ME


:: This batch file details
TITLE My System info
ECHO %spc%Plesae Wait.....
:: Sec 1
ECHO Windows info
ECHO ======================== System Information All systeminfo -- Begin
systeminfo
ECHO.
ECHO ======================== System Information All systeminfo -- End

::systeminfo | findstr /c:"OS Name"
::systeminfo | findstr /c:"Version"
::systeminfo | findstr /c:"System Type"

:: Sec 2
ECHO ========================
ECHO Hardware info
ECHO ========================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic path win32_videocontroller get name
wmic path win34_videocontroller get name

:: Sec 2
ECHO ========================
ECHO Network info
ECHO ========================
ipconfig | findstr IPv4
ipconfig | findstr IPv6
ECHO ==========
ECHO end info
ECHO ==========
echo.
echo.

:PROMPT_ME

:MENU
ECHO [33m=====================================================================================[0m
ECHO %spc%[45m===------[0m [32mSET NODE_DEBUG ENVIONMENTAL VARIABLE SECTION ===[0m
ECHO [33m=====================================================================================[0m
::color 07
ECHO %spc%Enter the mode for this run using NODE_DEBUG environmental variable
ECHO %spc%     (choosing 1 - 7 will SET the NODE_DEBUG to that choice)
ECHO %spc%  ie... SET NODE_DEBUG=config if you chose 1
ECHO.
ECHO %spc% WARNING: check this batch file code at the END tag label before you use 
ECHO %spc%                  ( 1 - 7 or c, d, s, n )
ECHO %spc%     Make any adjustments OR just don't choose ( 1 - 7 or c, d, s, n )
ECHO [33m=====================================================================================[0m
ECHO.
ECHO %spc%1. config
ECHO %spc%2. data
ECHO %spc%3. handlers
ECHO %spc%4. helpers
ECHO %spc%5. server
ECHO %spc%6. workers
ECHO %spc%7. http
ECHO.
ECHO %spc%[45m===------[0m [32mNODE PACKAGES TO TEST SECTION ===[0m
ECHO [33m=====================================================================================[0m
ECHO %spc%   A couple of these test require you to open two terminals
ECHO %spc%  in order to see the terminals pass data back and forth
ECHO [33m=====================================================================================[0m
ECHO.
ECHO %spc% 8. HTTP2
ECHO %spc% 9. VM
ECHO %spc%10. UDP/Datagram
ECHO %spc%11. NET
ECHO %spc%12. TLS/SSL
ECHO %spc%13. REPL
ECHO %spc%14. Async Hooks
ECHO %spc%15. Exit -- Just stop this bat file (drive yourself)
echo.
ECHO %spc%[45m===------[0m [32mDURING DEVELOPMENT TEST SECTION ===[0m
ECHO [33m=====================================================================================[0m
ECHO %spc%  The options below are for testing some of THIS API packages during devMode
ECHO %spc%   cluster -- debug -- strict
ECHO %spc%  in order to change which messages will be logged
ECHO [33m=====================================================================================[0m
ECHO.
ECHO %spc%Type c hit enter  if you want [ node index-cluster.js ] to be run
ECHO %spc%Type d hit enter  if you want [ node index-debug.js ] to be run
ECHO %spc%Type s hit enter  if you want [ node index-strict.js ] to be run
ECHO %spc%Type n hit enter  if you want [ node index.js ] to be run
ECHO.
ECHO %spc%[ postman was what I used while building this API all routes are listed ]
ECHO %spc%[ in the server.js file ]
echo.
ECHO [33m=====================================================================================[0m
echo.

set /p web=Type option or just type 15 or .exit : 
if "%web%"=="1" goto CONFIG
if "%web%"=="2" goto DATA
if "%web%"=="3" goto HANDLERS
if "%web%"=="4" goto HELPERS
if "%web%"=="5" goto SERVER
if "%web%"=="6" goto WORKERS
if "%web%"=="7" goto HTTP
if "%web%"=="8" goto HTTP2
if "%web%"=="9" goto VM
if "%web%"=="10" goto UDP
if "%web%"=="11" goto NET1
if "%web%"=="12" goto TLS
if "%web%"=="13" goto REPL
if "%web%"=="14" goto ASYNCHOOKS
if "%web%"=="15" goto END1
if "%web%"=="c" goto c
if "%web%"=="d" goto d
if "%web%"=="s" goto s
if "%web%"=="n" goto n

GOTO END

:CONFIG 
SET NODE_DEBUG=config
echo config

GOTO END

:DATA 
SET NODE_DEBUG=data
GOTO END

:HANDLERS 
SET NODE_DEBUG=handlers
GOTO END

:HELPERS 
SET NODE_DEBUG=helpers
GOTO END

:SERVER 
SET NODE_DEBUG=server
GOTO END

:WORKERS 
SET NODE_DEBUG=workers
GOTO END

:HTTP 
SET NODE_DEBUG=http
GOTO END

:n
ECHO [33m=====================================================================================[0m
ECHO Starting node index-cluster.js
ECHO [33m=====================================================================================[0m
::node --inspect=192.168.1.166:3000 index.js
node index.js
::node inspect
GOTO END

:c
ECHO [33m=====================================================================================[0m
ECHO Starting node index-cluster.js
ECHO [33m=====================================================================================[0m
node index-cluster.js
GOTO END

:d
ECHO [33m=====================================================================================[0m
ECHO Starting node index-debug.js
ECHO [33m=====================================================================================[0m
node index-debug.js
GOTO END

:s
ECHO [33m=====================================================================================[0m
ECHO Starting node index-strict.js
ECHO [33m=====================================================================================[0m
node index-strict.js
GOTO END

:HTTP2
cls
ECHO [33m=====================================================================================[0m
ECHO Starting server .. on port 6000
ECHO     you should open another dos promt now to start a client
ECHO     use 
ECHO        node misc/http2-client.js
ECHO     to start client
ECHO [33m=====================================================================================[0m
node misc/http2-server.js
GOTO SERVERUP

:VM
cls
node misc/vm.js
GOTO END1

:UDP
cls
ECHO [33m=====================================================================================[0m
ECHO Starting server .. on port 6000
ECHO     you should open another dos promt now to start a client
ECHO     use 
ECHO        node misc/udp-client.js
ECHO     to start client
ECHO [33m=====================================================================================[0m
node misc/udp-server.js
GOTO SERVERUP

:NET1
cls
ECHO [33m=====================================================================================[0m
ECHO Starting server .. on port 6000
ECHO     you should open another dos promt now to start a client
ECHO     use 
ECHO        node misc/net-client.js
ECHO     to start client
ECHO [33m=====================================================================================[0m
node misc/net-server.js
GOTO SERVERUP

:TLS
cls
ECHO [33m=====================================================================================[0m
ECHO Starting server .. on port 6000
ECHO     you should open another dos promt now to start a client
ECHO     use 
ECHO        node misc/tls-client.js
ECHO     to start client
ECHO [33m=====================================================================================[0m
node misc/tls-server.js
GOTO SERVERUP

:REPL
cls
ECHO [33m=====================================================================================[0m
echo.
::ECHO =========================================================================
ECHO Starting repl with no server!
ECHO     you should type something and watch repl Evaluate (eval) in action
ECHO if you include 'fizz' (case sensitive) the code will reply with 'buzz'
ECHO    TYPE .exit to end
echo.
ECHO [33m=====================================================================================[0m
echo.
node misc/repl.js
GOTO SERVERUP

:ASYNCHOOKS
cls
ECHO [33m=====================================================================================[0m
ECHO Starting asyncHooks no server!
ECHO   Hooks -- NOTE: careful about using console.logs in hooks that are set on an interval
ECHO   as this could create an endless loop
ECHO  == == == == == == == dont worry i stopped it on 6
ECHO   IT WILL TEXT every sec TO STOP it hit ctrl c
ECHO [33m=====================================================================================[0m
node misc/asyncHooks.js
GOTO SERVERUP

::note use : end at bottom at times
:END 

SET NODE_ENV=staging
SET HTTP_PORT=3000
SET HTTPS_PORT=3001
SET HTTP_PORT_PROD=5000
SET HTTPS_PORT_PORT=5001

ECHO All Done....
GOTO SERVERUP
::note some options above are not needed unless you are developing
::so those are passed here to avoid the SET statements
:END1
ECHO exiting.....
cls
GOTO SERVERUP

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
GOTO SERVERUP

:SERVERUP
:: Used for when a server gets fired to leave it run
