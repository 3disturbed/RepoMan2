@echo off

:: Welcome message
echo Welcome to RepoMan2 Environment Setup Wizard

:: Prompt for GitHub repository URL
set /p REPO="Enter the GitHub repository URL: "
if "%REPO%"=="" (
    echo Error: Repository URL cannot be empty.
    pause
    exit /b 1
)

:: Prompt for admin email
set /p ADMIN_EMAIL="Enter the admin email address (for notifications): "
if "%ADMIN_EMAIL%"=="" (
    echo Error: Admin email cannot be empty.
    pause
    exit /b 1
)

:: Prompt for email user
set /p EMAIL_USER="Enter the email address for sending notifications: "
if "%EMAIL_USER%"=="" (
    echo Error: Email user cannot be empty.
    pause
    exit /b 1
)

:: Prompt for email password
set /p EMAIL_PASS="Enter the password for the email user: "
if "%EMAIL_PASS%"=="" (
    echo Error: Email password cannot be empty.
    pause
    exit /b 1
)

:: Prompt for check interval
set /p CHECK_INTERVAL="Enter the check interval in minutes (default is 30): "
if "%CHECK_INTERVAL%"=="" (
    set CHECK_INTERVAL=30
)
set /a CHECK_INTERVAL_MS=%CHECK_INTERVAL%*60*1000

:: Create the .env file
echo Creating .env file...

(   echo REPO=%REPO%
    echo ADMIN_EMAIL=%ADMIN_EMAIL%
    echo EMAIL_USER=%EMAIL_USER%
    echo EMAIL_PASS=%EMAIL_PASS%
    echo CHECK_INTERVAL=%CHECK_INTERVAL_MS%
) > .env

:: Display success message
echo .env file created successfully!
echo.
echo Contents of .env file:
type .env

echo.
echo Setup complete. You can now run RepoMan2.
pause

