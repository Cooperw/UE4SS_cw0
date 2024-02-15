
@echo off
setlocal enabledelayedexpansion

rem Check if the script is in the correct directory
set "current_dir=%cd%"
for %%F in ("%current_dir%") do set "last_dir=%%~nxF"
if /I not "%last_dir%"=="Win64" (
    if /I not "%last_dir%"=="WinGDK" (
        echo Error: Please run this script from the Pal\Binaries\Win64 ^(PC^) or Pal\Binaries\WinGDK ^(Xbox^) directory.
        echo Press any key to continue...
        pause > nul
        exit /b 1
    )
)

rem Delete old UE4SS files
echo Deleting existing files...
del /s /q UE4SS*
del /s /q README*
del /s /q dwmapi*
del /s /q xinput*
del /s /q Changelog*
del /s /q crash*
del /s /q Mods\mods.txt
rmdir /s /q Mods\ActorDumperMod
rmdir /s /q Mods\BPModLoaderMod
rmdir /s /q Mods\BPML_GenericFunctions
rmdir /s /q Mods\CheatManagerEnablerMod
rmdir /s /q Mods\ConsoleCommandsMod
rmdir /s /q Mods\ConsoleEnablerMod
rmdir /s /q Mods\jsbLuaProfilerMod
rmdir /s /q Mods\Keybinds
rmdir /s /q Mods\LineTraceMod
rmdir /s /q Mods\shared
rmdir /s /q Mods\SplitScreenMod

rem Download the new zip file
echo Downloading new zip file...
powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/Cooperw/UE4SS_cw0/releases/download/UE4SS_v3.0.1/UE4SS_3_0_1.zip', 'UE4SS_3_0_1.zip')"

rem Unzip the downloaded file
echo Unzipping new file...
powershell Expand-Archive -Path UE4SS_3_0_1.zip -DestinationPath .

rem Clean up temporary files
echo Cleaning up...
del /q UE4SS_3_0_1.zip


del /s /q FixInstall*
echo Process completed successfully.
echo Press any key to continue...
pause > nul
echo Key pressed. Exiting...
exit /b 0
