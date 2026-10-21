@echo off
setlocal EnableExtensions
title Saudi Fix Cleaner
color 0B

:: ============================================================
::  Saudi Fix Cleaner
::  Removes temporary files, empties the Recycle Bin on all
::  drives, and flushes the DNS resolver cache.
:: ============================================================

:: --- Require administrator rights ---------------------------
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo  [ERROR] Administrator rights are required.
    echo          Right-click SaudiFix.bat and choose "Run as administrator".
    echo.
    pause
    exit /b 1
)

echo.
echo  ============================================================
echo    SAUDI FIX CLEANER
echo  ============================================================
echo.
echo  Tasks:
echo    1. User temporary files      (%%TEMP%%)
echo    2. Windows temporary files   (C:\Windows\Temp)
echo    3. Recycle Bin               (all drives)
echo    4. DNS resolver cache
echo.
echo  Close open programs before continuing.
echo  Press any key to start, or close this window to cancel.
pause >nul

:: --- 1. User temp (contents only; folder and permissions kept)
echo.
echo  [1/4] Cleaning user temporary files...
del /s /f /q "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

:: --- 2. Windows temp (contents only) ------------------------
echo  [2/4] Cleaning Windows temporary files...
del /s /f /q "%SystemRoot%\Temp\*" >nul 2>&1
for /d %%D in ("%SystemRoot%\Temp\*") do rd /s /q "%%D" >nul 2>&1

:: --- 3. Recycle Bin on every drive --------------------------
echo  [3/4] Emptying Recycle Bin...
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1

:: --- 4. DNS cache -------------------------------------------
echo  [4/4] Flushing DNS resolver cache...
ipconfig /flushdns >nul

echo.
echo  ============================================================
echo    Done. Files in use by running programs were skipped.
echo  ============================================================
echo.
pause
endlocal
