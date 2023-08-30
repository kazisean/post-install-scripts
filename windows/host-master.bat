@echo off
setlocal enabledelayedexpansion

set "webhook_url=ENTER YOUR OWN SLACK WEBHOOK URL HERE"

REM keep format the same do not add any extra quotes or remove any just delete from first E to last E and copy paste your link





REM Initialize variables
set "error_message="

REM Get Serial Number
for /f "tokens=2 delims==" %%A in ('wmic bios get serialnumber /value') do (
    set "serial_number=%%A"
)

REM Get Operating System
for /f "tokens=2 delims==" %%A in ('wmic os get caption /value') do (
    set "operating_system=%%A"
)

REM Get MAC Address
for /f "tokens=2 delims=:" %%A in ('getmac /fo table ^| find "-"') do (
    set "mac_address=%%A"
    set "mac_address=!mac_address:-=!"
)

REM Get Computer Model
for /f "tokens=2 delims==" %%A in ('wmic computersystem get model /value') do (
    set "computer_model=%%A"
)

REM Get Computer RAM Size in bytes
for /f "tokens=2 delims= " %%A in ('wmic memorychip get capacity /value ^| find "="') do (
    set "ram_size=%%A"
)

REM Convert RAM Size to GB
set /a "ram_size_gb=ram_size / 1024 / 1024 / 1024"

REM Get Disk Size (in bytes)
for /f "tokens=2" %%A in ('wmic diskdrive get size /value ^| find "="') do (
    set "disk_size=%%A"
)

REM Convert Disk Size to GB
set /a "disk_size_gb=disk_size / 1024 / 1024 / 1024"

REM Get TeamViewer ClientID from Registry
for /f "tokens=2 delims==" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\TeamViewer" /v ClientID ^| find "ClientID"') do (
    set "client_id=%%A"
)

REM Send Data to Slack
set "data=Serial Number: !serial_number!, Operating System: !operating_system!, MAC Address: !mac_address!, Computer Model: !computer_model!, RAM Size (GB): !ram_size_gb!, Disk Size (GB): !disk_size_gb!, TeamViewer ClientID: !client_id!"

REM Post data to Slack webhook
curl -X POST -H "Content-type: application/json" -d "{\"text\": \"%data%\"}" %webhook_url%

REM Exit with an error message if any command failed
if defined error_message (
    echo %error_message%
    exit /b 1
)

REM Exit without errors
exit /b 0

