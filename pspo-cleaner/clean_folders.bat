@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: CONFIGURATION: ADD YOUR FOLDER PATHS HERE
:: ==========================================
:: Add as many folders as you want. 
:: Wrap paths in quotation marks if they contain spaces.

set "FOLDERS[1]=C:\path\to\your\first\folder"
set "FOLDERS[2]=C:\path\to\your\second\folder"
set "FOLDERS[3]=D:\another\folder\to\empty"

:: ==========================================
:: MAIN EXECUTION ROUTINE
:: ==========================================
echo Starting cleanup process...
echo ------------------------------------------

for /L %%i in (1,1,100) do (
    if defined FOLDERS[%%i] (
        set "TARGET_DIR=!FOLDERS[%%i]!"
        
        if exist "!TARGET_DIR!" (
            echo Cleaning: "!TARGET_DIR!"
            
            :: Delete all files quietly without asking for confirmation
            del /q /f /s "!TARGET_DIR!\*.*" >nul 2>&1
            
            :: Delete all subfolders and their contents
            for /d %%p in ("!TARGET_DIR!\*") do (
                rd /s /q "%%p" >nul 2>&1
            )
            
            echo Status: Success (Folder is now empty)
        ) else (
            echo Status: Skipped (Folder does not exist) - "!TARGET_DIR!"
        )
        echo ------------------------------------------
    )
)

echo Cleanup complete!
pause
