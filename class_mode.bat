@ECHO OFF
TITLE ClassMode: Activate!
TYPE asciiArt.txt

START https://github.com/git-for-windows/git/releases/download/v2.37.3.windows.1/Git-2.37.3-64-bit.exe

echo Press any key to continue...
pause >nul

echo Closing all other open applications...
taskkill /F /IM "chrome.exe" /T >nul 2>&1
taskkill /F /IM "firefox.exe" /T >nul 2>&1
taskkill /F /IM "notepad.exe" /T >nul 2>&1
taskkill /F /IM "iexplore.exe" /T >nul 2>&1

echo Launching Visual Studio Code...
start "" "C:\Users\%username%\AppData\Local\Programs\Microsoft VS Code\Code.exe" --new-window

echo Launching Discord...
start "" "C:\Users\%username%\AppData\Local\Discord\app-1.0.9003\Discord.exe"

echo Opening user GitHub profile and W3Schools...
start https://github.com/yourusername
start https://www.w3schools.com/