@echo off
setlocal
cd /d "%~dp0"
set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
where py >nul 2>nul
if not errorlevel 1 (
  start "Mahfel Server" cmd /k py -3 -m http.server 8000
  timeout /t 2 /nobreak >nul
  if exist "%CHROME%" (start "" "%CHROME%" "http://localhost:8000/") else (start "" "http://localhost:8000/")
  exit /b
)
where python >nul 2>nul
if not errorlevel 1 (
  start "Mahfel Server" cmd /k python -m http.server 8000
  timeout /t 2 /nobreak >nul
  if exist "%CHROME%" (start "" "%CHROME%" "http://localhost:8000/") else (start "" "http://localhost:8000/")
  exit /b
)
echo Python was not found. Opening the offline preview in Chrome.
if exist "%CHROME%" (start "" "%CHROME%" "%~dp0index.html") else (start "" "%~dp0index.html")
echo For full media features install Python 3 or use VS Code Live Server.
pause
