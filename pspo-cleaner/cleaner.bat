@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: CONFIGURATION
:: ==========================================

:: 1. List the subfolders you want to empty (separated by spaces)
:: set "TARGET_FOLDERS=Documents Desktop Downloads"
set "TARGET_FOLDERS=Documents Desktop Downloads Music Videos Pictures"
:: 2. List the profile names you want to EXCLUDE (separated by spaces)
:: Always exclude Public and Default to keep Windows stable.
set "EXCLUDED_PROFILES=Public Default administrator Guest"

:: ==========================================
:: PROCESS START
:: ==========================================
echo Starting profile cleanup...
echo ----------------------------------------

:: Loop through all directories in C:\Users
for /d %%P in ("C:\Users\*") do (
    set "PROFILE_NAME=%%~nxP"
    set "SKIP="

    :: Check if the current profile is in the exclusion list
    for %%E in (%EXCLUDED_PROFILES%) do (
        if /i "!PROFILE_NAME!"=="%%E" (
            set "SKIP=1"
        )
    )

    :: If not excluded, proceed to check subfolders
    if not defined SKIP (
        echo Processing profile: !PROFILE_NAME!
        
        :: Loop through each target folder specified in configuration
        for %%F in (%TARGET_FOLDERS%) do (
            set "FULL_PATH=%%~fP\%%F"
            
            if exist "!FULL_PATH!" (
                echo   [FOUND] Cleaning: !FULL_PATH!
                
                :: Delete all files inside silently and forcefully
                ::del /q /f /s "!FULL_PATH!\*.*" >nul 2>&1
                echo "Removing $FULL_PATH"
                :: Delete all subdirectories inside but keep the root target folder
                for /d %%D in ("!FULL_PATH!\*") do (
                    rd /s /q "%%D" >nul 2>&1
                )
            ) else (
                echo   [SKIP]  Not found: %%F
            )
        )
        echo ----------------------------------------
    ) else (
        echo Skipping excluded profile: !PROFILE_NAME!
        echo ----------------------------------------
    )
)

echo Cleanup process finished.
pause
