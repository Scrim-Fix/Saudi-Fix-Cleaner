@echo off
title Saudi Fix Professional Tool
color 0B

:: ==========================================
::    SAUDI FIX CLEANER - PRO VERSION
:: ==========================================

echo.
echo  #################################################################
echo  #                                                               #
echo  #   XXXXX   XXXX   X   X  XXXX   XXXXX      XXXXX  XXXXX  X   X  #
echo  #   X      X    X  X   X  X   X    I        X        I     X X   #
echo  #   XXXXX  XXXXXX  X   X  X   X    I        XXXX     I      X    #
echo  #       X  X    X  X   X  X   X    I        X        I     X X   #
echo  #   XXXXX  X    X  XXXXX  XXXX   XXXXX      X      XXXXX  X   X  #
echo  #                                                               #
echo  #################################################################
echo.
echo              WELCOME BACK, COMMANDER SAUDI FIX
echo  -----------------------------------------------------------------
echo.
echo  [!] Status: Ready for Deep Cleaning
echo.
echo  Press ANY KEY to start cleaning process...
pause >nul

:: 1. User Temp
echo.
echo  [-] Cleaning User Temp...
del /s /f /q "%temp%\*.*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
md "%temp%" >nul 2>&1

:: 2. System Temp
echo  [-] Cleaning Windows Temp...
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
rd /s /q "C:\Windows\Temp" >nul 2>&1
md "C:\Windows\Temp" >nul 2>&1

:: 3. Prefetch
echo  [-] Cleaning Prefetch...
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1

:: 4. Recycle Bin
echo  [-] Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin >nul 2>&1

:: 5. Internet DNS Cache
echo  [-] Flushing Internet DNS Cache...
ipconfig /flushdns >nul

echo.
echo  =================================================================
echo.
echo        MISSION ACCOMPLISHED YA SAUDI FIX!
echo           (Internet and System Cleaned)
echo.
echo  =================================================================
pause