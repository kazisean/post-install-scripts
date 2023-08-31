@echo off
setlocal EnableDelayedExpansion

set "curdir=%cd%"

:menu
cls
echo Main Menu:
set /a cnt=0
for /D %%D in (*) do (
  set /a cnt+=1 
  echo !cnt! - %%~nxD
)
echo 0 - Exit
set /p "choice=Enter your choice: "
if "!choice!"=="0" goto :EOF
if "!choice!" GEQ "1" if "!choice!" LEQ "!cnt!" (
  set /a choice-=1
  for /D %%D in (*) do (
    if !choice! EQU 0 (
      cd "%%D"
      goto :innermenu
    ) else (
      set /a choice-=1
    )
  )
)
echo Invalid choice.
goto :menu

:innermenu
cls
echo Current directory: %cd%
echo - Go back
echo Files:
set /a cnt=0
for %%F in (*) do (
  set /a cnt+=1
  echo !cnt! - %%~nxF
)
set /p "choice=Enter your choice: "
if "!choice!"=="-" goto :menu
if "!choice!" GEQ "1" if "!choice!" LEQ "!cnt!" (
  set /a choice-=1
  for %%F in (*) do (
    if !choice! EQU 0 (
      if /i "%%~xF"==".reg" (
        reg import "%%F" >nul 2>&1
        echo Imported %%~nxF
      ) else if /i "%%~xF"==".bat" (  
        call "%%F"
        echo Ran %%~nxF
      ) else if /i "%%~xF"==".ps1" (
        powershell.exe -ExecutionPolicy bypass -File ".\%%F" -ExecutionPolicy RemoteSigned >nul 2>&1
        echo Ran %%~nxF
      ) else (
        echo %%~nxF
      )
      goto :innermenu
    ) else (
      set /a choice-=1
    )
  )  
)
echo Invalid choice.
goto :innermenu