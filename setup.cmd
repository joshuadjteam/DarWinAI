@echo off
cls

echo Welcome to DarwinAI's Setup!
echo DarwinAI is based from DJTeam and Gemma AI.
echo Here is what will happen
echo 1. We will install (or upgrade) required applications.
echo 2. Install these apps to a directory (Mainly C:\DarwinAI\).
echo 3. You will manually add your API key after installation.
echo After the installation, you may access your mate, DarwinAI.
echo Made proudly by the DJK, Gemma AI, and DJTeam.
echo.
echo When you are ready, press a key to install or upgrade app(s) needed.
pause

echo.
echo Installing/Upgrading required applications (curl and jq)...
winget install curl
winget install jqlang.jq
echo Application installation/upgrade complete.

echo.
echo Creating installation directory: C:\DarwinAI\
cd C:\
mkdir DarwinAI 2>NUL
rem Navigate into the directory, regardless if it was newly created or already existed
cd DarwinAI

setlocal

set "DOWNLOAD_URL=https://github.com/joshuadjteam/DarWinAI/releases/download/InstallBlobs/DarwinAI.zip"
set "ZIP_FILENAME=DarwinAI.zip"
rem The current directory is already C:\DarwinAI, so we can use . for destination

echo.
echo Downloading %ZIP_FILENAME%...
curl -L --ssl-no-revoke -o "%TEMP%\%ZIP_FILENAME%" "%DOWNLOAD_URL%"
if %errorlevel% neq 0 (
    echo ERROR: Failed to download %ZIP_FILENAME%. Check URL and internet connection.
    echo Please resolve the issue and try running setup.cmd again.
    pause
    goto :eof
)
echo Download complete.

echo.
echo Extracting %ZIP_FILENAME% to %CD%...
powershell -Command "Expand-Archive -Path '%TEMP%\%ZIP_FILENAME%' -DestinationPath '%CD%' -Force"
if %errorlevel% neq 0 (
    echo ERROR: Failed to extract %ZIP_FILENAME%.
    echo Make sure the ZIP file is not corrupted and you have permissions to write to %CD%.
    echo Please resolve the issue and try running setup.cmd again.
    pause
    goto :eof
)
echo Extraction complete.

rem --- Clean up the downloaded ZIP file ---
echo.
echo Cleaning up temporary files...
del "%TEMP%\%ZIP_FILENAME%" 2>NUL
echo Cleanup complete.

endlocal

echo.
echo Installation complete!
echo.
echo To complete the setup, please manually add your Gemini API Key:
echo 1. Go to https://aistudio.google.com/app/apikey to get your key.
echo 2. Open "C:\DarwinAI\talk_to_ai_with_input.bat" in Notepad.
echo 3. Find the line: set "API_KEY=AIzaSyCMbImhuRkNmnCylt35tq0HQ079dbBKtAg"
echo    (The key shown might be different, replace whatever is there)
echo 4. Replace the key with your own Gemini API Key.
echo 5. Save the file.
echo.
echo You can now access your mate, DarwinAI, from the C:\DarwinAI directory.
echo Double-click "C:\DarwinAI\talk_to_ai_with_input.bat" to start chatting.
pause