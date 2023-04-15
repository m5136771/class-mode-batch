@echo off
cls

:countdown
for /L %%i in (3,-1,1) do (
    echo %%i...
    timeout /t 1 /nobreak >nul
)

echo Git download page
echo Press any key when ready...
pause >nul

:github_account
echo.
set /p "github_account=Do you have a GitHub account? (yes/no): "
if /I "%github_account%"=="yes" (
    echo Opening GitHub login page in:
    call :countdown
    start https://github.com/login
) else if /I "%github_account%"=="no" (
    echo Opening GitHub join page in:
    call :countdown
    start https://github.com/join
) else (
    echo Invalid input. Please enter yes or no.
    goto github_account
)

:folder_check
echo.
set /p "folder_check=Do you already have a dedicated folder for coding projects? (yes/no): "
if /I "%folder_check%"=="yes" (
    set /p "folder_directory=Enter the directory of your coding projects folder: "
) else if /I "%folder_check%"=="no" (
    goto create_folder
) else (
    echo Invalid input. Please enter yes or no.
    goto folder_check
)

:create_folder
echo.
set /p "create_now=Do you want to create a new folder for coding projects now? (yes/no): "
if /I "%create_now%"=="yes" (
    set /p "folder_name=Enter the name of the new folder: "
    mkdir "%USERPROFILE%\Desktop\%folder_name%"
) else if /I "%create_now%"=="no" (
    goto github_repo
) else (
    echo Invalid input. Please enter yes or no.
    goto create_folder
)

:github_repo
echo.
set /p "github_webpage=Do you have a GitHub webpage repo already? (yes/no): "
if /I "%github_webpage%"=="no" (
    set /p "github_username=Enter your GitHub username: "
    mkdir "%USERPROFILE%\Desktop\%folder_name%\%github_username%.github.io"
)

echo Press any key when ready...
pause >nul

echo VS Code download page
echo Opening VS Code download page in:
call :countdown
start https://code.visualstudio.com/download

exit /b