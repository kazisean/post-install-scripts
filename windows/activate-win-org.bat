@echo off

REM Get the original product key
for /f "tokens=2 delims=," %%A in ('wmic path softwarelicensingservice get OA3xOriginalProductKey') do (
    set "product_key=%%A"
)

REM Check if the product key was successfully retrieved
if not defined product_key (
    echo Error: Unable to retrieve the product key.
    exit /b
)

REM Activate Windows using the product key
slmgr.vbs /ipk %product_key%
Slmgr /ato
if %errorlevel% neq 0 (
    echo Error: Activation failed. Please check the product key.
    exit /b
)

echo Windows has been successfully activated!