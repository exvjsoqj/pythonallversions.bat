@echo off
cls

:menu
cls
:: Display menu
echo 1. INSTALL ALL VERSIONS
echo 2. UNINSTALL ALL VERSIONS
echo 3. EXIT

:: Prompt user for selection
set /p choice="Enter your choice: "

:: Check user choice and execute corresponding section
if "%choice%"=="1" goto :install
if "%choice%"=="2" goto :uninstall
if "%choice%"=="3" goto :exit

:: Invalid choice, re-prompt
echo Invalid choice. Please try again.
pause
goto :menu

:install
echo Installing Python versions...

:: Install PyCharm
rem start /b /wait winget install -e --id JetBrains.PyCharm.Community

:: Install Python Launcher
start /b /wait winget install -e --id Python.Launcher 

:: Install Python versions
for %%v in (
    Python.Python.2 
    Python.Python.3.1 
    Python.Python.3.2 
    Python.Python.3.3 
    Python.Python.3.4 
    Python.Python.3.5 
    Python.Python.3.6 
    Python.Python.3.7 
    Python.Python.3.8 
    Python.Python.3.9 
    Python.Python.3.10 
    Python.Python.3.11 
    Python.Python.3.12 
    Anaconda.Anaconda3 
    Anaconda.Miniconda3 
) do (
    start /b /wait winget install -e --id %%v
)

echo All specified Python versions have been installed.
pause
goto :menu

:uninstall
echo Uninstalling Python versions...

:: Uninstall PyCharm
rem start /b /wait winget uninstall -e --id JetBrains.PyCharm.Community --all-versions

:: Uninstall Python Launcher
start /b /wait winget uninstall -e --id Python.Launcher --all-versions

:: Uninstall Python versions
for %%v in (
    Python.Python.2 
    Python.Python.3.1 
    Python.Python.3.2 
    Python.Python.3.3 
    Python.Python.3.4 
    Python.Python.3.5 
    Python.Python.3.6 
    Python.Python.3.7 
    Python.Python.3.8 
    Python.Python.3.9 
    Python.Python.3.10 
    Python.Python.3.11 
    Python.Python.3.12 
    Anaconda.Anaconda3 
    Anaconda.Miniconda3 
) do (
    rem Check for multiple versions and uninstall all if present
    for /f "tokens=*" %%i in ('winget list --id %%v') do (
        if "%%i" neq "" (
            echo Uninstalling %%v version
            start /b /wait winget uninstall -e --id %%v --all-versions
        )
    )
)

echo All specified Python versions have been uninstalled.
pause
goto :menu

:exit
echo Exiting the script.
exit /b
