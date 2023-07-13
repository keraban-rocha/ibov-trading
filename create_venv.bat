@echo off
set VENV_DIR=venv

REM Check if virtual environment exists
if exist "%VENV_DIR%\Scripts\activate.bat" (
    echo Activating existing virtual environment...
    call %VENV_DIR%\Scripts\activate.bat
    echo Installing required packages...
    pip install -r requirements.txt
) else (
    echo Creating new virtual environment...
    python -m venv %VENV_DIR%
    call %VENV_DIR%\Scripts\activate.bat

    echo Installing required packages...
    pip install -r requirements.txt
)

echo Virtual environment setup complete.