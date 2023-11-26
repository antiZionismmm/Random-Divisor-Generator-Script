@echo off
setlocal enabledelayedexpansion

REM Input the number
set /p inputNumber="Enter a number: "

REM Input the value of n
set /p n="Enter the value of n: "

:retry
REM Initialize variables
set /a remainingNumber=%inputNumber%
set divisors=

REM Loop to generate n random integers
for /l %%i in (1,1,%n%) do (
    set /a "randomNumber=!random! %% remainingNumber + 1"
    set "divisors=!divisors!!randomNumber!"

    REM Add a comma after each divisor (except the last one)
    if %%i lss %n% set "divisors=!divisors!,"
    set /a remainingNumber-=!randomNumber!
)

REM Check if the sum is equal to the entered number
if %remainingNumber% neq 0 goto retry

echo Divisors: %divisors%

REM Display a message and wait for a key press
echo.
echo Press any key to close...
pause > nul

endlocal