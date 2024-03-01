@echo off
SETLOCAL

:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges.
    echo Please right-click the script and select 'Run as administrator'.
    exit /b
)

:: Check for Git
echo Checking for Git...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Git is not installed.
    echo SUGGESTION: Please install Git from https://git-scm.com/ and run this script again.
    goto end
)

:: Check for Python
echo Checking for Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed.
    echo SUGGESTION: Please install Python from https://www.python.org/ and run this script again.
    goto end
)

:: Determine package manager
SET PACKAGE_MANAGER=npm
where yarn >nul 2>&1
if %errorlevel% eq 0 SET PACKAGE_MANAGER=yarn

echo.
echo Using %PACKAGE_MANAGER% as the package manager.
echo.

echo Cloning Bespoke Automata repository...
git clone https://github.com/C0deMunk33/bespoke_automata 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Failed to clone Bespoke Automata repository.
    echo SUGGESTION: Check your internet connection and access to https://github.com/C0deMunk33/bespoke_automata.
    goto end
)

cd bespoke_automata

echo Installing dependencies...
%PACKAGE_MANAGER% install
if %errorlevel% neq 0 (
    echo ERROR: Dependency installation failed.
    echo SUGGESTION: Check if %PACKAGE_MANAGER% is correctly installed and run this script again.
    goto end
)

:: Here, you can add commands to configure GPU support if necessary

echo.
echo Launching Bespoke Automata API...
cd APIs
start cmd /k python omni_api.py

echo.
echo Setting up the back end and deploying brains...
cd ../bespoke_manager
start cmd /k node server.js

echo.
echo Bespoke Automata installation and setup is complete.
echo Please check the opened command prompts for further logs and ensure the servers are running.
pause

:end
ENDLOCAL
